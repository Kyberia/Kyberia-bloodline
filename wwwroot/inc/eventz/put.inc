<?php
function put() {


	if (!empty($_POST['nodeshell_id'])) $nodeshell_id = mysql_real_escape_string($_POST['nodeshell_id']);
	else $nodeshell_id = mysql_real_escape_string($_POST['nodeshell_id_select']);

	if (is_array($_POST['node_chosen'])) $put_array = $_POST['node_chosen'];
	else {
		global $node;
		$put_array[] = $node['node_id'];
	}

	foreach ($put_array as $chosen) {
		nodes::putNode($chosen,$nodeshell_id);
	}
}
?>
