<?php

// XXX WTF

function addClass() {

global $db,$error,$node, $error_messages;
$add_class_id=$_POST['add_class_id'];

if (!is_numeric($add_class_id)) {
$error=$error_messages['NOT_NUMERIC'];
return false;
}

$set=$db->query("select node_content,node_name from nodes left join node_content
on node_content.node_id=nodes.node_id where nodes.node_id='$add_class_id'");
$set->next();
$node_content=$set->getString('node_content');
$class_name=$set->getString('node_name');
$fp = fopen (INCLUDE_DIR.$class_name,"w+");
fwrite($fp,$node_content);
fclose($fp);
chown(INCLUDE_DIR.$class_name,"www");

$q="update nodes set external_link='' where node_name='$class_name' and external_link='include://$class_name'";
$db->query($q);
$q="update nodes set external_link='include://$class_name' where node_id='".$add_class_id."'";
$db->query($q);

return true;
}

?>




