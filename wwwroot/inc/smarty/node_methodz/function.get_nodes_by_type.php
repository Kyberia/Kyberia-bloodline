<?php

function smarty_function_get_nodes_by_type($params,&$smarty) {
	global $node;

	$vector="";
	$orderby="";
	$type=$params['type'];
	if ($params['listing_amount']=='all') $listing_amount=DEF_MAX_LISTING_AMMOUNT;
	else $listing_amount=$params['listing_amount'];
	if (empty($params['offset'])) $offset=0;
	else $offset=$params['offset'];
	if (isset($params['vector']) && $params['vector']) {
		$vector=$params['vector'];
	}
	if (isset($params['orderby']) && $params['orderby']) {
		$orderby=$params['orderby'];
	}
	$node_id=$node['node_id'];
	$user_id=$_SESSION['user_id'];

	$result=nodes::getNodesByType($vector,$user_id,$type,$orderby,$offset,$listing_amount);

	$smarty->assign('get_nodes_by_type',$result);

}
?>
