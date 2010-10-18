<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select distinct node_parent from nodes");
while ($set->next()) {
	$parent=$set->getString('node_parent');
	$countset=$db->query("select count(*) as pocet from nodes where node_parent='$parent'");
	$countset->next(); $pocet=$countset->getString('pocet');
	$db->query("update nodes set node_children_count='$pocet' where node_id='$parent'");
}

?>

