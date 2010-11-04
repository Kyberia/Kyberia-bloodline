<?php
function smarty_function_get_image_link($params,&$smarty) {
	global $db;
	$id = $params['id'];
	$img = SYSTEM_ROOT."/images/nodes/".substr($id,0,1)."/".substr($id,1,1)."/$id.gif";

	if (file_exists($img)) {
		echo "/images/nodes/".substr($id,0,1)."/".substr($id,1,1)."/$id.gif";
	}
	else {
		$set = $db->query("select user_id from users where user_id = $id");
		if ($set->getNumRows() > 0) {
			$imglink = "/images/nodes///.gif";
		} else {
			$imglink = "/images/nodes/1/0/101.gif";
		}
		echo $imglink;
	}
}

?>
