#!/usr/bin/php
<?php
//require('/storage/system/www-docroot/kyberia.sk/config/config.inc');
require('/home/freezy/kyb/config/config.inc');
//connecting to database and creating universal $db object
//require(SYSTEM_ROOT.'/inc/log.inc');
//require(SYSTEM_ROOT.'/inc/database.inc');
//require(SYSTEM_ROOT.'/inc/nodes.inc');
//require('/storage/system/www-docroot/kyberia.sk/inc/log.inc');
//require('/storage/system/www-docroot/kyberia.sk/inc/database.inc');
require('/home/freezy/kyb/inc/database.inc');
//require('/storage/system/www-docroot/kyberia.sk/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db->query("update users set user_action=NULL,user_action_id=NULL,user_location_vector=NULL where unix_timestamp()-3600>unix_timestamp(last_action)");
?>
