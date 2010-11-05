<?php
function set_parent2() {
// fixes put related bugs while reparenting >> that is fixes put dst vector
global $node,$db,$error;
$new_parent_id=$_POST['new_parent'];
$nodes=$_POST['node_chosen'];
$hierarch_id=$node['node_id'];

$new_parent=nodes::getNodeById($new_parent_id,$_SESSION['user_id']);
$new_parent_permissions=permissions::checkPermissions($new_parent);

if (!$new_parent_permissions['w'] and !isHierarch($new_parent)) {
global $error_messages;
$error=$error_messages['WRITE_PERMISSION_ERROR'];
return false;
}

$parent_vector=$new_parent['node_vector'];

if (!is_array($nodes)) {
$nodes[]=$node['node_id'];
}

if (($node['node_creator']!=$_SESSION['user_id']) and
($node['node_permission']!='master') and !permissions::isHierarch($node)) {
global $error_messages;
$error=$error_messages['EVENT_PERMISSION_ERROR'];
return false;
}

foreach ($nodes as $chosen_id) {
unset($chosen);

$new_vector=$parent_vector.str_pad($chosen_id,VECTOR_CHARS,"0",STR_PAD_LEFT);

$kset=$db->query("select src from neurons where dst='$chosen_id' and link='hard'");
$kset->next();$src=$kset->getString('src');


echo 'Debug:: Novy vektor putu';
echo $new_vector.$src;



$chosen=nodes::getNodeById($chosen_id,$_SESSION['user_id']);

if (($chosen['node_creator']!=$_SESSION['user_id']) and
($chosen['node_permission']!='master') and !permissions::isHierarch($chosen)) {
global $error_messages;
$error=$error_messages['EVENT_PERMISSION_ERROR'];
return false;
}


$db->query("start transaction");
$q="update nodes set node_parent='$new_parent_id',node_vector='".$new_vector."' where
node_id='$chosen_id'";
$db->query($q);
$q="update nodes set
node_vector=replace(node_vector,'".$chosen['node_vector']."','$new_vector') where
node_vector like '".$chosen['node_vector']."%'";
$changed=$db->update($q);
$q="update nodes set node_children_count=node_children_count+1 where node_id='$new_parent_id'";
$db->update($q);

$set=$db->query("select * from neurons where dst='$chosen_id' and link='hard'");
if ($set->getNumRows()>0){

$q="update neurons set dst_vector='$new_vector.$src' where dst='$chosen_id' and link='hard'";
$db->update($q);
}
$db->query("commit");

echo '<br>debug:: pocet putov v node:: <br>';
// $q="update neurons set dst_vector='',link='soft',synapse_creator='$user_id' wheredst='$node_id' and src='$chosen' and link='hard'";

$set=$db->query("select * from neurons where dst='$chosen_id' and link='hard'");
echo $set->getNumRows();

}
return false;
}
?>