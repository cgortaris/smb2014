<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

require_once('../db/dbconfig.php');

$conn = getConnection();
$teams = getTeams();
foreach($teams as $team) { 
    updatePlayersSentiment($team['id'], $team['code']);
    updateTeamSentiment($team['id'], $team['code']);
//    updateTrendingTopics($team['id'], $team['code']);
}
$conn = null;
exit(0);

function getConnection() {
    $conn = new PDO(sprintf('pgsql:dbname=%s;user=%s;password=%s;host=%s', DBNAME, DBUSER, DBPASS, DBHOST));
    return $conn;
}

function getTeams() {
    global $conn;
    $stmt = $conn->prepare('select id, code from team');
    $teams = array();
    if($stmt->execute()) {
        $teams_result = $stmt->fetchAll();
        foreach($teams_result as $ts) {
            $teams[] = array('id' => $ts['id'], 'code' => $ts['code']);
        }
    }
    return $teams;
}

function updatePlayersSentiment($tid, $tc) {
    global $conn;
    $top_current;
    $ids_top_current = array();
    $worst_current;
    $ids_worst_current = array();
    $stats_top;
    $ids_top_stats = array();
    $stats_worst;
    $ids_worst_stats = array();

    // get top_current
    $get_top = $conn->prepare('select p.id as player_id, t.id as team_id, 100.0*(avg(f.sentiment)+20.0)/40.0 as percentage from fact_player f join players p on (f.player_id=p.id) join team t on (p.team_id=t.id) where t.id = ? group by p.id,t.id order by percentage desc limit 3');
    if($get_top->execute(array($tid))) {
        $top_current = $get_top->fetchAll();
        foreach($top_current as $tc) {
            $ids_top_current[] = $tc['player_id'];
        }
    }

    // we finish update process if there's no enough data
    if(count($ids_top_current) == 0) {
        return;
    }

    // get worst_current, excluding already selected players
    $get_worst = $conn->prepare('select p.id as player_id, t.id as team_id, 100.0*(avg(f.sentiment)+20.0)/40.0 as percentage from fact_player f join players p on (f.player_id=p.id) join team t on (p.team_id=t.id) where t.id = ? and p.id not in ('.implode(',', $ids_top_current).') group by p.id,t.id order by percentage asc limit 3');
    if($get_worst->execute(array($tid))) {
        $worst_current = $get_worst->fetchAll();
        foreach($worst_current as $wc) {
            $ids_worst_current[] = $wc['player_id'];
        }
    }

    // we finish update process if there's no enough data
    if(count($ids_worst_current) == 0) {
        return;
    }
   
    // get top_stats
    $get_top_stats = $conn->prepare("select player_id from stats_players where team_id = ? and type = 'top'");
    if($get_top_stats->execute(array($tid))) {
        $top_stats = $get_top_stats->fetchAll();    
        foreach($top_stats as $ts) {
            $ids_top_stats[] = $ts['player_id'];
        }
    }

    // get worst_stats
    $get_worst_stats = $conn->prepare("select player_id from stats_players where team_id = ? and type = 'worst'");
    if($get_worst_stats->execute(array($tid))) {
        $worst_stats = $get_worst_stats->fetchAll();    
        foreach($worst_stats as $ws) {
            $ids_worst_stats[] = $ws['player_id'];
        }
    }
 
    // update the ones in top3 and in stat_top3
    $update_stmt = $conn->prepare("update stats_players set sentiment = ? where player_id = ? and team_id = ? and type = 'top'");
    foreach($top_current as $p) {
        if(in_array($p['player_id'], $ids_top_stats)) {
            if($update_stmt->execute(array(round($p['percentage'], 1), $p['player_id'], $tid))) {
                echo "UPDATED ROWS: ".$update_stmt->rowCount()."\n";
            }
        }
    }

    // update the ones in wors3 and in stat_worst3
    $update_stmt = $conn->prepare("update stats_players set sentiment = ? where player_id = ? and team_id = ? and type = 'worst'");
    foreach($worst_current as $p) {
        if(in_array($p['player_id'], $ids_worst_stats)) {
            if($update_stmt->execute(array(round($p['percentage'], 1), $p['player_id'], $tid))) {
                echo "UPDATED ROWS: ".$update_stmt->rowCount()."\n";
            }
        }
    }

    // insert the ones in top3 and not in stat_top3
    $insert_stmt = $conn->prepare('insert into stats_players (player_id, team_id, type, sentiment) values (?, ?, ?, ?)');
    foreach($top_current as $p) {
        if(!in_array($p['player_id'], $ids_top_stats)) {
            if($insert_stmt->execute(array($p['player_id'], $p['team_id'], 'top', round($p['percentage'], 1)))) {
                echo "INSERTED ROWS: ".$insert_stmt->rowCount()."\n";
            }
        }
    }

    // insert the ones in worst3 and not in stat_worst3
    $insert_stmt = $conn->prepare('insert into stats_players (player_id, team_id, type, sentiment) values (?, ?, ?, ?)');
    foreach($worst_current as $p) {
        if(!in_array($p['player_id'], $ids_worst_stats)) {
            if($insert_stmt->execute(array($p['player_id'], $p['team_id'], 'worst', round($p['percentage'], 1)))) {
                echo "INSERTED ROWS: ".$insert_stmt->rowCount()."\n";
            }
        }
    }

    // delete the ones in stat_top3 and not in top3
    $delete_stmt = $conn->prepare("delete from stats_players where player_id = ? and team_id = ? and type = 'top'");
    foreach($ids_top_stats as $pid) {
        if(!in_array($pid, $ids_top_current)) {
            if($delete_stmt->execute(array($pid, $tid))) {
                echo "DELETED ROWS: ".$delete_stmt->rowCount()."\n";
            }
        }
    }

    // delete the ones in stat_worst3 and not in worst3
    $delete_stmt = $conn->prepare("delete from stats_players where player_id = ? and team_id = ? and type = 'worst'");
    foreach($ids_worst_stats as $pid) {
        if(!in_array($pid, $ids_worst_current)) {
            if($delete_stmt->execute(array($pid, $tid))) {
                echo "DELETED ROWS: ".$delete_stmt->rowCount()."\n";
            }
        }
    }
}

function updateTeamSentiment($tid, $tc) {
    global $conn;

    // get team's sentiment
    $get = $conn->prepare('select team_id, 100.0*(avg(sentiment)+20.0)/40.0 as percentage from fact_team where team_id = ? group by team_id');
    $upd = $conn->prepare('update stats_teams set sentiment = ? where team_id = ?');
    if($get->execute(array($tid))) {
        $result = $get->fetchAll();
        if(count($result) > 0) {
            $sentiment = $result[0]['percentage'];
            if($upd->execute(array(round($sentiment, 1), $tid))) {
                echo "UPDATED TEAM ROW: ".$upd->rowCount()."\n";
            }
            else {
                print_r($upd->errorInfo());
            }
        }
        else {
            echo "no results for '$tc'\n";
        } 
    }
    else {
        print_r($get->errorInfo());
    }
}

function updateTrendingTopics($tc) {
}


?>
