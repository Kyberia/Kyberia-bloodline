<?php
	function configure_bookmarks() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		$db->query("update node_access set bookmark_category=0 where user_id='".$_SESSION['user_id']."' and bookmark_category='$node_id'");
		foreach($_POST['bookmark'] as $key =>$value) {
			$db->query("update node_access set bookmark_category='$node_id' where user_id='".$_SESSION['user_id']."' and node_id='$key'");
		}

	}
?>
