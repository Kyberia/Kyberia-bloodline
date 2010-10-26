#!/usr/bin/php
<?php

//XXX fix full path
require('/storage/system/www-docroot/kyberia/config/config.inc');

//require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
//require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db->query("update users set user_action=NULL,user_action_id=NULL,user_location_vector=NULL where unix_timestamp()-3600>unix_timestamp(last_action)");
?>
