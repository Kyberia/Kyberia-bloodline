<?php
function unbook_multi() {

global $db,$error,$node;
$bookmarks=$_POST['bookmarks_chosen'];

foreach ($bookmarks as $chosen_id) {
$q="update neurons set link='soft' where synapse_creator='".$_SESSION['user_id']."' and src='".$chosen_id."' and link='bookmark'";
$db->update($q);

$q="update node_access set last_visit='',node_bookmark='no' where user_id='".$_SESSION['user_id']."' and node_id='".$chosen_id."'";
$db->query($q);
}
return true;
}
?>