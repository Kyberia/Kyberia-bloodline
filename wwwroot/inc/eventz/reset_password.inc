<?php
function reset_password() {
    global $db,$error;
    $login = db_escape_string($_POST['login']);
    $login_type = db_escape_string($_POST['login_type']);
    $vercode = db_escape_string($_POST['vercode']);
    $password1 = db_escape_string($_POST['new_password1']);
    $password2 = db_escape_string($_POST['new_password2']);

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

    switch ($login_type) {
        case "name":
            $set=$db->query("select * from users where login='$login'");
            $set->next();
            $user_name=$set->getString('login');
            $user_id=$set->getString('user_id');
            $hash=$set->getString('hash');
        break;
        case "id":
            $set=$db->query("select * from users where user_id='$login'");
            $set->next();
            $user_name=$set->getString('login');
            $user_id=$set->getString('user_id');
            $hash=$set->getString('hash');
        break;
    }

    if ($hash != $vercode) {
        $error="Bad verification code!";
        return false;
    }

    // XXX fix
    $password = md5($password1);
    $q="update users set password='$password' where user_id='$user_id'";
    $db->query($q);

//    require(INCLUDE_DIR.'ldap.inc');
//    LDAPuser::change_pass_forced($user_id,$password1);

    $error="Password changed. Now you can login with your new password.";
    return false;
}
?>
