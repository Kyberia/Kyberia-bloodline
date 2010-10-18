<?php
define('UBIK_ID','332');
define('DB_HOST','localhost');
define('DB_USER','kyberia');
define('DB_PASS','kybdb');
define('DB_DATABASE','kyberia2');
define('SMARTY_DIR','/storage/system/www-root/kyberia.sk/smarty/Smarty-2.6.10/libs/');
define('SMARTY_DIR','/home/freezy/kyb/smarty/Smarty-2.6.10/libs/');
define('SMARTY_PLUGIN_DIR','/storage/system/www-root/kyberia.sk/inc/smarty/node_methodz/');
define('SMARTY_PLUGIN_DIR','/home/freezy/kyb/inc/smarty/node_methodz/');
define('SYSTEM_ROOT','/storage/system/www-root/kyberia.sk/');
//define('SYSTEM_ROOT','/home/freezy/kyb/');
define('EVENT_DIR',SYSTEM_ROOT.'inc/eventz/');
define('INCLUDE_DIR',SYSTEM_ROOT.'inc/');
define('TEMPLATE_DIR','/storage/system/www-root/kyberia.sk/data/templates/');
define('TEMPLATE_DIR','/home/freezy/kyb/data/templates/');
define('OWN_TEMPLATE_DIR',TEMPLATE_DIR.'own_templates/');
define('TMP','/storage/system/www-root/kyberia.sk/tmp');
define('TMP','/home/freezy/kyb/tmp');
define('PEAR_DIR','/usr/local/lib/php/');
define('DEFAULT_LISTING_AMOUNT','32');
define('DEFAULT_LISTING_ORDER','desc');
define('DEFAULT_TEMPLATE_ID','4');
//define('FILE_DIR','/storage/data/file_nodes/');
//define('FILE_URL','http://h-k.sk/files/');
//define('UTILZ_DIR','/storage/system/www-docroot/kyberia.sk/utilz/');
define('VECTOR_CHARS',8);
define('NODE_IMAGE_WIDTH',230);
define('WARNING_ZONE',1059888);
define('MAX_CHILDREN',42666);
define('AJAX_DIR',SYSTEM_ROOT.'/ajax/');

define('MASTER2SLAVE',618); //oh so platonic!
define('SLAVE_HOST','192.168.69.3');
define('SLAVE_USER','kyberia');
define('SLAVE_PASS','kybdb123');
define('SLAVE_DATABASE','kyberia2');

// by maniac, docasne aby ficali hysterke boardy uz cez kyberku..
if ($_SERVER['HTTP_HOST']=='board.h-k.sk') {
	define('URI','https://board.h-k.sk/id/');
	define('TEMPLATE_SET','hysteria');
}

else {

	define('URI','http://www.kyberia.sk/id/');
	define('TEMPLATE_SET','kyberia');
}
?>
