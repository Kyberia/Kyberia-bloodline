<?php
function configure_www() {
    global $db,$error,$node;
    $node_id=$node['node_id'];
    $user_id=$_SESSION['user_id'];
    if ($node['node_permission']=='owner') {
        if(!empty($node_id)) {
            if($node_id == $user_id) {
                $user_www=addslashes($_POST['user_www']);
                $q="update users set www='$user_www' where user_id='$node_id'";
                $db->query($q);
            }
        }
    }
return true;
}
?>