#!/usr/bin/php
<?php
/*
 * Script that restores number of K for all users.
 * Called once a day.
 */


// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require($dir.'/../wwwroot/config/config.inc');

require('../config/config.inc');
require(INCLUDE_DIR.'/database.inc');
require(INCLUDE_DIR.'/senate.inc');

$db = new CLASS_DATABASE();
$db->query('update users set user_k = '. DAILY_K);
?>
