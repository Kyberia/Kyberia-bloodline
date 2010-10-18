<?php
function addEvent() {
    global $db,$error,$node, $error_messages;
    $add_event_id = $_POST['add_event_id'];

    if (!is_numeric($add_event_id)) {
        $error = $error_messages['NOT_NUMERIC'];
        return false;
    }

    $set = $db->query("select node_parent, node_system_access, node_creator,
 template_id, node_content, node_name from nodes where nodes.node_id = '$add_event_id'");
    $set->next();
    $node_parent = $set->getString('node_parent');
    $node_system_access = $set->getString('node_system_access');
    $node_creator = $set->getString('node_creator');
    $node_template = $set->getString('template_id');
    $node_content = stripslashes($set->getString('node_content'));
    $event_name = $set->getString('node_name');
    $fp = fopen (EVENT_DIR.$event_name.".inc","w+");
    fwrite($fp,$node_content);
    fclose($fp);
    chown(EVENT_DIR.$event_name.".inc","wwwedit");

    $q = "update nodes set external_link = '' where node_name = '".$event_name."' and external_link = 'event://$event_name'";
    $db->query($q);
    $q = "update nodes set external_link = 'event://$event_name' where node_id = '".$add_event_id."'";
    $db->query($q);

    //logging of every event for security reasons
    $params['node_creator'] = UBIK_ID;
    $params['node_parent'] = 2019771;
    $params['node_name'] = "addEvent execute: node $add_event_id";
    $params['node_content'] = "addEvent execute: node <a href='$add_event_id'>$add_event_id</a> by user ".$_SESSION['user_name'];
    $params['node_content'] .= "<br />event_name: ".$event_name;
    $params['node_content'] .= "<br />template_id: <a href='$node_template'>".$node_template."</a>";
    $params['node_content'] .= "<br />node_parent: <a href='$node_parent'>".$node_parent."</a>";
    $params['node_content'] .= "<br />node_system_access: ".$node_system_access;
    $params['node_content'] .= "<br />node_creator: <a href='$node_creator'>".$node_creator."</a>";
    $params['node_content'] = mysql_real_escape_string($params['node_content']);
    nodes::addNode($params);

    return true;
}
?>