<?php
	function unbook() {

		global $db,$error,$node;
		$q="update neurons set link='soft' where synapse_creator='".$_SESSION['user_id']."' and src='".$node['node_id']."' and link='bookmark'";
		$result=$db->update($q);

		$q="update node_access set last_visit='',node_bookmark='no' where user_id='".$_SESSION['user_id']."' and node_id='".$node['node_id']."'";
		$result=$db->query($q);
		if ($result) {
			$logger->log('unbook','ok');
			return true;
		}
		else {
			$logger->log('unbook','failed');
			$error='unbook failed';
			return false;
		}
	}
?>
