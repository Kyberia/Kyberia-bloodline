#!/usr/bin/php
<?php
/*
 * Script that XXX put xapian here?
 * Called XXX
 */

// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require($dir.'/../wwwroot/config/config.inc');

require(INCLUDE_DIR.'/database.inc');
require(INCLUDE_DIR.'/senate.inc');

$db = new CLASS_DATABASE();
$db->query('insert into node_content select node_id,node_content from nodes where ( DATE_SUB(CURDATE(),INTERVAL 2 DAY) < node_created OR DATE_SUB(CURDATE(),INTERVAL 2 DAY) < node_updated)  ON DUPLICATE KEY UPDATE node_content.node_content = nodes.node_content;');
?>
