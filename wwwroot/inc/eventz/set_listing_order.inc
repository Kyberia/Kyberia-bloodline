<?php

function set_listing_order() {
	global $db,$error;
	$listing_order=$_POST['listing_order'];
	$user_id=$_SESSION['user_id'];
	if (!$user_id) {
		return false;
	}

	$db->query("update users set listing_order='$listing_order' where user_id='$user_id'");
	$_SESSION['listing_order']=$listing_order;
}

?>
