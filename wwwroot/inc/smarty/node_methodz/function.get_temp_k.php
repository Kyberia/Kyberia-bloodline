<?php
	function smarty_function_get_temp_k($params,&$smarty) {

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

$q="select COUNT(I.node_id) as count,length(concat(nodes.node_vector)) as vector_depth,nodes.*,nodes.node_creator as node_owner_id,creator.node_name as owner,
node_parent.node_name as node_parent_name
from I left join nodes on nodes.node_id=I.node_id
left join nodes as creator on creator.node_id=nodes.node_creator
left join nodes as node_parent on nodes.node_parent=node_parent.node_id
where cas>NOW()-INTERVAL $interval HOUR and nodes.node_system_access='public'
and nodes.node_vector like '$vector%'
GROUP BY I.node_id ORDER BY count desc";

		$set=$db->query($q);
		while ($set->next()) {
			$k_array[]=$set->getRecord();
		}

		$smarty->assign('get_temp_k',$k_array);



	}
?>

