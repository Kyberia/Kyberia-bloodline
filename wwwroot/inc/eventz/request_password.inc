<?php
function request_password() {
    global $db,$error;
    $login=addslashes($_POST['login']);
    $login_type=$_POST['login_type'];
    $email=$_POST['email'];

    if ($login == '') {
        $error="Please enter name or id";
        return false;
    }

    if ((strpos($email, '@') == false) || (strpos($email, '@') == '0') || (strpos($email, '@') >= (strlen($email) - 4))) {
        $error="Please enter correct mail";
        return false;
    }

    switch ($login_type) {
        case "name":
            $set=$db->query("select * from users where login='$login' and email='$email'");
            $set->next();
            $user_name=$set->getString('login');
            $user_id=$set->getString('user_id');
        break;
        case "id":
            $set=$db->query("select * from users where user_id='$login' and email='$email'");
            $set->next();
            $user_name=$set->getString('login');
            $user_id=$set->getString('user_id');
        break;
    }

    if($set->getNumRows() == 0) {
        $error="Name [or id] that you entered do not match your mail";
        return false;
    }

    $vercode=md5(uniqid(rand()));
    $vercode=substr($vercode,0,23);

    $q="update users set hash='$vercode' where user_id='$user_id'";
    $db->query($q);

    $emailtext= "Ahoj $user_name!\nPotrebujes zmenit heslo ktore si zabudol?\nPrave od toho tu je tento email. Musim tento text trosku natiahnut aby ho spamfiltre nebrali ako spam a ty si si to svoje zabudnute heslo mohol lahko zmenit.\nTu je tvoje overovacie cislo => $vercode <= [samozrejme bez tych sipiek => a <=].\nTen musis zadat na tejto adrese => https://".SYSTEM_URL."/id/632663 kde si uz svoje heslo lahko zmenis.\n\nVela Stastia\nadmini ".SYSTEM_URL;
    $headers = 'From: root@kyberia.cz' . "\r\n" . 'X-Mailer: kyberia';
    mail($email,SYSTEM_URL." verification code",$emailtext,$headers );

    $error="<h3>Verification code sent, please check your mailbox.</h3>";
    return false;
}
?>
