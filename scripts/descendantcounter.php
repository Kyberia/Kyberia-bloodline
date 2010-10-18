<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select node_thread_vector,node_id from nodes");
while ($set->next()) {
	unset($pocet);
	$ancestor=$set->getString('node_id');
	$vector=$set->getString('node_thread_vector');
	$countset=$db->query("select count(*) as pocet from nodes where node_thread_vector like '$vector;$ancestor'");
	$countset->next(); $pocet=$countset->getString('pocet');
	$countset=$db->query("select count(*) as pocet from nodes where node_thread_vector like '$vector;$ancestor;%'");
	$countset->next(); $pocet+=$countset->getString('pocet');
	$db->query("update nodes set node_descendant_count='$pocet' where node_id='$ancestor'");
}

?>

