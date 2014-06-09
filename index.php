<?php
// Database configuration
require_once('../../dbconfig.php');

class SMB {
    private $json_sources = './json/';
    private $conn;
    private $stmts;
 
    function __construct() {
        $this->connect();
    }
 
    function __destruct() {
        $this->disconnect();
    }

    private function connect() {
        $this->conn = new PDO(sprintf('pgsql:dbname=%s;host=%s', DBNAME, DBHOST), DBUSER, DBPASS, array(PDO::ATTR_PERSISTENT => true));
        $this->stmts = array(
            'players'   => $this->getConn()->prepare('select p.id as pid, p.name as player,t.name as team,t.id as tid,s.type as type, s.sentiment from stats_players s join players p on (s.player_id=p.id) join team t on (s.team_id=t.id) where t.code = ? order by t.name,s.type,s.sentiment desc'),
            'teams'     => $this->getConn()->prepare('select t.name as team, s.sentiment as sentiment from stats_teams s join team t on (s.team_id=t.id) where t.code = ?')
//            'tt'        => $this->getConn()->prepare('')
        );
    }

    private function disconnect() {
        $this->conn = null;
    }

    public function getConn() {
        return $this->conn;
    }

    public function getStmts() {
        return $this->stmts;
    }

    // Ver qué información se está pidiendo y llamar a la función correspondiente
    public function proceed() {
        if (isset($_GET['mid']) && isset($_GET['type'])) {
            switch($_GET['type']) {
                case 'players':
                    return $this->players($_GET['mid']);
                    break;
                case 'teams':
                    return $this->teams($_GET['mid']);
                    break;
                case 'tt':
                    return $this->trending_topics($_GET['mid']);
                    break;
            }
        }
    }

    private function players($mid) {
        if($this->validateMatchID($mid)) {
            $team_codes = explode('-', $mid, 2);
            
            // get players' sentiment
            $players_sentiment_1 = $this->getPlayersSentiment($team_codes[0]);
            $players_sentiment_2 = $this->getPlayersSentiment($team_codes[1]);
            $data = array(
                'match-id' => $mid,
                'players' => array(
                    $players_sentiment_1,
                    $players_sentiment_2
                )
            );
            $this->sendJSON($data);
        }
    }

    private function teams($mid) {
        if($this->validateMatchID($mid)) {
            $team_codes = explode('-', $mid, 2);
            $teams = array(
                $this->getTeamSentiment($team_codes[0]),
                $this->getTeamSentiment($team_codes[1])
            );
            $data = array(
                'match-id' => $mid,
                'teams' => $teams
            );
            // get teams' sentiment
            $this->sendJSON($data);
        }
    }

    private function trending_topics() {
    }

    private function getTeamSentiment($tc) {
        $sentiment = 50;
        $stmt = $this->getStmts()['teams'];
        if($stmt->execute(array($tc))) {
            $result = $stmt->fetchAll();
            $sentiment = $result[0]['sentiment'];
        }
        
        return array(
            'id' => $tc,
            'sentiment' => $sentiment
        );
    }

    private function getPlayersSentiment($tc) {
        $top = array();
        $worst = array();
        $stmt = $this->getStmts()['players'];
        if($stmt->execute(array($tc))) {
            $result = $stmt->fetchAll();
            foreach($result as $p) {
                $player_name = $p['player'];
                $type = $p['type'];
                $sentiment = $p['sentiment'];
                $player = array('player_name' => $player_name, 'sentiment' => $sentiment);
                switch($type) {
                    case 'top':
                        $top[] = $player;
                        break;
                    case 'worst':
                        $worst[] = $player;
                        break;
                }
            }
        }
        return array('team' => $tc, 'top3+' => $top, 'top3-' => $worst);
    }
    
    private function sendJSON($data) {
        sendResponse(200, json_encode($data), 'application/json');
    }
    
    private function error($msg) {
        sendResponse(400, json_encode(array('error_message' => $msg)));
    }
    
    /**
      * Match ID should comply with:
      * - 7 characters
      * - a dash in the middle
      * - only uppercase A-Z characters contained on the three at left and right sides
      */
    private function validateMatchID($m) {
        $pattern = '/[A-Z]{3}-[A-Z]{3}/';
        if(preg_match($pattern, $m)) {
            return true;
        }
        else {
            $this->error("Wrong match code '$m'. Expected format is 'ABC-EFG': two sets of three upper case letters separated by a dash. Each set must match a FIFA team code.");
            return false;
        }
    }
}

// Helper method to get a string description for an HTTP status code
function getStatusCodeMessage($status){
    $codes = Array(
        100 => 'Continue',
        101 => 'Switching Protocols',
        200 => 'OK',
        201 => 'Created',
        202 => 'Accepted',
        203 => 'Non-Authoritative Information',
        204 => 'No Content',
        205 => 'Reset Content',
        206 => 'Partial Content',
        300 => 'Multiple Choices',
        301 => 'Moved Permanently',
        302 => 'Found',
        303 => 'See Other',
        304 => 'Not Modified',
        305 => 'Use Proxy',
        306 => '(Unused)',
        307 => 'Temporary Redirect',
        400 => 'Bad Request',
        401 => 'Unauthorized',
        402 => 'Payment Required',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        406 => 'Not Acceptable',
        407 => 'Proxy Authentication Required',
        408 => 'Request Timeout',
        409 => 'Conflict',
        410 => 'Gone',
        411 => 'Length Required',
        412 => 'Precondition Failed',
        413 => 'Request Entity Too Large',
        414 => 'Request-URI Too Long',
        415 => 'Unsupported Media Type',
        416 => 'Requested Range Not Satisfiable',
        417 => 'Expectation Failed',
        500 => 'Internal Server Error',
        501 => 'Not Implemented',
        502 => 'Bad Gateway',
        503 => 'Service Unavailable',
        504 => 'Gateway Timeout',
        505 => 'HTTP Version Not Supported'
    );
 
    return (isset($codes[$status])) ? $codes[$status] : '';
}
 
// Helper method to send a HTTP response code/message
function sendResponse($status = 200, $body = '', $content_type = 'application/json'){
    $status_header = 'HTTP/1.1 ' . $status . ' ' . getStatusCodeMessage($status);
    header($status_header);
    header('Content-type: ' . $content_type);
    echo $body;
}
 
$api = new SMB;
$api->proceed(); 
?>
