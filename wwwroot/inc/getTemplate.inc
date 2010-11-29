<?php
function getTemplate($add_template_id) {

        global $db,$error,$node, $error_messages;

        if (!is_numeric($add_template_id)) {
            $error = $error_messages['NOT_NUMERIC'];
            return false;
        }

				/*
        //logging of every template for security reasons
        $params['node_creator'] = UBIK_ID;
        $params['node_parent'] = 2029360;
        $params['node_name'] = "addTemplate execute: node $add_template_id";
        $params['node_content'] = mysql_real_escape_string("addTemplate execute: node <a href='$add_template_id'>$add_template_id</a> by user ".$_SESSION['user_name']);
        nodes::addNode($params);
				*/

        if(!($set=$db->query("select node_content from nodes where node_id='$add_template_id'"))) return false;
        $set->next();
        return stripslashes($set->getString('node_content'));
}
