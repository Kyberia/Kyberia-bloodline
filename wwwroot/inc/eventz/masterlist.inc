<?php

	function masterlist() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
if (($node['node_permission']!='owner') && ($node['node_permission']!='master')) {
$error=$error_messages['EVENT_PERMISSION_ERROR'];
return false;
}
		$masters=explode(";",$_POST['masterlist']);
		$db->query("update node_access set node_permission='' where node_id=$node_id and node_permission='master'");
		foreach ($masters as $master) {
			$set=$db->query("select user_id from users where login='$master'");
			$set->next();
			if ($set->getString('user_id')) {
				$q="update node_access set node_permission='master' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
				$changed=$db->update($q);
				if (!$changed) {
					$q="insert into node_access set node_permission='master',node_id=$node_id,user_id=".$set->getString('user_id');
					$db->query($q);
					logger::log('add master',$node_id,'ok',$master);

				}
			}
			else { $error .= "$master does not exist..."; }
		}
	}
?>
