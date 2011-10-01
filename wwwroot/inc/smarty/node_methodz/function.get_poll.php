<?php
// bugfix. Opravuje zobrazovanie ankiet v nadparentoch kde nemaju byt.
// XXX Wotta fokka, rewrite completly.

function smarty_function_get_poll($params,&$smarty) {
	global $node;
	$user_id=$_SESSION['user_id'];
	$node_vector=$node['node_vector'];
	if (isset($params['poll_id']) && is_numeric($params['poll_id'])) {
		$poll_id=$params['poll_id'];
	} else {
		$poll_id=$node['node_id'];
	}

	if (isset($params['poll']) && is_array($params['poll'])) {
		$array=$params['poll'];
		$voted='yes';
	} else {
		$array=nodes::getPoll($user_id,$poll_id);
		if (isset($array['node_permission']) && $array['node_permission']=='ban') $voted='yes';
		else $voted='no';
	}

	$option_array=unserialize($array['node_content']);
	$permission=$array['node_permission']; // XXX WTF? sec. hole?

	$poll=Array("voted"=>$voted,"node_id"=>$array['node_id'],"question"=>$array['node_name'],"total"=>$array['node_views'],"options"=>$option_array);
	$smarty->assign('get_poll',$poll);

}
?>
