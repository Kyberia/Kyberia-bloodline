<?php
require('config/config.inc');
require('inc/database.inc');

$db = new CLASS_DATABASE();
$amount = $_GET['price'];
preg_match("/kyberia ([0-9]*)/",$_GET['text'],$matched);
$user_id=$matched[1];

$db->query("insert into sms_payment set user_id='$user_id',amount='$amount'");

?>
