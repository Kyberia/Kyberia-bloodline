<?php
	function upload_own_template() {

		global $db,$error,$node;
		$node_id=$node['node_id'];
		$node_template=$_POST['node_template'];

		if (Is_Array($_FILES['template_file'])) {
			copy($_FILES['template_file']['tmp_name'],OWN_TEMPLATE_DIR.'/'.$node['node_id'].".tpl");
		}
		$db->query("update nodes set node_template='$node_template' where node_id='$node_id'");
	}

?>