<?php
class logger {

	public static function error_handler($errno=-1, $errstr='unknown', $errfile='/dev/null', $errline=-1, $errcontext=array('?')) {
		return error_log("$errfile:$errline = error #$errno: $errstr");
	}

	public static function log($action,$node_id,$result,$parameter1='',$parameter2='') {

		global $db,$node;
		$user_id = isSet($_SESSION['user_id'])?$_SESSION['user_id']:"";
		error_log('LOG: user: '.$user_id.', action: '.$action.
				', node_id: '.$node_id.', result: '.$result);
//		$db->query("insert delayed into logs set event='$action',node_id='$node_id',user_id='$user_id',result='$result',parameter1='$parameter1',parameter2='$parameter2'");

	}

}
