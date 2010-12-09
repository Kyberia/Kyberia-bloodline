<?php
    function bookstyl() {
	global $error,$node,$db;

	$user_id = $_SESSION['user_id'];
	$bookstyl = $_POST['bookstyl']; //XXX sqli

	$set=$db->query("select * from nodes where node_parent=19 and external_link='session://bookstyl' and node_creator='$user_id'");
	if($set->getNumRows() == 0) {

	$addnode['node_content'] = $bookstyl;
	$addnode['node_name'] = "book styl";
	$addnode['node_creator'] = $user_id;
	$addnode['node_parent'] = 19;
	$addnode['template_id'] = 4;
	$addnode['external_link'] = "session://bookstyl";
	$addnode_id = nodes::addNode($addnode);
	$_SESSION['bookstyl']= $bookstyl;

	}
	else {

	$q = "update nodes set node_content='$bookstyl' where node_parent=19 and external_link='session://bookstyl' and node_creator='$user_id'";
	$db->query($q);

	}
	$_SESSION['bookstyl']= $bookstyl;

}
?>
