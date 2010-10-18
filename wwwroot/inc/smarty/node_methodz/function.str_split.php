<?php
function smarty_function_str_split($params,&$smarty) {
	if (!function_exists("str_split")) {
		function str_split($str,$length = 1) {
			if ($length < 1) return false;
			$strlen = strlen($str);
			$ret = array();
			for ($i = 0; $i < $strlen; $i += $length) {
				$ret[] = substr($str,$i,$length);
			}
			return $ret;
		}
	}

	$name = $params['name'];
	if (!empty($name)) $array[$name] = str_split($params['string'],$params['length']);
	else $array = str_split($params['string'],$params['length']);
	$smarty->assign('str_split',$array);
}
?>