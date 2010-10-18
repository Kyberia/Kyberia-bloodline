<?php


function set_bookmark_category() {
	global $node,$db,$error;
	$bookmarks=$_POST['bookmarks_chosen'];
	$category_id=$_POST['bookmark_category_id'];
	$new_parent=nodes::getNodeById($category_id,$_SESSION['user_id']);
	$new_parent_permissions=permissions::checkPermissions($new_parent);


	if (!$new_parent_permissions['w']) {
		global $error_messages;
		$error=$error_messages['WRITE_PERMISSION_ERROR'];
		return false;
	}



	foreach ($bookmarks as $chosen_id) {

		unset($chosen);

                $db->query("start transaction");

		$q="update node_access set bookmark_category='$category_id' where node_id='$chosen_id' and user_id='".$_SESSION['user_id']."'";
		$db->query($q);

		$q="update neurons set dst='$category_id' where src='$chosen_id' and synapse_creator='".$_SESSION['user_id']."' and link='bookmark'";
		$result=$db->update($q);
		if (!$result) $db->query("insert into neurons set synapse_creator='".$_SESSION['user_id']."',src='$chosen_id',dst='$category_id',link='bookmark'");
$db->query("update nodes set lastdescendant_created=NOW() where node_id='$category_id'");
$db->query("commit");
	}

	return true;
}
?>


