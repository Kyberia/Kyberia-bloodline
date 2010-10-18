<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select * from nodes where node_type='7'";
$userset=$db->query($q);
while ($userset->next()) {
	$users[$userset->getString('old_id')]=$userset->getString('node_id');
}

print_r($users);

$q="select * from node_access where node_type='journaux'";
$set=$db_old->query($q);
$db->query("set autocommit=0");

while ($set->next()) {
	echo "OLDUSERID::".$set->getString('user_id');

	$user_id=$users[$set->getString('user_id')];
	echo  "<br>NEWUSERID".$user_id;

	$q="select node_id from nodes where node_type='6' and old_id='".$set->getString('node_id')."'";
	echo $q;
	$set2=$db->query($q);
	$set2->next();
	$node_id=$set2->getString('node_id');

	$q="insert into node_access set node_id='$node_id',user_id='$user_id',node_bookmark='no',node_permission='".$set->getString('access_type')."'";
	echo $q."<br>";
//	if ($node_id>0 AND $user_id>0) $db->query($q);

}


$db->query("commit");

?>
