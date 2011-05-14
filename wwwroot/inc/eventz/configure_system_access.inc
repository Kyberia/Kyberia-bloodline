<?php
	function configure_system_access() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		$user_id=$_SESSION['user_id'];
		$node_system_access=db_escape_string($_POST['node_system_access']);

		if (($node['node_permission']=='owner') || ($node['node_permission']=='master')) {

			if ($_POST['apply_on_vector']) {
				$vector=$node['node_vector'];
				if (empty($vector))  {
					$error=$error_messages['INCORRECT_VECTOR'];
					return false;
				}
				$q="update nodes set node_system_access='$node_system_access' where node_vector like '$vector%' and node_creator='$user_id'";
				$db->query($q);
			}

			else {
				$q="update nodes set node_system_access='$node_system_access' where node_id='$node_id'";
				$db->query($q);
			}
		}
		return true;
	}
?>
