<?php

function smarty_function_get_nodes_by_type($params,&$smarty) {
	global $node;

	$type=$params['type'];
	if ($params['listing_amount']=='all') $listing_amount=DEF_MAX_LISTING_AMMOUNT;
	else $listing_amount=$params['listing_amount'];
	if (empty($params['offset'])) $offset=0;
	else $offset=$params['offset'];
	if ($params['vector']) {
		$vector=$params['vector'];
	}
	if ($params['orderby']) {
		$orderby=$params['orderby'];
	}
	$node_id=$node['node_id'];
	$user_id=$_SESSION['user_id'];

	$result=nodes::getNodesByType(isset($vector)?$vector:"",$user_id,$type,isset($orderby)?$orderby:"",$offset,$listing_amount);

	$smarty->assign('get_nodes_by_type',$result);

}
?>
