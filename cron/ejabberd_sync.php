#!/usr/bin/php
<?php
/*
 * Script that synchronizes ejabberd users with kyberia
 * Call as needed
 */

$echo='echo '; //Test only...
$jabber_domain=escapeshellarg('kyberia.cz');

// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require($dir.'/../wwwroot/config/config.inc');

//require(INCLUDE_DIR.'/log.inc');
require(INCLUDE_DIR.'/database.inc');
//require(INCLUDE_DIR.'/nodes.inc');
//require(INCLUDE_DIR.'/permissions.inc');
//require(INCLUDE_DIR.'/ubik.inc');
//require(INCLUDE_DIR.'/senate.inc');

//REGISTRATION_VOTES CONSTANT DEFINED IN INC/SENATE.INC
define('REGISTER_TEXT','request for access');

$_SESSION['user_id']=UBIK_ID;

$db=new CLASS_DATABASE();

$q='SELECT * FROM users;';

$set=$db->query($q);

while($set->next()) {
	$user=escapeshellarg($set->getString('login'));
	$pass=escapeshellarg(md5('jabber:'.$set->getString('password')));
	system($echo."ejabberdctl register $user $jabber_domain $pass");
	system($echo."ejabberdctl set-password $user $jabber_domain $pass"); //needs mod_ctlextra installed in ejabberd
}

/* ejabberdctl debug:
 * mnesia:dirty_read(passwd, {"harvie", "kyberia.cz"}).
 * mnesia:dirty_write({passwd, {"harvie", "kyberia.cz"}, "HESLOO"}).
 */
