#!/usr/local/bin/php
<?php
require('../config/config.inc');
//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select node_id from nodes where node_type='13'");

while ($set->next()) {
	$id=$set->getString('node_id');
	if (is_numeric($id)) {
		$q="delete from node_content where node_id='$id'";
		$db->query($q);
		$q="delete from nodes where node_id='$id'";
		$db->query($q);
	}
}





?>