<?php
$m=new mysqli('127.0.0.1','root','','salesy_product');
if($m->connect_error){echo 'ERR:'.$m->connect_error.PHP_EOL; exit(1);}
$v=$m->query('SELECT VERSION() as v')->fetch_assoc(); echo 'version: '.$v['v'].PHP_EOL;
$vars=['default_storage_engine','character_set_server','collation_server','innodb_default_row_format','innodb_file_per_table'];
foreach($vars as $var){
    $r=$m->query("SHOW VARIABLES LIKE '$var'");
    $row=$r ? $r->fetch_assoc() : null;
    echo $var.': '.($row['Value'] ?? 'N/A').PHP_EOL;
}
$m->close();
