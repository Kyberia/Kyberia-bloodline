<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$handle=opendir("/storage/system/www-kyberia/files");
while (($file = readdir($handle))!==false) {
	if (is_numeric($file)) $files[]=$file;
}

foreach ($files as $file) {
$q="update nodes set node_type='12' where node_id='$file'";
$db->query($q);

//$set=$db->query("select * from tiamat");
}
/*
while ($set->next()) {
	$tiamat_id=$set->getString('tiamat_id');


}
*/


?>

