<?php

	function banlist() {
		global $db,$error,$node;
		$node_id=$node['node_id'];

if ($node['node_permission']!=('owner' || 'master' || 'op')) {
$error=$error_messages['EVENT_PERMISSION_ERROR'];
return false;
}
		$bans=explode(";",$_POST['bans']);

		$db->query("update node_access set node_permission='' where node_id=$node_id and node_permission='ban'");
		foreach ($bans as $ban) {
			$set=$db->query("select user_id from users where login='$ban'");
			$set->next();
			if ($set->getString('user_id')) {
				$q="update node_access set node_permission='ban' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
				echo $q;
				$changed=$db->update($q);
				if (!$changed) {
					$q="insert into node_access set node_permission='ban',node_id=$node_id,user_id=".$set->getString('user_id');
					$db->query($q);
				}
				log::log('add ban',$node_id,'ok',$ban);
			}
			else { $error .= "$ban does not exist..."; }
		}
	}
?>
