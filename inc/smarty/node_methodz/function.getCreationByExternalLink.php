<?php

	function smarty_function_getCreationByExternalLink($params,&$smarty) {


		$external_link=$params['external_link'];
		if ($params['listing_amount']=='all') $listing_amount='23232323232323323';
		elseif (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
		else $listing_amount=DEFAULT_LISTING_AMOUNT;

		if (empty($params['offset'])) $offset=0;
		else $offset=$params['offset'];

		global $db,$node;
		if (is_numeric($params['creator_id'])) $creator_id=$params['creator_id'];
		else $creator_id=$node['node_id'];
		if (is_numeric($params['template_id'])) $template_id=$params['template_id'];
		else $template_id=DEFAULT_TEMPLATE;

		$user_id=$_SESSION['user_id'];

		$q="select parent.node_name as
		parent_name,nodes.* from nodes
		left  join nodes as parent on parent.node_id=nodes.node_parent
		where nodes.node_creator='$creator_id'  and
		nodes.external_link='$external_link' and
		nodes.node_system_access!='private' order by
		nodes.node_created desc LIMIT $offset,$listing_amount";

		$set=$db->query($q);
		while ($set->next()) $pole[]=$set->getRecord();
		$smarty->assign('getCreationByExternalLink',$pole);
	}
?>