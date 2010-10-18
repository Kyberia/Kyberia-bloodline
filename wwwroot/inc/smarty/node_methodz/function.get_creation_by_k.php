<?php
function smarty_function_get_creation_by_k($params,&$smarty) {
	global $db,$node;

	if ($params['orderby'] == 'asc') $orderby = 'asc';
	else $orderby = 'desc';

	if ($params['listing_amount'] == 'all') $listing_amount = '232323';
	elseif (is_numeric($params['listing_amount'])) $listing_amount = $params['listing_amount'];
	else $listing_amount = DEFAULT_LISTING_AMOUNT;

	if (is_numeric($params['offset'])) $offset = $params['offset'];
	elseif (is_numeric($_POST['offset'])) $offset = $_POST['offset'];
	else $offset = 0;

	$q = "select users.*,nodes.* from nodes left join users on users.user_id=nodes.node_creator where node_creator = ".$node['node_id']." and k > 0 order by k $orderby LIMIT $offset,$listing_amount";
	$set = $db->query($q);

	while ($set->next()) $array[] = $set->getRecord();

	$smarty->assign('get_creation_by_k',$array);
}
?>