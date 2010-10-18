<?php
// extracts number of users who have execute permission on K
// that means they are cittizens

function smarty_function_get_citizen_count($params,&$smarty) {
	global $db, $error, $node;
//	$node_handle=$node['node_id'];

	$q="select count(user_id) as citizens from nodes left join node_access on nodes.node_id=node_access.node_id where nodes.node_id=1961061 and node_access.node_permission='execute'";
	$set=$db->query($q);

	if ($set->next()) {
		$count=$set->getString('citizens');
	}else{
		$count="error?!?";
	}
	$need=1+floor(log($count,"1.42"));
	$smarty->assign('get_citizen_count',$count);
	$smarty->assign('get_citizen_count_need',$need);
}

?>








