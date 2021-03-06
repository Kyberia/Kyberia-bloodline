<?php

function smarty_function_get_nodes_by_parent($params,&$smarty) {
	global $node;

	$sql_time="";
	$sql_type="";
	$parent=$params['parent'];
	$permissions=permissions::checkPerms($parent);
	if (!$permissions['r']) {
		$error=$error_messages['READ_PERMISSION_ERROR'];
		return false;
	}
	$parent_vectot=$parent['node_vector'];

	if ($params['listing_amount']=='all') $listing_amount=DEF_MAX_LISTING_AMMOUNT;
	else $listing_amount=$params['listing_amount'];
	if (empty($params['offset'])) $offset=0;
	else $offset=$params['offset'];

	if (isset($params['orderby'])) {
 		$orderby=db_escape_string($params['orderby']);
	}

	global $db,$node;
	$node_id=$node['node_id'];
	$user_id=$_SESSION['user_id'];
	if (isset($params['time'])) {
		$sql_time=" nodes.node_created > '".db_escape_string($params['time'])."' and ";
	}

	$q="select parent.node_name as parent_name,users.*,nodes.*,node_access.node_user_subchild_count from nodes left join nodes as parent on parent.node_id=nodes.node_parent left join node_access on node_access.node_id=nodes.node_id and node_access.user_id='$user_id' left  join users on users.user_id=nodes.node_creator where ";
	$q.=" $sql_time nodes.node_parent='$parent' and nodes.node_system_access!='private'";


                if (isset($_POST['template_event']) && $_POST['template_event']=='filter_by') {
                if (isset($_POST['search_type']) && $_POST['search_type']=='content')
       			         $sql_type.=" and node_content like '%".db_escape_string($_POST['node_content'])."%' ";
		else {
	                $q2="select user_id from users where login='".db_escape_string($_POST['node_content'])."'";
	                $userset=$db->query($q2);
	                $userset->next();
	                $id=$userset->getString('user_id');
	                $sql_type=" and nodes.node_creator='$id'";
                }
        	        $q.=$sql_type;
        }

	if (isset($orderby)) $q.=" order by $orderby ";
	else $q.=" order by nodes.node_id desc ";
	$q.= " LIMIT $offset,$listing_amount ";
	$set=$db->query($q);
	while ($set->next()) $pole[]=$set->getRecord();
	$smarty->assign('get_nodes_by_parent',$pole);

}
?>




