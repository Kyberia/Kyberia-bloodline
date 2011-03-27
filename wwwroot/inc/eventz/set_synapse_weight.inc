<?php

// Setting weight of the synapse.
// Synapse is connection between current node and logged user

function set_synapse_weight() {

	global $db,$error,$node,$permissions,$types;

	if (!empty($_POST['synapse_weight'])) {
		$params['weight']=$_POST['synapse_weight'];
		$params['src']=$_SESSION['user_id'];
		$params['dst']=$node['node_id'];

		nodes::setSynapse($params);
		return true;
	}

	return false;
}

?>
