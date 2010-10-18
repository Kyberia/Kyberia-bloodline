<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select node_id,node_content from node_content order by node_id";
$set=$db->query($q);

while ($set->next()) {
	$node_content=$set->getString('node_content');
	$new_content=preg_replace_callback("/(http:\/\/www.kyberia.sk\/([a-zA-Z]*).php)?\?(action=([a-zA-Z]*))?\&(node_id=([0-9]*))?(\&alone=([0-9]*))?/i","changeRegExp",$node_content);
	if ($new_content!=$node_content) {
		$node_id=$set->getString('node_id');
		$new_content=AddSlashes($new_content);
		$db->query("update node_content set node_content='$new_content' where node_id='$node_id'");
		echo $node_id." updated<br>";
	}
}

function changeRegExp($match) {
global $db;

		if ($match[8]) {
			$q="select node_id from nodes where node_type='4' and old_id='".$match[8]."'";
			$s=$db->query($q);
			$s->next();
			$id=$s->getString('node_id');
			return "/id/$id";
		}
		else {
			if ($match[4]=='forum') {
				$q="select node_id from nodes where node_type='3' and old_id='".$match[6]."'";
				$s=$db->query($q);
				$s->next();
				$id=$s->getString('node_id');
				return "/id/$id";
			}
		}
}

?>


