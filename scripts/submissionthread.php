<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$q="select * from nodes where node_type='forum'";
$set=$db->query($q);

while ($set->next()) {
	$forum_vector=$set->getString('node_thread_vector');
	$forum_id=$set->getString('node_id');
	$db->query("update nodes set node_thread_vector='$forum_vector;$forum_id' where node_parent='$forum_id'");
}
