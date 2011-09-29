<?php
//returns array of linked nodes, possible args listing_amount,offset,node_id,orderby=synapse

function smarty_function_get_linked_nodes($params,&$smarty) {
	global $error, $node;

	if (empty($params['listing_amount'])) {
		$listing_amount=DEFAULT_LISTING_AMOUNT;
	} else {
	        if ($params['listing_amount']=='all') $listing_amount=DEF_MAX_LISTING_AMMOUNT;
	        elseif (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
	}

        if (isset($params['offset']) && is_numeric($params['offset'])) $offset=$params['offset'];
	elseif (isset($_POST['offset']) && is_numeric($_POST['offset'])) $offset=$_POST['offset'];
	else $offset=0;

	if (isset($params['node_id'])) {
		$node_id=$params['node_id'];
	} else {
		$node_id=$node['node_id'];
	}

	if ($params['orderby']='synapse') {
		$orderby='synapse_created';
	} else {
		$orderby='node_id';
	}

	$get_linked_nodes=nodes::getLinkedNodes($node_id,$orderby,$offset,$listing_amount);
	$smarty->assign('get_linked_nodes',$get_linked_nodes);
}

?>

