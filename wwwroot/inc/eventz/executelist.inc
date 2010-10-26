<?php
function executelist() {
    global $db,$error,$node;
    $node_id=$node['node_id'];
    $silence=explode(";",$_POST['execute']);
    if (($node['node_permission']!='owner') && ($node['node_permission']!='master')) {
        $error=$error_messages['EVENT_PERMISSION_ERROR'];
        return false;
    }
    $db->query("update node_access set node_permission='' where node_id=$node_id and node_permission='execute'");
    foreach ($silence as $sil) {
        $set=$db->query("select user_id from users where login='$sil'");
        $set->next();
        if ($set->getString('user_id')) {
            $q="update node_access set node_permission='execute' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
            $changed=$db->update($q);
            if (!$changed) {
                $q="insert into node_access set node_permission='execute',node_id=$node_id,user_id=".$set->getString('user_id');
                $db->query($q);
            }
            $logger->log('add execute',$node_id,'ok',$execute);
        }else { $error .= "$execute does not exist..."; }
    }
}
?>
