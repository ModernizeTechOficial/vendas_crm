<?php
$mysqli = new mysqli('127.0.0.1', 'root', '', 'salesy_product');
if ($mysqli->connect_error) {
    echo "CONNECT ERROR: " . $mysqli->connect_error . PHP_EOL;
    exit(1);
}
$res = $mysqli->query("SELECT VERSION() AS v, @@innodb_large_prefix as large_prefix, @@innodb_file_format as file_format, @@innodb_file_per_table as file_per_table, @@innodb_default_row_format as row_format, @@character_set_server as charset, @@collation_server as collation, @@default_storage_engine as engine");
if (!$res) { echo "ERROR QUERY: " . $mysqli->error . PHP_EOL; exit(1); }
$row = $res->fetch_assoc(); print_r($row);
$mysqli->close();
