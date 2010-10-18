<?php
function ignore() {
  global $error,$node,$db;
  $node_id=$node['node_id'];
$ignore=$node['node_parent'];
  $user_id=$_SESSION['user_id'];
  if ($node['node_creator'] != $user_id) {
    $error = "fcknthck";
    return false;
  }
  $q = "update nodes set external_link='session://ignore' where node_id='$node_id' and external_link='session://friend'";
  $db->query($q);
$_SESSION['ignore'][$ignore]=true;

}
?>