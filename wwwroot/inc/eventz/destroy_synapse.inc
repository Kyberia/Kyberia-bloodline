<?php
function destroy_synapse() {
global $error_messages,$db,$node,$error;

// core idea an programming by id Redtime, debug by DarkAural

$user_id=$_SESSION['user_id'];
$node_id=$node['node_id'];
if (is_array($_POST['node_chosen'])) {
$srcs=$_POST['node_chosen'];
}else{ 
	$error="Ak chces nejaky ten put zmazat musis si najskor nejaky ten put vybrat.Logicke nie?:-)";
	return false;
}

if (!is_numeric($node_id)) {
	$error=$error_messages['NUMERIC_NOT_NUMERIC'];
	return false;
}

foreach ($srcs as $chosen) {

if (!is_numeric($chosen)) {
	$error=$error_messages['NUMERIC_NOT_NUMERIC'];
}

$kset=$db->query("select synapse_creator from neurons where dst='$node_id' and src='$chosen'");
$kset->next();$synapse_creator=$kset->getString('synapse_creator');

$kset=$db->query("select node_creator from nodes where node_id='$chosen'");
$kset->next();$node_creator=$kset->getString('node_creator');

$dnode=nodes::getNodeById($node_id,$_SESSION['user_id']);
if ($synapse_creator == $user_id || $node_creator == $user_id || permissions::isHierarch($dnode)) {
	$q="update neurons set dst_vector='',link='soft',synapse_creator='$user_id' where dst='$node_id' and src='$chosen' and link='hard'";
	$db->update($q);
	$db->update("update nodes set node_children_count=node_children_count-1 where node_id='$node_id'");
} else{
	global $error;
	$error="Nemas pravomoci na vykonanie daneho skutku....";
	return false;
}

}

return true;

}?>
