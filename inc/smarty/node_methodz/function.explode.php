<?php
function smarty_function_explode($params,&$smarty) {
	$array = explode($params['separator'],$params['string']);
	$smarty->assign('explode',$array);
}
?>
