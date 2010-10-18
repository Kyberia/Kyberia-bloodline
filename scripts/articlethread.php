<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();


$q="select node_id,node_thread_vector from nodes where node_type='5'";
$set=$db->query($q);
while ($set->next()) {
	$vector_array[$set->getString('node_id')]=$set->getString('node_thread_vector');
}

print_r($vector_array);
$q="select * from nodes where node_type='4' and node_thread_vector='0' and old_type='article' order by node_id asc";
$set=$db->query($q);
while ($set->next()) {
	$vector_array[$set->getString('node_id')]=$vector_array[$set->getString('node_parent')].";".$set->getString('node_parent');
	$db->query("update nodes set node_thread_vector='".$vector_array[$set->getString('node_parent')].";".$set->getString('node_parent')."' where node_id='".$set->getString('node_id')."'");
	echo "update nodes set node_thread_vector='".$vector_array[$set->getString('node_parent')].";".$set->getString('node_parent')."' where node_id='".$set->getString('node_id')."'";
}
?>