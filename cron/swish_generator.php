#!/usr/local/bin/php
<?php
/*
 * Script that XXX
 * Called XXX
 */

//error_reporting(0);

// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require($dir.'/../wwwroot/config/config.inc');

//connecting to database and creating universal $db object
require(INCLUDE_DIR.'/log.inc');
require(INCLUDE_DIR.'/database.inc');
require(INCLUDE_DIR.'/nodes.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select nodes.*,node_content from nodes 
		left join node_content on node_content.node_id=nodes.node_id 
		where node_system_access='public' and 
		date(node_created)<=current_date()-interval 1 day and 
		(nodes.k>0 or nodes.node_views>0)");
while ($set->next()) {
	$node_id=$set->getString('node_id');
	$node_content=$set->getString('node_content');
	$node_name=$set->getString('node_name');
	$node_views=$set->getString('node_views');
	$node_creator=$set->getString('node_creator');
	$template_id=$set->getString('template_id');
	$k=$set->getString('k');
	$string.="<node_views>$node_views</node_views>\n";
	$string.="<node_creator>$node_views</node_creator>\n";
	$string.="<k>$k</k>\n<template_id>$template_id</template_id>\n";
	$string.="<node_id>$node_id</node_id>\n<node_name>$node_name</node_name>\n";
	$string.="<node_content>$node_content</node_content>\n";
	$header="Path-Name: $node_id\n";
	$header.="Content-Length: ".strlen($string);
	echo $header."\n\n".$string;
}
echo EOF;

?>

