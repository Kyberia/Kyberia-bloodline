#!/usr/bin/php
<?php
require('/storage/system/www-root/kyberia.sk/config/config.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/senate.inc');

$db = new CLASS_DATABASE();
$db->query('insert into node_content select node_id,node_content from nodes where ( DATE_SUB(CURDATE(),INTERVAL 2 DAY) < node_created OR DATE_SUB(CURDATE(),INTERVAL 2 DAY) < node_updated)  ON DUPLICATE KEY UPDATE node_content.node_content = nodes.node_content;');
?>
