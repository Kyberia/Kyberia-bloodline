<?php
function smarty_function_get_image_link($params,&$smarty) {
	global $db;
	$id = $params['id'];
	
	if (!is_numeric($id)) { $id=0;}
	$img = './'.SYSTEM_IMAGES.'/nodes/'.substr($id,0,1)."/".substr($id,1,1)."/$id.gif";

	if (file_exists($img)) {
		echo SYSTEM_IMAGES.'/nodes/'.substr($id,0,1)."/".substr($id,1,1)."/$id.gif";
	}
	else {
		$set = $db->query("select user_id from users where user_id = $id");
		if ($set->getNumRows() > 0) {
			$imglink = SYSTEM_IMAGES.'/nodes///.gif';
		} else {
			$imglink = SYSTEM_IMAGES.'/nodes/1/0/101.gif';
		}
		echo $imglink;
	}
}

?>
