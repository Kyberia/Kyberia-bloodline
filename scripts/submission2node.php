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

$q="select * from nodes where node_type='3'";
$set=$db->query($q);
$trigger=false;
while ($set->next()) {
	if ($set->getString('old_id')=='64875') $trigger=true;
//	if ($trigger==true) {
	$q="select * from submissions where forum_id='".$set->getString('old_id')."' order by submission_id";
echo $q;
	$subset=$db_old->query($q);
	while ($subset->next()) {
		$q="insert into nodes set old_id='".$subset->getString('submission_id')."'
,node_parent='".$set->getString('node_id')."'
,node_thread_vector='".$set->getString('node_thread_vector').";".$set->getString('node_id')."'
,node_system_access='".$set->getString('node_system_access')."',
node_created='".$subset->getString('submission_timestamp')."',node_creator='".$users[$subset->getString('submission_owner')]."',
k='".$subset->getString('submission_k')."',node_type='4',old_owner_id='".$subset->getString('submission_owner')."',
node_name='".$subset->getString('submission_timestamp').$subset->getString('submission_id')."'";
//echo $q;
$db->query($q);
$db->query("insert into node_content set node_content='".addslashes($subset->getString('submission_text'))."',node_id=LAST_INSERT_ID()");
//}
	}

}
