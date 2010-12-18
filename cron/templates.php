#!/usr/bin/php
<?php
/*
 * Script that XXX ? create template files from sql ?
 * Called XXX
 */


// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require($dir.'/../wwwroot/config/config.inc');

//connecting to database and creating universal $db object
require(INCLUDE_DIR.'/log.inc');
require(INCLUDE_DIR.'/database.inc');
require(INCLUDE_DIR.'/nodes.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select nodes.*,node_content.*,nodes.node_id as node_id from nodes 
		left join node_content on nodes.node_id=node_content.node_id 
		where node_type='14'");

while ($set->next()) {
	$node_content=$set->getString('node_content');
	$template_id=$set->getString('node_id');
	$fp = fopen (OWN_TEMPLATE_DIR.$template_id.".tpl", "w+");
	fwrite($fp,$node_content);
	fclose($fp);
	chown(OWN_TEMPLATE_DIR.$template_id.".tpl","www");
}

?>
