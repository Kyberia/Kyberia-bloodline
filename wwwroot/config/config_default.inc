<?php
// Default kyberia configuration file.
// This runs kyberia on localhost with single database.

define('DB_TYPE',		'mysql');	// mysql of psql so far.
define('DB_HOST',		'localhost');
define('DB_USER',		'kyberia');
define('DB_PASS',		'levenshtein');
define('DB_DATABASE',		'kyberia');

define('SYSTEM_ROOT',		'/srv/kyberia/');
define('SYSTEM_DATA',		SYSTEM_ROOT . '/wwwroot/_data/');
define('SYSTEM_IMAGES',		'/_images/');
define('CONFIG_DIR',		SYSTEM_ROOT . 'config/');
define('AJAX_DIR',		SYSTEM_ROOT . 'wwwroot/ajax/');
define('INCLUDE_DIR',		SYSTEM_ROOT . 'wwwroot/inc/');

date_default_timezone_set(	'Europe/Prague');

define('SMARTY_DIR',		SYSTEM_ROOT . 'wwwroot/smarty/libs/');
define('SMARTY_PLUGIN_DIR',	SYSTEM_ROOT . 'wwwroot/inc/smarty/node_methodz/');
define('TEMPLATE_DIR',		SYSTEM_DATA . 'templates/');
//XXX FIX
define('OWN_TEMPLATE_DIR',      TEMPLATE_DIR. 'own_templates/');

define('TMP',			SYSTEM_DATA . 'tmp/');
define('FILE_DIR',		SYSTEM_DATA . 'files/');
define('CLASS_DIR',		INCLUDE_DIR . 'class/');
define('EVENT_DIR',		INCLUDE_DIR . 'eventz/');
define('SYSTEM_URL',		'kyberia.cz:8023');

define('SYSTEM_SMTP',		'molly.kyberia.cz');
define('SYSTEM_EMAIL',		'admin@kyberia.cz');
define('SYSTEM_EMAIL_NAME',	'Ubik osobne');


define('UBIK_ID',		'332');
define('DEFAULT_LISTING_AMOUNT','32');
define('DEFAULT_LISTING_ORDER',	'desc');
define('DEFAULT_TEMPLATE_ID',	'4');
define('VECTOR_CHARS',		8);
define('NODE_IMAGE_WIDTH',	230);
define('WARNING_ZONE',		1059888);
define('MAX_CHILDREN',		42666);

/*
//Uncomment this to enable Basic HTTP Auth:
$realm = 'kyberia'; //This is used by browser to identify protected area and saving passwords (one_site+one_realm==one_user+one_password)
$users = array( //You can specify multiple users in this array
  'kyberia' => 'passw'
);
*/


// Kyberia senate specific settings (special node numbers, ...
require_once(INCLUDE_DIR.'senate.inc')
?>
