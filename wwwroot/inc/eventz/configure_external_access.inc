<?php
function configure_external_access() {
	global $db,$error,$node;
	$node_id=$node['node_id'];
	$user_id=$_SESSION['user_id'];

	if (($node['node_permission']=='owner') || ($node['node_permission']=='master')) {

		if ($_POST['node_external_access'] =='yes')
			{ $node_external_access = 'yes'; }
		else
			{ $node_external_access = 'no'; }

		if ($_POST['apply_on_vector']) {
			$vector=$node['node_vector'];
			if (empty($vector))  {
				$error=$error_messages['INCORRECT_VECTOR'];
				return false;
			}
			$q="update nodes set node_external_access='$node_external_access' where node_vector like '$vector%' and node_creator='$user_id'";
			$db->query($q);
		}

		else {
			$q="update nodes set node_external_access='$node_external_access' where node_id='$node_id'";
			$db->query($q);
		}
	}else{
		$error=$error_messages['EVENT_PERMISSION_ERROR'];
		return false;
	}
}
?>
