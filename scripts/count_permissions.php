<?php
$mysqli = new mysqli('127.0.0.1', 'root', '', 'salesy_product');
if ($mysqli->connect_error) {
    echo "CONNECT ERROR: " . $mysqli->connect_error . PHP_EOL;
    exit(1);
}
$result = $mysqli->query('SELECT COUNT(*) AS c FROM permissions');
if (!$result) {
    echo "QUERY ERROR: " . $mysqli->error . PHP_EOL;
    exit(1);
}
$row = $result->fetch_assoc();
echo 'permissions rows: ' . ($row['c'] ?? 'null') . PHP_EOL;
$mysqli->close();
