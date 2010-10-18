<?php
function moodlist() {
	global $db,$error,$node;
	$moods_expl = explode(";",$_POST['moodlist']);
	$moodlist[0] = '';

	if (empty($moods_expl[count($moods_expl)-1])) $moods_sw = 1;
	else $moods_sw = 0;

	$moods_cn = 0;
	for ($i = 0;$i < count($moods_expl)-$moods_sw;$i++) {
		$set = $db->query(sprintf('select node_id from nodes where node_id = %d', $moods_expl[$i]));
		$set->next();
		if ($set->getString('node_id')) {
			if (!in_array($moods_expl[$i],$moodlist)) {
				$moodlist[$moods_cn] = $moods_expl[$i];
				$moods_cn++;
			}
		}
		else {
			$error = sprintf('%d does not exist, ', $moods_expl[$i]);
		}
	}

	sort($moodlist);
	$moods_impl = implode(";",$moodlist);
	$moods_impl .= ';';
	if (!empty($_SESSION['mood_id'])) $moods_impls .= $_SESSION['mood_id'];

	$db->query(sprintf('update users set moods = "%s" where user_id = %d', $moods_impl, $_SESSION['user_id']));

	return true;
}
?>
