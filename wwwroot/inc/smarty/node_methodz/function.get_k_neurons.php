<?php

function smarty_function_get_k_neurons($params,&$smarty) {

	global $db,$node;
	if (isset($params['offset']) && (is_numeric($params['offset']))) {
		$offset=$params['offset'];
	} else {$offset=20;} 
	if (isset($params['listing_amount']) && (is_numeric($params['listing_amount']))) {
		$listing_amount=$params['listing_amount'];
	} else {$listing_amount=DEFAULT_LISTING_AMOUNT;}
	if (isset($_POST['interval']) && (is_numeric($_POST['interval']))) {
		$interval= $_POST['interval'];
	} else {$interval = 1;}
	if (isset($params['vector']) && ($params['vector'])) {
		$vector=$params['vector'];
		$interval=365;
	} else {$vector="00";}

		
	// XXX other parameters
	$k_array=nodes::getKNeurons($_SESSION['user_id'],$offset);


	$smarty->assign('get_k_neurons',$k_array);
}
?>
