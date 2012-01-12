<?php
function reset_password() {
    global $db,$error;
    $login = $_POST['login'];
    $login_type = $_POST['login_type'];
    $vercode = $_POST['vercode'];
    $password1 = $_POST['new_password1'];
    $password2 = $_POST['new_password2'];

	if ($login == '') {
		$error="Please enter name or id";
		return false;
	}

	if ($password1 == '' || $password2 == '') {
		$error="Please enter password";
		return false;
	}

	if ($password1 != $password2) {
		$error = "The two passwords that you entered do not match.";
		return false;
	}

	if ($login_type == 'id') {
		$login_id=$login;
		$login='';
	} else {
		$login_id=0;
	}
	$error=nodes::resetPassword($login_id,$login,$vercode,$password1);
	print "$error\n";
	
	return 0;
}
?>
