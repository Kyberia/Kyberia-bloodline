#!/usr/bin/php
<?php
/*
 * Script that logouts iddle users.
 * Called twice a hour.
 */


// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require($dir.'/../wwwroot/config/config.inc');

//require(INCLUDE_DIR.'/log.inc');
require(INCLUDE_DIR.'/inc/database.inc');
//require(INCLUDE_DIR.'/nodes.inc');

$db=new CLASS_DATABASE();
$db->query("update users set user_action=NULL,user_action_id=NULL,user_location_vector=NULL where unix_timestamp()-3600>unix_timestamp(last_action)");
?>
