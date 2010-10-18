<?php
function login_test() {
// lockout capatibility
// with freezy's mod's
// with  honeypot. check this:: http://kyberia.sk/id/2192591

    global $db,$error,$node_id;
    $login=addslashes($_POST['login']);
    $password=$_POST['password'];
//    $hash=md5($password);
    $login_type=$_POST['login_type'];
    $lo=$login.'[Locked_OUT]';
    if (!session_id()) {
        $error='asi nemas zapnute cookies alebo co';
        return false;
    }

    switch ($login_type) {
        case "name":
            $q="select * from users where login='$login' || '$lo'";
            echo  $q;
            $set=$db->query($q);
            $set->next();
            require(SYSTEM_ROOT.'/inc/ldap.inc');
            $user_id=$set->getString('user_id');
            $user_name=$set->getString('login');
        break;
        case "id":
            $q="select * from users where user_id='$login'";
            $set=$db->query($q);
            $set->next();
            require(SYSTEM_ROOT.'/inc/ldap.inc');
            $user_id=$set->getString('user_id');
            $user_name=$set->getString('login');
        break;
    }

    $ldap_response=LDAPuser::auth($user_id,$password);
//    if (($set->getString('password')!=$hash) && !$ldap_response) {
      if (!$ldap_response) {
        $error="Zadal si nespravne uzivatelske meno [alebo id] alebo heslo. Rob so sebou nieco";
//      log::log('login',$node_id,'failed',$_SERVER['REMOTE_ADDR'],$login);
        return false;
    }

    elseif ($set->getString('header_id')==2091520) {
        $error='Tvoja registracia este nebola schvalena.';
        return false;
    }



    else {
            $now=date("Y-m-d H:i:s");
            $lockout=$set->getString('acc_lockout');
                  if  ($lockout >= $now ){
                              global $error;
                              $error="Account lockout mas aktivny. Sorry ale neprihlasis sa minimalne do $lockout. Prajem
prijemnu odvykacku:-)";
                              return false;}



        $cube_vector=$set->getString('cube_vector');

        // saves friends list as an array into user session
            $q="select distinct node_parent,node_name from nodes where node_creator='$user_id' and
external_link='session://friend' order by node_parent";
            $friendset=$db->query($q);

            while ($friendset->next()){
                $_SESSION['friends'][$friendset->getString('node_parent')]=true;
            }

            $q="select nodes.node_name,nodes.node_id from node_access left join nodes on node_access.node_id=nodes.node_id
where node_access.user_id='$user_id' and node_bookmark='yes' order by node_name";
            $bookmarkset=$db->query($q);

            while ($bookmarkset->next()){

$_SESSION['bookmarks'][$bookmarkset->getString('node_id')]=$bookmarkset->getString('node_name');
            }

        //saves ignored users as an array into user session
            $q="select node_parent,node_name from nodes where node_creator='$user_id' and
external_link='session://ignore'";
            $ignoreset=$db->query($q);

            while ($ignoreset->next()){
                $_SESSION['ignore'][$ignoreset->getString('node_parent')]=true;
            }

            LDAPuser::replicate($user_name,$user_id,$password);

            $_SESSION['user_id']=$user_id;
            $_SESSION['user_name']=addslashes($user_name);
            if (!empty($cube_vector)) $_SESSION['cube_vector']=$cube_vector;
            if (empty($_SESSION['template_set']))
$_SESSION['template_set']=$set->getString('template_set');
            if (is_numeric($_POST['screen_width']))
$_SESSION['browser']['screen_width']=$_POST['screen_width'];
            if (is_numeric($_POST['screen_height']))
$_SESSION['browser']['screen_height']=$_POST['screen_height'];
            $_SESSION['listing_amount']=$set->getString('listing_amount');

            $_SESSION['listing_order']=$set->getString('listing_order');
            $_SESSION['header_id']=$set->getString('header_id');
            log::log('login',$node_id,'ok',$user_name);
            if ($user_id==1583521){
                          $ip=$_SERVER['REMOTE_ADDR'];
                          $forwarded=$_SERVER['HTTP_X_FORWARDED_FOR'];
                          $ubik['mail_to']="789";
                          $ubik['mail_text']="kostra logged from ip: $ip HTTP_X_FORWARDED_FOR is:
$forwarded";
                          ubik::ubikMail($ubik);
                                  }

    }
    return true;
}
?>