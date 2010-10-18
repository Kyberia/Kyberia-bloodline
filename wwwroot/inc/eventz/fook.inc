<?php
function fook() {
    global $error,$node,$db;
    $node_id = $node['node_id'];
    $user_id = $_SESSION['user_id'];

    $addnode['node_content'] = "fooking this forum";
    $addnode['node_name'] = "fook detected";
    $addnode['node_creator'] = $user_id;
    $addnode['node_parent'] = $node_id;
    $addnode['template_id'] = 4;
    $addnode['external_link'] = "session://fook";
    $addnode_id = nodes::addNode($addnode);

    $_SESSION['fook'][$node_id]=true;
}
?>