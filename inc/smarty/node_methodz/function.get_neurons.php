<?php

	function smarty_function_get_neurons($params,&$smarty) {
		global $db, $error, $node;
		$node_id=$node['node_id'];
		$q="select neurons.*,node_content,users.login,nodes.* from neurons left join nodes on neurons.src=nodes.node_id left join users on nodes.node_creator=users.user_id  where dst='$node_id' order by synapse desc";
		$result=$db->query($q);
		while ($result->next()) {
			$get_dendrites[]=$result->getRecord();
		}
		$smarty->assign('get_dendrites',$get_dendrites);

		$q="select neurons.*,node_content,users.login,nodes.* from neurons left join nodes on neurons.dst=nodes.node_id left join users on nodes.node_creator=users.user_id where src='$node_id'  order by synapse desc";
		$result=$db->query($q);
		while ($result->next()) {
			$get_axons[]=$result->getRecord();
		}
		$smarty->assign('get_axons',$get_axons);

	}
?>