<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

// Include database credentials
require_once('../db/dbconfig.php');

if (function_exists('date_default_timezone_set')) {
    date_default_timezone_set('UTC');
}

// Include the DataSift library
require dirname(__FILE__).'/./lib/datasift.php';

// Include the DataSift credentials
require dirname(__FILE__).'/config/config.php';

if ($_SERVER['argc'] < 2) {
    die("ERR: Please specify the stream hash to consume!\n\n");
}

/**
 * This class will handle the events
 */
class EventHandler implements DataSift_IStreamConsumerEventHandler {
    private $conn;
    private $stmts;

    private function connect() {
        $this->conn = new PDO(sprintf('pgsql:dbname=%s;user=%s;password=%s;host=%s', DBNAME, DBUSER, DBPASS, DBHOST));
        $this->stmts = array(
            'get_player'    => $this->getConn()->prepare('select id from players where lower(name) like ?'),
            'get_team'      => $this->getConn()->prepare('select id from team where lower(name) like ? or lower(name_es) like ?'),
            'fact_player'   => $this->getConn()->prepare('insert into fact_player(source_id, post_id, link, user_id, content, player_id, sentiment) values ((select id from source where name = ?), ?, ?, ?, ?, ?, ?)'),
            'fact_team'     => $this->getConn()->prepare('insert into fact_team(source_id, post_id, link, user_id, content, team_id, sentiment) values ((select id from source where name = ?), ?, ?, ?, ?, ?, ?)')
        );
    }

    public function getConn() {
        return $this->conn;
    }

    public function getStmts() {
        return $this->stmts;
    }

    /**
     * Called when the stream is connected.
     *
     * @param DataSift_StreamConsumer $consumer The consumer object.
     */
    public function onConnect($consumer) {
        $this->connect();
        echo 'Connected'.PHP_EOL;
    }

    /**
     * Handle incoming data.
     *
     * @param DataSift_StreamConsumer $consumer The consumer object.
     * @param array $interaction The interaction data.
     * @param string $hash The stream hash.
     */
    public function onInteraction($consumer, $interaction, $hash)
    {
        /*
        if (!isset($interaction['interaction']['content'])) {
            $interaction['interaction']['content'] = 'No interaction.content for this interaction';
        }
        echo $hash.': '.$interaction['interaction']['content'].PHP_EOL.'--'.PHP_EOL;
        */
        //echo print_r($interaction, true).PHP_EOL.'--'.PHP_EOL;

        $match = $this->match($interaction);
/*        if($match) {
            insert_fact($match);
        }
*/
    }

    function match($interaction) {
        $match = null;
        $entities = isset($interaction['salience']['content']['entities']) ? $interaction['salience']['content']['entities'] : array();
        $inserts = 0;
        if(count($entities) > 0) {
            $me = $this->matched_entities($entities);
            $players = $me['players'];
            $teams = $me['teams'];
            if(count($players) > 0) {
                $match = true;
                foreach($players as $p) {
                    $source = $interaction['interaction']['type'];
                    $post_id = $interaction['interaction']['id'];
                    $link = $interaction['interaction']['link'];
                    $user_id = $interaction['interaction']['author']['id'];
                    $content = $interaction['interaction']['content'];
                    $player_id = $p['player_id'];
                    $sentiment = $p['sentiment'];
                    $this->insert_player_fact($source, $post_id, $link, $user_id, $content, $player_id, $sentiment);
                    $id = $this->getConn()->lastInsertId('fact_player_id_seq');
                    echo "supposedly inserted id: $id\n";
                    $inserts++;
                }
            }
            if(count($teams) > 0) {
                $match = true;
                foreach($teams as $t) {
                    $source = $interaction['interaction']['type'];
                    $post_id = $interaction['interaction']['id'];
                    $link = $interaction['interaction']['link'];
                    $user_id = $interaction['interaction']['author']['id'];
                    $content = $interaction['interaction']['content'];
                    $team_id = $t['team_id'];
                    $sentiment = $t['sentiment'];
                    $this->insert_team_fact($source, $post_id, $link, $user_id, $content, $team_id, $sentiment);
                    $id = $this->getConn()->lastInsertId('fact_team_id_seq');
                    echo "supposedly inserted id: $id\n";
                    $inserts++;
                }
            }
                /*
                $klout =        $interaction['klout']['score'];
                */
        }
        if($inserts > 0) {
            echo "$inserts rows inserted\n";
        }
        return $match;
    }

    private function insert_player_fact($source, $post_id, $link, $user_id, $content, $player_id, $sentiment) {
        $stmts = $this->getStmts();
        $stmt = $stmts['fact_player'];
        $stmt->bindParam(1, $source);
        $stmt->bindParam(2, $post_id);
        $stmt->bindParam(3, $link);
        $stmt->bindParam(4, $user_id);
        $stmt->bindParam(5, $content);
        $stmt->bindParam(6, $player_id);
        $stmt->bindParam(7, $sentiment);
        if($stmt->execute()) {
            echo sprintf("Inserted rows: %d", $stmt->rowCount());
        }
        else {
            print_r($stmt->errorInfo());
        }
    }

    private function insert_team_fact($source, $post_id, $link, $user_id, $content, $team_id, $sentiment) {
        $stmts = $this->getStmts();
        $stmt = $stmts['fact_team'];
        $stmt->bindParam(1, $source);
        $stmt->bindParam(2, $post_id);
        $stmt->bindParam(3, $link);
        $stmt->bindParam(4, $user_id);
        $stmt->bindParam(5, $content);
        $stmt->bindParam(6, $team_id);
        $stmt->bindParam(7, $sentiment);
        if($stmt->execute()) {
            echo sprintf("Inserted rows: %d", $stmt->rowCount());
        }
        else {
            print_r($stmt->errorInfo());
        }
    }

    function matched_entities($entities) {
        $matched_entities = array(
            'players' => array(),
            'teams' => array()
        );
        foreach($entities as $e) {
            $type = $e['type'];
            $name = $e['name'];
            $sentiment = $e['sentiment'];
            // check if it's a player: type==Person and matches a player's name
            if($type == 'Person') {
                // find the player
                echo sprintf("\tabout to look for player '%s'... ", $name);
                $player_id = $this->get_player($name);
                if($player_id) {
                    echo "FOUND\n";
                    array_push($matched_entities['players'], array('player_id' => $player_id, 'sentiment' => $sentiment));
                }
                else {
                    echo "NOT FOUND\n";
                }
            }
            // or check if it's a team: type==Place and matches a team's country (team name)
            else if($type == 'Place') {
                // find team
                echo sprintf("\tabout to look for team '%s'... ", $name);
                $team_id = $this->get_team($name);
                if($team_id) {
                    echo "FOUND\n";
                    array_push($matched_entities['teams'], array('team_id' => $team_id, 'sentiment' => $sentiment)); 
                }
                else {
                    echo "NOT FOUND\n";
                }
            }
        }
        return $matched_entities;
    }
    
    function get_team($name) {
        $team_id = null;
        $pattern = $this->get_pattern($name);
        echo "using pattern $pattern... ";
        $stmts = $this->getStmts();
        $stmts['get_team']->execute(array($pattern, $pattern));
        $result = $stmts['get_team']->fetchAll();
        if(count($result) > 0) {
            $team_id = $result[0]['id'];
        }
        return $team_id;
    }

    function get_player($name) {
        $player_id = null;
        $pattern = $this->get_pattern($name);
        echo "using pattern $pattern... ";
        $stmts = $this->getStmts();
        $stmts['get_player']->execute(array($pattern));
        $result = $stmts['get_player']->fetchAll();
        if(count($result) > 0) {
            $player_id = $result[0]['id'];
        }
        return $player_id;
    }

    function get_pattern($s) {
        $pattern = '/[^a-z ]+/i';
        $replacement = '_';
        return preg_replace($pattern, $replacement, strtolower($s));
    }
    
    function insert_fact($m) {
    }

    /**
     * Handle DELETE requests.
     *
     * @param DataSift_StreamConsumer $consumer The consumer object.
     * @param array $interaction The interaction data.
     * @param string $hash The stream hash.
     */
    public function onDeleted($consumer, $interaction, $hash)
    {
        echo 'DELETE request for interaction ' . $interaction['interaction']['id']
            . ' of type ' . $interaction['interaction']['type']
            . ' from stream ' . $hash . '. Please delete it from your archive.'
            . PHP_EOL.'--'.PHP_EOL;
    }

    /**
     * Called when a status message is received.
     *
     * @param DataSift_StreamConsumer $consumer    The consumer sending the
     *                                             event.
     * @param string                  $type        The status type.
     * @param array                   $info        The data sent with the
     *                                             status message.
     */
    public function onStatus($consumer, $type, $info)
    {
        switch ($type) {
            default:
                echo 'STATUS: '.$type.PHP_EOL;
                break;
        }
    }

    /**
     * Called when a warning occurs or is received down the stream.
     *
     * @param DataSift_StreamConsumer $consumer The consumer object.
     * @param string $message The warning message.
     */
    public function onWarning($consumer, $message)
    {
        echo 'WARNING: '.$message.PHP_EOL.'--'.PHP_EOL;
    }

    /**
     * Called when a error occurs or is received down the stream.
     *
     * @param DataSift_StreamConsumer $consumer The consumer object.
     * @param string $message The error message.
     */
    public function onError($consumer, $message)
    {
        echo 'ERROR: '.$message.PHP_EOL.'--'.PHP_EOL;
    }

    /**
     * Called when the stream is disconnected.
     *
     * @param DataSift_StreamConsumer $consumer The consumer object.
     */
    public function onDisconnect($consumer) {
        pg_close($this->conn);
        echo 'Disconnected'.PHP_EOL;
    }

    /**
     * Called when the consumer has stopped.
     *
     * @param DataSift_StreamConsumer $consumer The consumer object.
     * @param string $reason The reason the consumer stopped.
     */
    public function onStopped($consumer, $reason)
    {
        echo PHP_EOL.'Stopped: '.$reason.PHP_EOL.PHP_EOL;
    }
}

// Drop the script name from the command line arguments
array_shift($_SERVER['argv']);

// Authenticate
echo "Creating user...\n";
$user = new DataSift_User(USERNAME, API_KEY);

// Create the consumer
echo "Getting the consumer...\n";
$consumer = $user->getMultiConsumer(DataSift_StreamConsumer::TYPE_HTTP, $_SERVER['argv'], new EventHandler());

// And start consuming
echo "Consuming...\n--\n";
$consumer->consume();

// The consumer will never end
