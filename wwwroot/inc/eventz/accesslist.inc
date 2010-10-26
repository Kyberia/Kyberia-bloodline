<?php

	function accesslist() {
		global $db,$error,$node,$error_messages;
		$node_id=$node['node_id'];
		$access=explode(";",$_POST['access']);

if ($node['node_permission']!=('owner' || 'master' || 'op')) {
$error=$error_messages['EVENT_PERMISSION_ERROR'];
return false;
}

		$db->query("update node_access set last_visit=NOW(),node_permission='' where node_id=$node_id and node_permission='access'");
		foreach ($access as $acc) {
			$set=$db->query("select user_id from users where login='$acc'");
			$set->next();
			if ($set->getString('user_id')) {
				$q="update node_access set last_visit='',node_permission='access' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
				echo $q;
				$changed=$db->update($q);
				if (!$changed) {
					$q="insert into node_access set node_permission='access',node_id=$node_id,user_id=".$set->getString('user_id');
					$db->query($q);
				}
				$logger->log('add access',$node_id,'ok',$acc);
			}
			else { $error .= "$acc does not exist..."; }
		}
	}
?>




