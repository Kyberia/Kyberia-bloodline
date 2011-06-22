<?php

// Get last submissions that appeared on kyberia (all users)
// XXX permission checking?

function smarty_function_get_last($params,&$smarty) {

	$last=nodes::GetLast($params/*$listing_ammount,$offset,$order_by*/);
	$smarty->assign('get_last', $last);


}
?>
