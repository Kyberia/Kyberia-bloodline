<?php
// Faster alternative for geting user image link 
// (no db connection)
// this is fine for example for viewing "K", much less db requests.

function smarty_function_get_image_link_fast($params,&$smarty) {
	$id = $params['id'];
	
	if (!is_numeric($id)) { $id=0;}
	$img = './'.SYSTEM_IMAGES.'/nodes/'.substr($id,0,1)."/".substr($id,1,1)."/$id.gif";

	if (file_exists($img)) { echo "$img"; } 
	else { echo SYSTEM_IMAGES.'/nodes///.gif'; }
}
?>
