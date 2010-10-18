<?php
function configure_icq() {
    global $db,$error,$node;
    $node_id=$node['node_id'];
    $user_id=$_SESSION['user_id'];
    if ($node['node_permission']=='owner') {
        if(!empty($node_id)) {
            if($node_id == $user_id) {
                $user_icq=addslashes($_POST['user_icq']);
                $q="update users set icq='$user_icq' where user_id='$node_id'";
                $db->query($q);
            }
        }
    }
return true;
}
?>