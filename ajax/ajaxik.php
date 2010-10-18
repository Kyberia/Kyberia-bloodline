<?php
error_reporting(1);
session_start();
require('../config/config.inc');
require(SYSTEM_ROOT.'inc/database.inc');
require(SYSTEM_ROOT.'inc/ubik.inc');
$db=new CLASS_DATABASE();

//print_r($_SESSION);

?>