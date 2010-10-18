<?php
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select * from nodes where node_type='11'";
$pollset=$db->query($q);
while ($pollset->next()) {
	$polls[$pollset->getString('old_id')]=$pollset->getString('node_id');
}
print_r($polls);
$q="select * from nodes where node_type='7'";
$userset=$db->query($q);
while ($userset->next()) {
	$users[$userset->getString('old_id')]=$userset->getString('node_id');
}

$q="select * from user_poll";
$set=$db_old->query($q);

while ($set->next()) {
print_r($set->getRecord());
echo "LLALALALA".$set->getString('poll_id');
$poll_id=$polls[$set->getString('poll_id')];
$user_id=$users[$set->getString('user_id')];
$cset=$db->query("select * from node_access where node_id='$poll_id' and user_id='$user_id'");
if ($user_id AND $poll_id) {
	$result=$cset->getNumRows();
	if (!$result) $db->query("insert into node_access set node_id=$poll_id ,user_id=$user_id ,node_permission='ban'");
	else $db->query("update node_access set node_permission='ban' where node_id='$poll_id' and user_id='$user_id'");
	unset($result);
}

}