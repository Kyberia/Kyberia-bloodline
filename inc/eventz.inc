<?php
//do not make a permission check if an event was executed before
if ($_SESSION['eventz'][$event]) {
	include_once(SYSTEM_ROOT."/inc/eventz/$event.inc");
	$status=$event();
}

elseif (is_file(SYSTEM_ROOT."/inc/eventz/$event.inc")) {
	$event_id=nodes::getNodeIdByName($event,"event://$event");
	$event_node=nodes::getNodeById($event_id,$_SESSION['user_id']);
	if ($event_node['node_system_access']=='public'
|| ($event_node['node_creator']==$_SESSION['user_id'])
|| $event_node['node_permission']=='op'
|| $event_node['node_permission']=='execute'
|| $event_node['node_permission']=='master' ) {
		include_once(SYSTEM_ROOT."/inc/eventz/$event.inc");
		$status=$event();
		$_SESSION['eventz'][$event]=true;

	}

	else {
		$error=$error_messages['EVENT_NOT_PERMITTED'];
	}

}

else {
	$error=$error_messages['EVENT_NOT_EXISTENT'];
	$status=false;
}


if ($status>1) {
	Header("Location: /id/".$status."/");
}

elseif ($status) {
	Header("Location: /id/".$node['node_id']."/");
}


?>
