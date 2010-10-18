<?php

function set_type() {
	global $node,$db;
	$node_type=$_POST['node_type'];
	$node_id=$node['node_id'];
	$q="update nodes set node_type='$node_type' where node_id='$node_id'";
	echo $q;
	$db->query($q);

}

?>