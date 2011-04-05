<?php

// Get all the direct replies for user submisions

function smarty_function_get_user_submissions_children($params, &$smarty) {

	if (!isset($_SESSION['user_id')
		$user_id = $_SESSION['user_id'];
	else
		return -1;

	if (!isset($params['listing_amount']))
		$listing_amount = DEFAULT_LISTING_AMMOUNT;
	else
		$listing_amount = $params['listing_amount'];

	if (empty($params['offset']))
		$offset = 0;
	else
		$offset = $params['offset'];
        
	if (!isset($params['order_by']))
		$order_by = $params['order_by'];
	else
		$order_by = 'node_id';

	$replies=nodes::GetUserSubmissionsChildren($user_id,$listing_ammount,$offset,$order_by);

	$smarty->assign('get_user_submissions_children', $replies);
}

?>
