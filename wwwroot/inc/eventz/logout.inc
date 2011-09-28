<?php

// log out user

function logout() {

	nodes::logout();
	logger::log('logout',empty($node['node_id']) ? "" : $node['node_id'],'ok',$_SESSION['user_name']); 
	session_unset();
	Header("Location: /");
}

?>
