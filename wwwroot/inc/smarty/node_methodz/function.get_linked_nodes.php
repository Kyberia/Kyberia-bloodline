<?php
//returns array of linked nodes, possible args listing_amount,offset,node_id,orderby=synapse

	function smarty_function_get_linked_nodes($params,&$smarty) {
		global $db, $error, $node;

                if ($params['listing_amount']=='all') $listing_amount='23232323232323323';
                elseif (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
                else $listing_amount=DEFAULT_LISTING_AMOUNT;

                if (is_numeric($params['offset'])) $offset=$params['offset'];
		elseif (is_numeric($_POST['offset'])) $offset=$_POST['offset'];
		else $offset=0;



		if ($params['node_id']) {
			$node_id=$params['node_id'];
		}

		else {
			$node_id=$node['node_id'];
		}

		if ($params['orderby']='synapse') {
			$orderby='synapse_created';
		}

		else {
			$orderby='node_id';
		}



		$q="select neurons.synapse_created,node_content,author.login,linker.login as linker,nodes.* from neurons left join nodes on neurons.src=nodes.node_id left join users as linker on neurons.synapse_creator=linker.user_id left join users as author on nodes.node_creator=author.user_id  where dst='$node_id' and link in ('hard','bookmark') order by $orderby desc limit $offset , $listing_amount";
		$result=$db->query($q);
		while ($result->next()) {
			$array=$result->getRecord();
			transport_process_node($array);
			$array['node_status']="linked";
			$array['node_created']=$array['synapse_created'];
			$get_linked_nodes[]=$array;
		}
		$smarty->assign('get_linked_nodes',$get_linked_nodes);

}

?>

