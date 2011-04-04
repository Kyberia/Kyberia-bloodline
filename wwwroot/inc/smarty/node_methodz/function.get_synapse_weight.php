<?php

// Function for getting synapse weight from actual user to a node 
// used for node setting

function smarty_function_get_synapse_weight($params,&$smarty) {

	global $db,$node;

	$user_id=$_SESSION['user_id'];
	$node_id=$params['node_id'];

	$synapse_weight=nodes::getSynapseWeight($user_id,$node_id);

	$smarty->assign('synapse_weight',$synapse_weight);

}
?>
