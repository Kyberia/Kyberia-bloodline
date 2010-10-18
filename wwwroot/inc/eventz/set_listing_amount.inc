<?php

function set_listing_amount() {
	global $db,$error;
	$listing_amount=$_POST['listing_amount'];
	$user_id=$_SESSION['user_id'];
	if (!$user_id) {
		return false;
	}

	$db->query("update users set listing_amount='$listing_amount' where user_id='$user_id'");
	$_SESSION['listing_amount']=$listing_amount;
}

?>
