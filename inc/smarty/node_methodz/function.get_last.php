<?php

	function smarty_function_get_last($params,&$smarty) {

		if ($params['listing_amount']=='all') $listing_amount='-1';
		else $listing_amount=addslashes($params['listing_amount']);
		if (empty($params['offset'])) $offset=0;
		else $offset=addslashes($params['offset']);

		global $db,$node;

		if ($node['node_id']==23)  {
			$interval=" nodes.node_created>NOW()-INTERVAL 23 HOUR and";
			$params['vector']="00";
		}

		else {
			$vector=$node['node_vector'];
			$interval=" nodes.node_created>NOW()-INTERVAL 42 DAY and";
		}

		$node_id=$node['node_id'];
		$user_id=$_SESSION['user_id'];
		$q="select parent.node_name as parent_name,users.*,nodes.* from nodes
		left join nodes as parent on parent.node_id=nodes.node_parent
		left  join users on users.user_id=nodes.node_creator where $interval
		nodes.node_vector like '$vector%'  and
		nodes.node_system_access!='private' order by nodes.node_id desc LIMIT $offset,$listing_amount ";

		$set=$db->query($q);
		while ($set->next()) $pole[]=$set->getRecord();
		$smarty->assign('get_last',$pole);

	}
?>