<?php
function smarty_function_get_user_email_icq_www($params,&$smarty) {
    $user_id = $params['user_id'];
    global $db;
//    $q="select users.email,icq,www from users where users.user_id=$user_id";
    $q="select email from users where user_id=$user_id";

    $set=$db->query($q);
    $set->next();
    $email=$set->getString('email');
//    $icq=$set->getString('icq');
//    $www=$set->getString('www');
    $smarty->assign('get_user_email',$email);
//    $smarty->assign('get_user_icq',$icq);
//    $smarty->assign('get_user_www',$www);
}
?>
