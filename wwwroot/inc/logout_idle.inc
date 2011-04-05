<?php

// Logout user, if idle for more then LOGOUT_IDLE_SEC seconds

if (( !isset($_SESSION['last_request'] )) || 
	( $_SESSION['last_request'] >= (time() - LOGOUT_IDLE_SEC))) { 
	$_SESSION['last_request'] = time();
} else {
	require_once(INCLUDE_DIR."eventz/logout.inc");
	logout();
}

?>
