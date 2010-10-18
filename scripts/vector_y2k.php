<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');
error_reporting(0);

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$q="select node_id,node_thread_vector from nodes order by node_id asc";
$set=$db->query($q);
while ($set->next()) {
	unset($new_vector);
	$node_id=$set->getString('node_id');
	$old_vector=$set->getString('node_thread_vector');
	$old_vector=ltrim($old_vector,";");
	$vector_array=explode(";",$old_vector);
	foreach($vector_array as $vector_item) {
		$new_item=str_pad($vector_item,VECTOR_CHARS,"0",STR_PAD_LEFT);
		$new_vector .= ";".$new_item;
	}
	$new_id=str_pad($set->getString('node_id'),VECTOR_CHARS,"0",STR_PAD_LEFT);
//	echo "AAAA".$new_id."BBBB";
	$new_vector=$new_vector.";".$new_id;
	$q="update nodes set node_vector='$new_vector' where node_id='$node_id'";
	echo $q;
	$db->query($q);
}
?>

