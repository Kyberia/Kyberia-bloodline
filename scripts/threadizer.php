<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$bigset=$db->query("select * from nodes where node_type=3 order by node_id");
while ($bigset->next()) {
	$vector=$bigset->getString('node_thread_vector').";".$bigset->getString('node_id');
	$forum_id=$bigset->getString('node_id');
	$db->query("update nodes set node_thread_vector='$vector' where node_parent=$forum_id");
	echo "<BR>";
}

/*
$bigset=$db->query("select * from nodes where (node_type=5 or node_type=6) order by node_id");
while ($bigset->next()) {
	$vector_array[$bigset->getString('node_id')]=$bigset->getString('node_thread_vector').";".$bigset->getString('node_id');
}

$set=$db->query("select * from nodes where node_thread_vector=0 and node_type=4 order by node_id");
while ($set->next()) {
	$vector_array[$set->getString('node_id')]=$set->getString('node_thread_vector').";".$bigset->getString('node_parent');
	$vector=$vector_array[$set->getString('node_parent')];
	$id=$set->getString('node_id');
	$db->query("update nodes set node_thread_vector='$vector' where node_parent=$id");
	echo "<BR>";
}

*/
?>

