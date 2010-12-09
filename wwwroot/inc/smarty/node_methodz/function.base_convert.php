<?php
	function smarty_function_base_convert($params,&$smarty) {
		return(base_convert($params['n'],$params['f'],$params['t']));
	}
