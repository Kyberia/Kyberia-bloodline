<?php

// Setting weight of the synapse.
// Synapse is connection betwenn current node and logged user

function set_synapse_weight() {

	global $db,$error,$node,$permissions,$types;

	if (!empty($_POST['synapse_weight'])) {
		$params['synapse_weight']=$_POST['synapse_weight'];
		$params['from']=$_SESSION['user_id'];
		$params['to']=$node['node_id'];

		nodes::setSynapse($params);
		return true;
	}

	return false;
}

?>
