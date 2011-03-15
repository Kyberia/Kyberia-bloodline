<?php

function set_password() {
	global $db,$error,$error_messages;
	$old_password=$_POST['old_password'];
	$new_password1=$_POST['new_password1'];
	$new_password2=$_POST['new_password2'];

	if ($new_password1!=$new_password2) {
		$error=$error_messages['NEW_PASSWORD_MISMATCH'];
		return false;
	}
	$user_id=$_SESSION['user_id'];
	$login=$_SESSION['user_name'];
	if (!$user_id) {
		return false;
	}

	//old password check
	require_once(INCLUDE_DIR."eventz/login.inc");
	if(!login_check($user_id, $old_password)) {
		$error="bad password";
		return false;
	}

	//changing in MySQL
	$password=sha1($new_password1);
	$db->query("update users set password='$password' where user_id='$user_id'");
	login_check($user_id, $new_password1); //znova se zalogujeme po zmene hesla (kvuli jabberu)
}
