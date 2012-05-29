<?php

function db_get_template ($tpl_name, &$tpl_source, &$smarty_obj) {

        global $db,$error,$node, $error_messages;
        $template_id = preg_replace('/\.tpl$/', '', $tpl_name);

        //from now on module names need not to be numeric!
        if (!is_numeric($template_id)) {
            $template_id=nodes::getNodeIdByName($tpl_name);
            if (!is_numeric($template_id)) { 
             $error = $error_messages['NOT_NUMERIC'];
             return false;
            }
        }

      if (is_numeric($template_id)) {
	$tpl_source = nodes::getNodeById($template_id,empty($_SESSION['user_id']) ? "" : $_SESSION['user_id']);
      }
	$tpl_source = "\n<!-- BEGIN TEMPLATE $template_id  -->\n".
		$tpl_source['node_content'].
		"\n<!-- END TEMPLATE $template_id  -->\n";      

    // return true on success, false to generate failure notification
     return (bool)$tpl_source;
}


function db_get_timestamp($tpl_name, &$tpl_timestamp, &$smarty_obj)
{
    // do database call here to populate $tpl_timestamp
    // with unix epoch time value of last template modification.
    // This is used to determine if recompile is necessary.
	$recompile = 10; //recompile every N seconds
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

