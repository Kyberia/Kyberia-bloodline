<?php

	function smarty_function_get_threaded_children($params,&$smarty) {
		global $db, $error, $node;

		if (!strlen($node['node_vector'])) {
			ob_start();
 			phpinfo(INFO_VARIABLES);
			print_r($_SESSION);
			$s = ob_get_contents();
			ob_end_clean();
			}
		$offset=$params['offset'];
		$limit=$params['listing_amount'];
		if ($limit > 100)
			$limit = 100;

                if (!empty($params['search'])) {
			if ($params['search_type']=='content') $sql_type.=" and node_content like '%".addslashes($params['search'])."%' ";
			else {
				$q2="select user_id from users where login='".$params['search']."'";
				$userset=$db->query($q2);
				$userset->next();
				$id=$userset->getString('user_id');
				$sql_type=" and nodes.node_creator='$id'";
			}

		}
		if (!empty($_POST['synapse_time'])) $sql_synapse.=" and node_created >'".$_POST['synapse_time']."'";
		if (empty($params['orderby']) OR $params['orderby']=='desc') {
			//$orderby="node_vector desc";
			$orderby="concat(node_vector,'z') desc,depth";
		}
		else {
 			$orderby="node_vector asc";
		}

if ($params['time']) {
$time=addslashes($params['time']);
$sql_time="node_created > '$time' and";
}
if ($node['node_system_access']=='public') $security=" and node_system_access!='private'";
else $security = "";

		// by br & maniac

		if ($node['node_vector']=='') {
		  $node['node_vector']='blabla';
	//	  system("echo \"node: $node[node_id]\" >> /tmp/blabla.log") ;
		}

		if ($params['link']=='yes') $q.="(";
		$q.="select nodes.node_id,node_name,node_external_access,external_link,node_parent,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,node_views,node_descendant_count,lastdescendant_created,template_id,node_updated,length(node_vector) as depth,users.login,node_vector, node_content,'' as synapse_creator from nodes left join users on users.user_id=nodes.node_creator where $sql_time node_vector like '".$node['node_vector']."%' $sql_type  and node_id != '".$node['node_id']."' $security order by $orderby LIMIT $offset,$limit";

		if ($params['link']=='yes') {
			$q.=" ) UNION (select nodes.node_id,node_name,node_external_access,external_link,node_parent,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,node_views,node_descendant_count,lastdescendant_created,template_id,node_updated,length(dst_vector) as depth,
			users.login,dst_vector as node_vector,node_content,synapse_creator from neurons left join nodes on neurons.src=nodes.node_id  left join users on users.user_id=nodes.node_creator where  $sql_time dst_vector like '".$node['node_vector']."%' $sql_synapse $sql_type  and node_id != '".$node['node_id']."' order by $orderby LIMIT $offset,$limit)";
		}

		if ($params['link']=='yes') $q.=" order by $orderby LIMIT $limit";

		$result=$db->query($q);

		while ($result->next()) {
$child = $result->getRecord();
if ($child['synapse_creator']!='') $child['node_status']='linked';
$get_children_array[]=$child;
		}
		global $time_1, $time_2;
		$time_2=$result->getString('node_created');
		$time_1=$get_children_array[0]['node_created'];

		$smarty->assign('get_threaded_children',$get_children_array);

	}
?>

