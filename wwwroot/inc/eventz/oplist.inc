<?php
function oplist() {
    global $db,$error,$node;
    $node_id=$node['node_id'];

    if (($node['node_permission']!='owner') && ($node['node_permission']!='master')) {
        $error=$error_messages['EVENT_PERMISSION_ERROR'];
        return false;
    }

    $ops=explode(";",$_POST['oplist']);
    $db->query("update node_access set node_permission='' where node_id=$node_id and node_permission='op'");
    foreach ($ops as $op) {
        $set=$db->query("select user_id from users where login='$op'");
        $set->next();
        if ($set->getString('user_id')) {
            $q="update node_access set node_permission='op' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
            $changed=$db->update($q);
            if (!$changed) {
                $q="insert into node_access set node_permission='op',node_id=$node_id,user_id=".$set->getString('user_id');
                echo $q;
                $db->query($q);
            }
            $logger->log('add op',$node_id,'ok',$op);
        }else { $error .= "$op does not exist..."; }
    }
}
?>
