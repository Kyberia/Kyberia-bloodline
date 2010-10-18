<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db->query("set autocommit=0");

$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select * from nodes where node_type='7'";
$userset=$db->query($q);
while ($userset->next()) {
	$users[$userset->getString('old_id')]=$userset->getString('node_id');
}

$friendset=$db_old->query("select * from friends");
while ($friendset->next()) {
	$q="insert into nodes set node_type='8',node_name='friend::".$users[$friendset->getString('friend_id')]."::".$users[$friendset->getString('user_id')]."::".rand(1,23000)."',node_parent='".$users[$friendset->getString('friend_id')]."',node_creator='".$users[$friendset->getString('user_id')]."'";
	$db->query($q);
	echo $q;
	$q="insert into node_content set node_id=LAST_INSERT_ID(),node_content='".$friendset->getString('friend_text')."'";
	echo $q;
	$db->query($q);
	$db->query("commit");

}