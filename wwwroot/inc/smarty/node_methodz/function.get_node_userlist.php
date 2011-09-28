<?php

// Get list of users currently viewing specified node.

function smarty_function_get_node_userlist($params,&$smarty) {

	global $node;

	if (isset($params['node_id']) && is_numeric($params['node_id'])) {
		$node_id=$params['node_id'];
	} else { 
		$node_id=$node['node_id'];
	}

	$userlist=nodes::getNodeUserlist($node_id);
	$smarty->assign('userlist',$userlist);
}
?>
