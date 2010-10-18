<?php
function unfriend() {
    global $db,$error,$node;
    $node_id = $node['node_id'];
    $user_id = $_SESSION['user_id'];
    $friend = $node['node_parent'];

    if ($user_id != $node['node_creator']) {
        $error = "nejsi vlastnik tohto priatela";
        return false;
    }

    $q = "update nodes set external_link='', node_parent=123456, node_vector='001234560$node_id' where node_id='$node_id' and external_link='session://friend'";
    $db->query($q);

    $_SESSION['friends']['$friend']=false;
}
?>