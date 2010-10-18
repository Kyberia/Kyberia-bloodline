<?php function addAjax() {
global $db,$error,$node, $error_messages;
$add_ajax_id=$_POST['add_ajax_id']; if (!is_numeric($add_ajax_id)) {
$error=$error_messages['NOT_NUMERIC'];
return false; }
$set=$db->query("select node_content,node_name from nodes left join node_content on node_content.node_id=nodes.node_id where nodes.node_id='$add_ajax_id'");
$set->next();
$node_content=$set->getString('node_content');
$class_name=$set->getString('node_name');
$fp = fopen (AJAX_DIR.$class_name.".php","w+");
fwrite($fp,$node_content);
fclose($fp);
chown(AJAX_DIR.$class_name,"www");
$q="update nodes set external_link='' where node_name='$class_name' and external_link='ajax://$class_name'";
$db->query($q);
$q="update nodes set external_link='ajax://$class_name' where node_id='".$add_ajax_id."'";
$db->query($q);
return true; }
?>