<?php
error_reporting(1);
session_start();
require('../config/config.inc');
require(SYSTEM_ROOT.'inc/database.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select user_id,last_action from users where (user_id > 2334 and user_id < 123456 and last_action like '2005-11-06 00:00:02')");
while ($set->next()){
echo $set->getString('user_id')." ; ".$set->getString('last_action')."<br>";
}

?>