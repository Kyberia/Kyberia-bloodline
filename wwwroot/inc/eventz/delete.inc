<?php
function delete() {
	$event='set_parent';
	$_POST['event']=$event;
	$_POST['new_parent']=123456; //XXX TODO FIXME Hardcoded
	include(INCLUDE_DIR.'eventz.inc');
}
