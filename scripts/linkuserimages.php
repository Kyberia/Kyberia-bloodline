<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select * from nodes where node_type='7'";
$userset=$db->query($q);
while ($userset->next()) {
	$users[$userset->getString('node_name')]=$userset->getString('node_id');

}

foreach ($users as $key => $value) {
	$target="/storage/system/www-kyberia/images/nodes/".substr($value,0,1)."/".substr($value,1,1)."/$value.gif";
	symlink($target,"/storage/system/www-kyberia/images/users/$key.gif");
}
?>
