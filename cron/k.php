#!/usr/bin/php
<?php
/*
 * Script that restores number of K for all users.
 * Called once a day.
 */


// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require_once($dir.'/../wwwroot/config/config.inc');

require_once(INCLUDE_DIR.'/database.inc');
require_once(INCLUDE_DIR.'/log.inc');

$db = new CLASS_DATABASE();
$db->query('update users set user_k = '. DAILY_K);
?>
