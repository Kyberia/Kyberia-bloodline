<?php

function undelete() {

global $db,$error;
$undelete_id=$_POST['undelete_id'];
if (nodes::getNodeById($undelete_id)) {
$error="node $undelete_id still exist. cannot undelete";
return false;
}

$query = "insert into nodes
                    (node_id, node_name, node_parent, node_vector,  node_external_access,
                    node_system_access, node_children_count, node_creator, node_created,
                    lastchild_created, k, node_views, node_descendant_count, lastdescendant_created, template_id)
            select
                    tiamat.node_id, tiamat.node_name, tiamat.node_parent, tiamat.node_vector,
                    tiamat.node_external_access, tiamat.node_system_access, tiamat.node_children_count, tiamat.node_creator,
                    tiamat.node_created, tiamat.lastchild_created, tiamat.k, tiamat.node_views, tiamat.node_descendant_count,
                    tiamat.lastdescendant_created, tiamat.template_id from tiamat where tiamat.node_id = '$undelete_id' order by update_performed desc limit 1";

$db->query($query);
return true;
}
?>



