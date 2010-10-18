<?php
function smarty_function_get_moods($params,&$smarty) {
	global $db;
error_reporting(1);
	$user_id = $params['user_id'];
	$set = $db->query(sprintf('select moods from users where user_id = %d', $user_id));
	$set->next();
	$moods_db = $set->getString('moods');
	$moods_expl = explode(";",$moods_db);

	// moodlist [array]
	for ($i = 0;$i < count($moods_expl)-1;$i++) {
		$set = $db->query(sprintf('select node_id,node_name from nodes where node_id = %d', $moods_expl[$i]));
		$set->next();
		$moods[$i]['node_id'] = $set->getString('node_id');
		$moods_str[$i] = $set->getString('node_id');
		$moods[$i]['node_name'] = $set->getString('node_name');
	}

	// moodlist [string]
	$moods_string = implode(";",$moods_str);

	// momentalne nastaveny mood
	if (is_numeric($moods_expl[count($moods_expl)-1])) {
		$set = $db->query(sprintf('select node_id, node_name, node_content from nodes where node_id = %d', $moods_expl[count($moods_expl)-1]));
		$set->next();
		$mood['node_id'] = $set->getString('node_id');
		$mood['node_name'] = strip_tags($set->getString('node_name'));
		$mood['node_content'] = addslashes(substr(strip_tags($set->getString('node_content')),0,223));
	}
	else {
		$mood['node_id'] = '';
		$mood['node_name'] = '';
		$mood['node_content'] = '';
	}

	$smarty->assign('get_moods',$moods);
	$smarty->assign('get_moods_string',$moods_string);
	$smarty->assign('get_moods_mood',$mood);
}
?>