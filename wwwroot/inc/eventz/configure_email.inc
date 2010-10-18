<?php
function configure_email() {
    global $db,$error,$node;
    $node_id=$node['node_id'];
    $user_id=$_SESSION['user_id'];
    if ($node['node_permission']=='owner') {
        if(!empty($node_id)) {
            if($node_id == $user_id) {
                $user_email=addslashes($_POST['user_email']);
                $q="update users set email='$user_email' where user_id='$node_id'";
                $db->query($q);
            }
        }
    }
return true;
}
?>
