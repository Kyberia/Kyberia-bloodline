<?php
function smarty_function_get_id_by_name($params,&$smarty) {
    $name = mysql_real_escape_string($params['name']);
    global $db;
    $q="select user_id from users where login='$name'";
    $set=$db->query($q);
    if ($set->getNumRows() > 0) {
        $set->next();
        $id=$set->getString('user_id');
    }
    else $id = '1';
    $smarty->assign('get_id_by_name',$id);
}
?>