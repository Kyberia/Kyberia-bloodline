<?php
function smarty_function_rand($params,&$smarty) {
    if (is_numeric($params['min']) || is_numeric($params['max'])) {
        $rand = rand($params['min'],$params['max']);
    }
    else $rand = rand();
    $smarty->assign('rand',$rand);
}
?>