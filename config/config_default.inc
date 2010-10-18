<?php
// Default kyberia configuration file.
// This runs kyberia on localhost with single database.

define('DB_HOST',		'localhost');
define('DB_USER',		'kyberia');
define('DB_PASS',		'levenshtein');
define('DB_DATABASE',		'kyberia');

define('SYSTEM_ROOT',		'/var/www/kyberia-wwwroot/');
define('SYSTEM_DATA',		'/var/www/kyberia-data/');
define('CONFIG_DIR',		SYSTEM_ROOT . 'config/');
define('AJAX_DIR',		SYSTEM_ROOT . 'ajax/');
define('INCLUDE_DIR',		SYSTEM_ROOT . 'inc/');
define('SMARTY_DIR',		SYSTEM_ROOT . 'smarty/libs/');
define('SMARTY_PLUGIN_DIR',	SYSTEM_ROOT . 'inc/smarty/node_methodz/');
define('TEMPLATE_DIR',		SYSTEM_DATA . 'templates/');
define('TMP',			SYSTEM_DATA . 'tmp/');
define('FILE_DIR',		SYSTEM_DATA . 'files/');
define('CLASS_DIR',		INCLUDE_DIR . 'class/');
define('EVENT_DIR',		INCLUDE_DIR . 'eventz/');
define('SYSTEM_URL',		'localhost');

define('UBIK_ID',		'332');
define('DEFAULT_LISTING_AMOUNT','32');
define('DEFAULT_LISTING_ORDER',	'desc');
define('DEFAULT_TEMPLATE_ID',	'4');
define('VECTOR_CHARS',		8);
define('NODE_IMAGE_WIDTH',	230);
define('WARNING_ZONE',		1059888);
define('MAX_CHILDREN',		42666);

/*
define('SLAVE_HOST',     '127.0.0.1');
define('SLAVE_USER',     'kyberia');
define('SLAVE_PASS',     'kybcsa');
define('SLAVE_DATABASE', 'levenshtein');

define('SLAVE2_HOST',	'127.0.0.1');
define('SLAVE2_USER',	'kyberia');
define('SLAVE2_PASS',	'levenshtein');
define('SLAVE2_DATABASE', 'kyberia');
*/

?>
