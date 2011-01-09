<?php
if(preg_match('/36$/', $event) || preg_match('/36$/', $_POST['event'])) {
  $event = preg_replace('/36$/', '', $event);
  $_POST['event'] = preg_replace('/36$/', '', $_POST['event']);
  $_POST['nodeshell_id'] = base_convert($_POST['nodeshell_id'], 36, 10); //put36
  $_POST['new_parent'] = base_convert($_POST['new_parent'], 36, 10); //set_parent36
}

if($event=='delete' || $_POST['event']=='delete') { //XXX TODO FIXME UglyFuckingHack - should go to delete.inc (but something is broken)
  $event='set_parent';
  $_POST['event']=$event;
  $_POST['new_parent']=123456; //XXX TODO FIXME Hardcoded
}

//do not make a permission check if an event was executed before
if ($_SESSION['eventz'][$event]) {
	include_once(INCLUDE_DIR."eventz/$event.inc");
	$status=$event();
}

elseif (is_file(INCLUDE_DIR."eventz/$event.inc")) {
	$event_id=nodes::getNodeIdByName($event,"event://$event");
	$event_node=nodes::getNodeById($event_id,$_SESSION['user_id']);
	if (
		($event_node['node_system_access']=='public')
		|| ($event_node['node_creator']==$_SESSION['user_id'])
		|| ($event_node['node_permission']=='op')
		|| ($event_node['node_permission']=='execute')
		|| ($event_node['node_permission']=='master')
		|| ($event=='display')
	) {
		include_once(INCLUDE_DIR."eventz/$event.inc");
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
