<?

global $node,$db,$error;
// All mysql code should go here
// Split into multiple files if needed


// Called for every node view. Updates node views, neurons, 
function update_nodes(user_id,node_id,referer_id) {

	$db->update("update nodes set node_views=node_views+1 where".
		     "node_id='".$node_id."'");
	if (is_numeric($referer_id) && ($referer_id)) {
		$q="update neurons set synapse=synapse+1 where ".
		    "dst='".$node_id."' and src='$referer_id'";
		$result=$db->update($q);
		if (!$result) {
			$q="insert into neurons set synapse_creator='".
			   $user_id."',dst='".$node_id.
			   "',src='$referer_id',synapse=1";
			$db->query($q);
		}
	}

	// LEVENSHTEIN

	// these 4 lines are not the source of kyberia lagging problems.
	// leave them. started on the 10.4. 
	// data gained will be used for scientific purposes
	if ($user_id) {
	        $q="insert delayed into levenshtein set user_id='".
		    $user_id."',node_id='".$node_id."'";
	        $db->update($q);
	}
}

?>
