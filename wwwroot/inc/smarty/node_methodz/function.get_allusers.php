<?php
	function smarty_function_get_allusers($params,&$smarty) {
		global $db,$node;
		$q="select user_id, login from  users where hash='' order by login ";
		$set=$db->query($q);
		$users[]=$set->getRecord();
		$smarty->assign('get_allusers',$users);
	}
?>
