<?php
function smarty_function_get_node_commanders($brawco,&$smarty) {
	global $db,$node;
	$node_id=$node['node_id'];
	$set=$db->query("select node_permission,users.login from node_access left join users on node_access.user_id=users.user_id where node_id='$node_id' and node_permission!='' order by node_permission");

	while ($set->next()) {
 		$commanders[$set->getString('node_permission')].=$set->getString('login').";";
	}

	$smarty->assign('get_node_commanders',empty($commanders) ? "" : $commanders);
	$smarty->assign('masters',empty($commanders['master']) ? "" : $commanders['master']);
	$smarty->assign('ops',empty($commanders['op']) ? "" : $commanders['op']);
	$smarty->assign('access',empty($commanders['access']) ? "" : $commanders['access']);
	$smarty->assign('bans',empty($commanders['ban']) ? "" : $commanders['ban']);
	$smarty->assign('silence',empty($commanders['silence']) ? "" : $commanders['silence']);
	$smarty->assign('execute',empty($commanders['execute']) ? "" : $commanders['execute']);

}

?>

