<?php

function db_get_template ($tpl_name, &$tpl_source, &$smarty_obj) {

        global $db,$error,$node, $error_messages;
				$add_template_id = preg_replace('/\.tpl$/', '', $tpl_name);

        if (!is_numeric($add_template_id)) {
            $error = $error_messages['NOT_NUMERIC'];
            return false;
        }

				/*
        //logging of every template for security reasons FIXME!!! TODO!!!
        $params['node_creator'] = UBIK_ID;
        $params['node_parent'] = 2029360;
        $params['node_name'] = "addTemplate execute: node $add_template_id";
        $params['node_content'] = db_escape_string("addTemplate execute: node <a href='$add_template_id'>$add_template_id</a> by user ".$_SESSION['user_name']);
        nodes::addNode($params);
				*/
				/*
        if(!($set=$db->query("select node_content from nodes where node_id='$add_template_id'"))) return false;
        $set->next();
				*/
    // populating $tpl_source with actual template contents
	//$tpl_source = stripslashes($set->getString('node_content'));
	$tpl_source = nodes::getNodeById($add_template_id,$_SESSION['user_id']);
	$tpl_source = $tpl_source['node_content'];
    // return true on success, false to generate failure notification
    return true;
}


function db_get_timestamp($tpl_name, &$tpl_timestamp, &$smarty_obj)
{
    // do database call here to populate $tpl_timestamp
    // with unix epoch time value of last template modification.
    // This is used to determine if recompile is necessary.
	$recompile = 100; //recompile every N seconds
	$tpl_timestamp = floor(time()/$recompile)*$recompile; 
	// this example will recompile even unchanged templates! XXX!!! FIXME!!! TODO!!!
    // return true on success, false to generate failure notification
    return true;
}

function db_get_secure($tpl_name, &$smarty_obj)
{
    // assume all templates are secure
    return true; //FIXME!!! TODO!!!
}

function db_get_trusted($tpl_name, &$smarty_obj)
{
    // not used for templates
}

// register the resource name "kyberia"
$smarty->register_resource('kyberia', array('db_get_template',
                                       'db_get_timestamp',
                                       'db_get_secure',
                                       'db_get_trusted'));

