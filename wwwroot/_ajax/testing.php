<?php
error_reporting(E_ALL | E_STRICT);
session_start();
require('../config/config.inc');
require(INCLUDE_DIR.'database.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select user_id,last_action from users where (user_id > 2334 and user_id < 123456 and last_action like '2005-11-06 00:00:02')");
while ($set->next()){
echo $set->getString('user_id')." ; ".$set->getString('last_action')."<br>";
}

?>
