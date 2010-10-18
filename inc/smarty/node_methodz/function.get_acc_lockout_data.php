<?php
function smarty_function_get_acc_lockout_data($params,&$smarty) {
    global $db,$user_id;
    $q="select users.user_mail,acc_lockout from users where users.user_id=$user_id";
    $set=$db->query($q);
    $set->next();
    $lockout_to=$set->getString('acc_lockout');
    $pocet_mailov=$set->getString('user_mail');

$now=date("Y-m-d H:i:s");
$rok=date("Y");
$mesiac=date("m");
$den=date("d");
$hodina=date("H");
$minuta=date("i");

if ($lockout_to >= $now) {$still_locked=true;}else{$still_locked=false;}

    $smarty->assign('user_locked_out_til',$lockout_to);
    $smarty->assign('lockedout_user_mail_count',$pocet_mailov);
    $smarty->assign('still_locked_out',$still_locked);
    $smarty->assign('actrok',$rok);
    $smarty->assign('actmesiac',$mesiac);
    $smarty->assign('actden',$den);
    $smarty->assign('acthodina',$hodina);
    $smarty->assign('actminuta',$minuta);


}
?>