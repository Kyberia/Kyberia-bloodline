<?php
error_reporting(E_ALL | E_STRICT);
session_start();
require('../config/config.inc');
require(INCLUDE_DIR.'database.inc');
$db=new CLASS_DATABASE();
$user_id = $_GET['user_id'];

$set=$db->query(sprintf('select moods from users where user_id = %d limit 1',$user_id));
$set->next();
$moods = $set->getString('moods');
echo "session_user_id:: ".$_SESSION['user_id']."<br>";
printf('moods:: %s session:: %d , %s , %s',$moods,$_SESSION['mood'],$_SESSION['mood_name'],$_SESSION['mood_text']);
?>
