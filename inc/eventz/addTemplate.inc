<?php
    function addTemplate() {

        global $db,$error,$node, $error_messages;
        $add_template_id = $_POST['add_template_id'];

        if (!is_numeric($add_template_id)) {
            $error = $error_messages['NOT_NUMERIC'];
            return false;
        }

        //logging of every template for security reasons
        $params['node_creator'] = UBIK_ID;
        $params['node_parent'] = 2029360;
        $params['node_name'] = "addTemplate execute: node $add_template_id";
        $params['node_content'] = mysql_real_escape_string("addTemplate execute: node <a href='$add_template_id'>$add_template_id</a> by user ".$_SESSION['user_name']);
        nodes::addNode($params);

        $set=$db->query("select node_content from nodes where node_id='$add_template_id'");
        $set->next();
            $node_content = stripslashes($set->getString('node_content'));
            $template_id = $node['template_id'];
            $fp = fopen (OWN_TEMPLATE_DIR.$add_template_id.".tpl", "w+");
            fwrite($fp,$node_content);
            fclose($fp);
            chown(OWN_TEMPLATE_DIR.$add_template_id.".tpl","wwwedit");
        $q="update nodes set external_link = 'template://$add_template_id' where node_id='".$add_template_id."'";
        $db->query($q);

        return true;
}

?>
