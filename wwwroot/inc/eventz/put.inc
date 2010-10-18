<?php
function put() {
	global $error_messages,$db,$node,$error;
	$user_id = $_SESSION['user_id'];

	if (!empty($_POST['nodeshell_id'])) $nodeshell_id = mysql_real_escape_string($_POST['nodeshell_id']);
	else $nodeshell_id = mysql_real_escape_string($_POST['nodeshell_id_select']);

	$nodeshell = nodes::getNodeById($nodeshell_id,$_SESSION['user_id']);
	$nodeshell_permissions = permissions::checkPermissions($nodeshell);
	$nodeshell_vector = $nodeshell['node_vector'];

	if (!$nodeshell_permissions['w']) {
		$error = $error_messages['WRITE_PERMISSION_ERROR'];
		return false;
    }

	if (is_array($_POST['node_chosen'])) $put_array = $_POST['node_chosen'];
	else $put_array[] = $node['node_id'];

	foreach ($put_array as $chosen) {
		$dst_vector = $nodeshell_vector.str_pad($chosen,VECTOR_CHARS,0,STR_PAD_LEFT);
		$q = "update neurons set synapse_created=NOW(),link='hard',synapse=synapse+1,
dst_vector='$dst_vector' where src='$chosen' and dst='$nodeshell_id'";
		$result=$db->update($q);

		if (!$result) $db->query("insert into neurons set synapse_creator='$user_id',synapse_created=NOW(),
src='$chosen',dst='$nodeshell_id',dst_vector='$dst_vector',link='hard',synapse=1");

		$db->query("update nodes set lastdescendant_created=NOW() where node_id='$nodeshell_id'");
	}
}
?>
