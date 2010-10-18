<?php
function set_as_read() {
    global $db;
    $user_id = $_SESSION['user_id'];
    $forums = $_POST['bookmarks_chosen'];

    foreach ($forums as $forum) {
        $db->update("update node_access set node_user_subchild_count = '0',
 last_visit = NOW() where node_id = '$forum' and user_id = '$user_id'");
    }
}
?>