<?php
	function configure_template_id() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		$user_id=$_SESSION['user_id'];

		if (($node['node_permission']=='owner') || ($node['node_permission']=='master')) {

	                if (is_numeric($_POST['template_id'])) $template_id=$_POST['template_id'];
			else {
				$error=$error_messages['INCORRECT_TEMPLATE_ID'];
				return false;
			}

			if ($_POST['apply_on_vector']) {
				$vector=$node['node_vector'];
				if (empty($vector))  {
					$error=$error_messages['INCORRECT_VECTOR'];
					return false;
				}
				$q="update nodes set template_id='$template_id' where node_vector like '$vector%'";
				$db->query($q);
			}

			else {
				$q="update nodes set template_id='$template_id' where node_id='$node_id'";
				$db->query($q);
			}
		}else{
			$error=$error_messages['EVENT_PERMISSION_ERROR'];
			return false;
		}
	}
?>