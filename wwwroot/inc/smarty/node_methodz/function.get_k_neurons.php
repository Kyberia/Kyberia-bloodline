<?php

function smarty_function_get_k_neurons($params,&$smarty) {

	global $db,$node;
	if (is_numeric($params['offset'])) $offset=$params['offset'];
	else $offset=0;
	if (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
	else $listing_amount=DEFAULT_LISTING_AMOUNT;
	if (!is_numeric($_POST['interval'])) $interval=1;
	else $interval = $_POST['interval'];
	if ($params['vector']) {
		$vector=$params['vector'];
		$interval=365;
	}
	else $vector="00";

// XXX move to backend

/*$q="select nodes.*,parent.node_name as parent_name,users.login as creator
 from nodes left join nodes as parent on nodes.node_parent=parent.node_id
 left join users on users.user_id=nodes.node_creator where nodes.node_created>now()-interval $interval day
  and nodes.node_vector like '$vector%' and nodes.k>0 and nodes.node_system_access!='private' order by nodes.k desc limit $offset,$listing_amount";
*/
		
	$q="select COUNT(I.node_id) as count,length(concat(nodes.node_vector)) as vector_depth,nodes.*,nodes.node_creator as node_owner_id,creator.node_name as owner, node_parent.node_name as node_parent_name from I left join nodes on nodes.node_id=I.node_id left join nodes as creator on creator.node_id=nodes.node_creator left join nodes as node_parent on nodes.node_parent=node_parent.node_id where cas>NOW()-INTERVAL 1 HOUR and nodes.node_system_access='public' and nodes.node_vector like '00%' GROUP BY I.node_id ORDER BY count desc";
//      $q="select nodes.*,'foter' as parent_name,'niekt0' as creator from nodes where node_id=4738126";

	$set=$db->query($q);
	while ($set->next()) {
		$k_array[]=$set->getRecord();
	}

// XXX backend end

	$smarty->assign('get_k_neurons',$k_array);
}
?>
