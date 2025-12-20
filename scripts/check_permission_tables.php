<?php
$mysqli = new mysqli('127.0.0.1', 'root', '', 'salesy_product');
if ($mysqli->connect_error) {
    echo "CONNECT ERROR: " . $mysqli->connect_error . PHP_EOL;
    exit(1);
}
$tables = ['roles','role_has_permissions','model_has_roles','model_has_permissions'];
foreach ($tables as $t) {
    $r = $mysqli->query("SHOW TABLES LIKE '$t'");
    echo $t . ': ' . ($r && $r->num_rows ? 'exists' : 'missing') . PHP_EOL;
}
$mysqli->close();
