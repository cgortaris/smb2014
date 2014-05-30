<?php
class SMB {
    private $db;
    private $json_sources = './json/';
 
    // Constructor
    function __construct() {
//        $this->db = new mysqli('localhost', 'username', 'password', 'db');
//        $this->db->autocommit(FALSE);
    }
 
    // Destructor
    function __destruct() {
//        $this->db->close();
    }

    // Ver qué información se está pidiendo y llamar a la función correspondiente
    function proceed() {
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

    function players() {
        $this->sendJSON('players.json');
    }

    function teams() {
        $this->sendJSON('teams.json');
    }

    function trending_topics() {
        $this->sendJSON('tt.json');
    }

    function sendJSON($filename) {
        $json_filename = $this->json_sources.$filename;
        $json = json_decode(file_get_contents($json_filename), true);
        sendResponse(200, json_encode($json));
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
