#!/usr/bin/php
<?php
require('/storage/system/www-root/kyberia.sk/config/config.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/senate.inc');

$db = new CLASS_DATABASE();
$db->query('update users set user_k = '. DAILY_K);
?>
