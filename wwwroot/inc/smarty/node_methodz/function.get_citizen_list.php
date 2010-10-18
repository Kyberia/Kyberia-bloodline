<?php
// extracts list of users who have execute permission on K
// that means they are cittizens

function smarty_function_get_citizen_list($params,&$smarty) {
    global $db, $error;

    switch ($params['sort']) {
        case "user_id":
            $sort = "users.user_id";
            break;
        case "login":
            $sort = "login";
            break;
        case "last_action":
            $sort = "last_action";
            break;
        case "user_action":
            $sort = "user_action";
            break;
        default:
            $sort = "login";
            break;
    }

    $q="select users.user_id, login, last_action, user_action from nodes left join node_access on nodes.node_id=node_access.node_id left join users on node_access.user_id=users.user_id where nodes.node_id=1961061 and node_access.node_permission='execute' order by ".$sort;
    $set=$db->query($q);

    $i=0;
    while ($set->next()) {
        $i++;
        $citizens[$i]['user_id']=$set->getString('user_id');
        $citizens[$i]['login']=$set->getString('login');
        $citizens[$i]['last_action']=$set->getString('last_action');
        $citizens[$i]['user_action']=$set->getString('user_action');
    }
    $smarty->assign('get_citizen_list',$citizens);
}

?>