<?php
function configure_content() {
    global $db,$error,$node;
    $node_id = $node['node_id'];

    if ($node['node_permission']!=('owner' || 'master' || 'op')) {
        $error = $error_messages['EVENT_PERMISSION_ERROR'];
        return false;
    }

    $node_content = nodes::processContent($_POST['node_content']);

    if ($_POST['code']) {
        $params['node_creator'] = UBIK_ID;
        $params['node_parent'] = WARNING_ZONE;
        $params['node_name'] = "node $node_id configured as code";
        $params['node_content'] = mysql_real_escape_string("node <a href=/id/$node_id>$node_id</a> added as code  by user ".$_SESSION['user_name']);
        unset($_POST['code']);
        nodes::addNode($params);
    }

    if (!$node_content) {
        return false;
    }

    $db->update("update nodes set node_updated=NOW() where node_id='$node_id'");
    $user_id = $_SESSION['user_id'];
    $qtiamat = "insert into tiamat (node_id,node_name,node_parent,node_vector,
            node_external_access,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,
            node_views,node_destructor,node_content,node_descendant_count,lastdescendant_created,template_id,update_performed)
            select node_id,node_name,node_parent,node_vector,node_external_access,node_system_access,
            node_children_count,node_creator,node_created,lastchild_created,k,node_views,'$user_id',node_content,
            node_descendant_count,lastdescendant_created,template_id, NOW()
            from nodes where node_id = '$node_id'";
    $db->query($qtiamat);

    $qu = "update nodes set node_content = '".mysql_real_espace_string($node_content)."' where node_id = '$node_id'";
    $result = $db->update($qu);
    $qu2 = "update node_content set node_content = '".mysql_real_espace_string($node_content)."' where node_id = '$node_id'";
    $result = $db->update($qu2);

    return true;
}
?>