<?php
error_reporting(1);
session_start();
require('../config/config.inc');
require(INCLUDE_DIR.'database.inc');
require(INCLUDE_DIR.'ubik.inc');
$db=new CLASS_DATABASE();

//print_r($_SESSION);

?>
