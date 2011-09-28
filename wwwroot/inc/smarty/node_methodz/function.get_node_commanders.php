<?php
function smarty_function_get_node_commanders($brawco,&$smarty) {
	global $node;
	$node_id=$node['node_id'];
	
	$commanders=nodes::getNodeCommanders($node_id);

	$smarty->assign('get_node_commanders',empty($commanders) ? "" : $commanders);
	$smarty->assign('masters',empty($commanders['master']) ? "" : $commanders['master']);
	$smarty->assign('ops',empty($commanders['op']) ? "" : $commanders['op']);
	$smarty->assign('access',empty($commanders['access']) ? "" : $commanders['access']);
	$smarty->assign('bans',empty($commanders['ban']) ? "" : $commanders['ban']);
	$smarty->assign('silence',empty($commanders['silence']) ? "" : $commanders['silence']);
	$smarty->assign('execute',empty($commanders['execute']) ? "" : $commanders['execute']);

}

?>

