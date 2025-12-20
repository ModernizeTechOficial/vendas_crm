<?php
$mysqli = new mysqli('127.0.0.1', 'root', '', 'salesy_product');
if ($mysqli->connect_error) {
    echo "CONNECT ERROR: " . $mysqli->connect_error . PHP_EOL;
    exit(1);
}
if ($mysqli->query('DROP TABLE IF EXISTS permissions')) {
    echo "Dropped permissions table (if existed)" . PHP_EOL;
} else {
    echo "DROP ERROR: " . $mysqli->error . PHP_EOL;
}
$mysqli->close();
