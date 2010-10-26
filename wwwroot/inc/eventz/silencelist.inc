<?php

	function silencelist() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		$silence=explode(";",$_POST['silence']);

if ($node['node_permission']!=('owner' || 'master' || 'op')) {
$error=$error_messages['EVENT_PERMISSION_ERROR'];
return false;
}
		$db->query("update node_access set node_permission='' where node_id=$node_id and node_permission='silence'");
		foreach ($silence as $sil) {
			$set=$db->query("select user_id from users where login='$sil'");
			$set->next();
			if ($set->getString('user_id')) {
				$q="update node_access set node_permission='silence' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
				$changed=$db->update($q);
				if (!$changed) {
					$q="insert into node_access set node_permission='silence',node_id=$node_id,user_id=".$set->getString('user_id');
					$db->query($q);
				}
				$logger->log('add silence',$node_id,'ok',$sil);
			}
			else { $error .= "$sil does not exist..."; }
		}
	}
?>
