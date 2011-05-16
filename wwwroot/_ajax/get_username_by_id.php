<?php
error_reporting(E_ALL | E_STRICT);
require('../config/config.inc');
require(INCLUDE_DIR.'database.inc');
$db=new CLASS_DATABASE();
$name = addslashes($_GET['name']);
$q="select users.user_id from users where users.login='$name' limit 1";
$set=$db->query($q);
$set->next();
$id=$set->getString('user_id');
echo $id;
?>
