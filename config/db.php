<?php
require("func.php");
require("value.php");
$db = mysqli_connect("localhost","root","") or die("can't connect this database");
mysqli_select_db($db, "db_name");
mysqli_set_charset($db, 'utf8');
