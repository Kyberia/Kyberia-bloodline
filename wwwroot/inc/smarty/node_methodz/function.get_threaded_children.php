<?php

function smarty_function_get_threaded_children($params,&$smarty) {
	global $error, $node;

	$offset=isset($params['offset']) ? $params['offset'] : "";
	$limit=isset($params['listing_amount']) ? $params['listing_amount'] : DEF_LISTING_AMMOUNT;
	$limit=($limit > DEF_MAX_LISTING_AMMOUNT) ? DEF_MAX_LISTING_AMMOUNT : $limit; 
	$synapse_time= isset($_POST['synapse_time'])? $_POST['synapse_time'] : "";
	$orderby=isset($params['orderby']) ? $params['orderby'] : "desc";
	$time=isset($params['time']) ? $params['time'] : "";
	$link=(isset($params['link']) && $params['link']=='yes') ? "yes" : "";
	$node_id=$node['node_id'];
	$node_vector=$node['node_vector'];
	

	// XXX WTF
	if ($node['node_system_access']=='public') { $security="yes"; }
	else { $security = ""; }

	if (!empty($params['search'])) {
		if ($params['search_type']=='content') { 
			$search='content';
			$search_param=$params['search'];
		} else {
			$id=nodes::getUserByLogin($params['search']);
			$search='user';
			$search_param=$id;
		}
	} else {	
		$search="";
		$search_param="";
	}

	nodes::getThreadedChildren($offset,$limit,$orderby,$time,$synapse_time,$security,$link,$search,$search_param);

	$smarty->assign('get_threaded_children',$get_children_array);
}
?>
