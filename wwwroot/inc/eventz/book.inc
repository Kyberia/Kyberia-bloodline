<?php

function book() {
	global $db,$error,$node;

	$q="update neurons set link='bookmark',synapse_creator='".$_SESSION['user_id']."',synapse=synapse+1 where dst='".$_SESSION['user_id']."' and src='".$node['node_id']."'";
	$result=$db->update($q);
	if (!$result) {
		$q="insert into neurons set synapse_created=NOW(),dst='".$_SESSION['user_id']."',src='".$node['node_id']."',synapse_creator='".$_SESSION['user_id']."',link='bookmark'";
		$db->query($q);
	}
	$q="update node_access set node_bookmark='yes' where user_id='".$_SESSION['user_id']."' and node_id='".$node['node_id']."'";
	$result=$db->query($q);

	$_SESSION['bookmarks'][$node['node_id']]=$node['node_name'];

	return true;
}
?>


