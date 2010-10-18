<?php
function unignore() {
  global $error,$node,$db;
  $node_id=$node['node_id'];
  $ignore=$node['node_parent'];
  $user_id=$_SESSION['user_id'];
  if ($node['node_creator'] != $user_id) {
    $error = "ta smola chlapce. ta na tento skutok prava nemas. ta polib mi prdel";
    return false;
  }
  $q = "update nodes set external_link='' where node_id='$node_id' and
external_link='session://ignore'";
  $db->query($q);

$_SESSION['ignore'][$ignore]=false;

}
?>