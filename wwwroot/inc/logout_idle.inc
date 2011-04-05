<?php
if(!isset($_SESSION['last_request']) || $_SESSION['last_request'] >= (time() - 60*60)) { //TODO predelat timeout do konstanty v nastaveni
	$_SESSION['last_request'] = time();
} else {
	require_once(INCLUDE_DIR."eventz/logout.inc");
	logout();
}
