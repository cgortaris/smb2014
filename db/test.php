<?php
require_once('dbconfig.php');

$conn = pg_connect(sprintf("host=%s dbname=%s user=%s password=%s", DBHOST, DBNAME, DBUSER, DBPASS)) or die('Could not connect: ' . pg_last_error());
$query = 'SELECT * FROM source';
$result = pg_query($query) or die('Query failed: ' . pg_last_error());

// Printing results
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo print_r($line, true);
}

$query = "select count(*) as n from source where name='twitter'";
$result = pg_query($query) or die('Query failed: ' . pg_last_error());
$data = pg_fetch_array($result, null, PGSQL_ASSOC);
if(intval($data['n']) > 0) {
    echo sprintf("We found %d results\n", intval($data['n']));
}
else {
    echo "No results\n";
}

// Free resultset
pg_free_result($result);

// Closing connection
pg_close($conn);

$pdo = new PDO(sprintf('pgsql:dbname=%s;user=%s;password=%s;host=%s', DBNAME, DBUSER, DBPASS, DBHOST));
$query = 'select * from source where name = ?';
$stmt = $pdo->prepare($query);
$stmt->execute(array('twitter'));
$result = $stmt->fetchAll();

foreach($result as $r) {
    $id = $r['id'];
    $name = $r['name'];
    echo sprintf("id: %d, name: %s\n", $id, $name);
}


$stmt = $pdo->prepare('select * from players where lower(name) like ?');
$s = 'Alexis SÃnchez';
$pattern = '/[^a-z ]+/i';
$replacement = '_';
$lookfor = preg_replace($pattern, $replacement, strtolower($s));
$stmt->execute(array($lookfor));
echo "trying $lookfor...\n";
$result = $stmt->fetchAll();
echo print_r($result, true);

$q = "insert into source(name) values(?)";
$source = 'google+';
$stmt = $pdo->prepare($q);
$stmt->bindParam(1, $source);
$stmt->execute();
$id = $pdo->lastInsertId('source_id_seq');
echo "ID: $id\n";
?>
