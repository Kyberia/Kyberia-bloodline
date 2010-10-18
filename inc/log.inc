<?php
class log {

	function log($action,$node_id,$result,$parameter1='',$parameter2='') {

		global $db,$node;
		$user_id=$_SESSION['user_id'];
//		$db->query("insert delayed into logs set event='$action',node_id='$node_id',user_id='$user_id',result='$result',parameter1='$parameter1',parameter2='$parameter2'");

	}

}
?>