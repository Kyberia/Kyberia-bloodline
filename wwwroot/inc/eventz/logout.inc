<?php

	function logout() {
		global $db;
		$q="update users set user_action_id=null where user_id='".$_SESSION['user_id']."'";
		$db->query($q);
		logger::log('logout',$node['node_id'],'ok',$_SESSION['user_name']); 
		session_unset();
		Header("Location: /main");
	}

?>
