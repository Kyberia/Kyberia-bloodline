<?php
function set_mood() {
	global $db,$error;

	$set = $db->query(sprintf('select moods from users where user_id = %d', $_SESSION['user_id']));
	$set->next();
	$moods_expl = explode(";",$set->getString('moods'));
	$moods_expl[count($moods_expl)-1] = $_POST['mood'];

	if (is_numeric($_POST['mood'])) {
		$_SESSION['mood_id'] = $_POST['mood'];
		$set = $db->query(sprintf('select node_name, node_content from nodes where node_id = %d', $_POST['mood']));
		$set->next();
		$_SESSION['mood_name'] = strip_tags($set->getString('node_name'));
		$_SESSION['mood_content'] = addslashes(substr(strip_tags($set->getString('node_content')),0,223));
	}
	else {
	    $_SESSION['mood_id'] = '';
	    $_SESSION['mood_name'] = '';
	    $_SESSION['mood_content'] = '';
	}
	$moods = implode(";",$moods_expl);
	$db->query(sprintf('update users set moods="%s" where user_id=%d', $moods, $_SESSION['user_id']));
}
?>
