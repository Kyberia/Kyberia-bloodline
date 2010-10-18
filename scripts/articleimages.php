<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');
//require('../config/config_pathz.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");
define('IMAGES','/storage/system/www-kyberia/images/clanky/');

$set=$db->query("select node_id,old_id from nodes where node_type='5'");
while ($set->next()) {
	$oldset=$db_old->query("select title_image from articles where id_article='".$set->getString('old_id')."'");
	$oldset->next();
	$id=$set->getString('node_id');
	$image=$oldset->getString('title_image');
	if (!empty($image)) {
		if (strstr($image,".gif")) {
		copy(IMAGES.$image,"/storage/system/www-kyberia/images/nodes/".substr($id,0,1)."/".substr($id,1,1)."/$id.gif");
		}

		elseif ( strstr($image,".jpeg") || strstr($image,".jpg") || strstr($image,".JPG") ){
			$cmd=UTILZ_DIR."/jpegtopnm ".IMAGES.$image." | ".UTILZ_DIR."/ppmquant 256 | ".UTILZ_DIR."/ppmtogif > /storage/system/www-kyberia/images/nodes/".substr($id,0,1)."/".substr($id,1,1)."/$id.gif";


		echo $cmd."<br>";
		shell_exec($cmd);

		}


	}
}