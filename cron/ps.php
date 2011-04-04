#!/usr/bin/php
<?php

/*
 * Script that XXX
 * Called XXX
 */


//registration question specification
$requests[] = array("senate_request"=>2228983,
"function"=>"update_template",
"params"=>array("change_node_id"=>791946));

function update_template($params) {
  global $db;
  $node_id = $params['change_node_id'];
  if (!is_numeric($node_id)) return false;
  $q = "update node_content set node_content = '".$params['content']."' where node_id=$node_id";
  $db->query($q);
  $fp = fopen (OWN_TEMPLATE_DIR.$node_id.".tpl", "w+");
  fwrite($fp,$params['content']);
  fclose($fp);
  chown(OWN_TEMPLATE_DIR.$node_id.".tpl","www");
}

// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require_once($dir.'/../wwwroot/config/config.inc');

//connecting to database and creating universal $db object
require_once(INCLUDE_DIR.'/log.inc');
require_once(INCLUDE_DIR.'/database.inc');
require_once(INCLUDE_DIR.'/nodes.inc');
$db=new CLASS_DATABASE();

foreach ($requests as $request) {
  $request_id = $request['senate_request'];
  $set = $db->query("select node_content from nodes left join node_content on nodes.node_id = node_content.node_id where node_parent='$request_id' order by k desc limit 1");
  $set->next();
  $params = $request['params'];
  $params['content'] = addslashes($set->getString('node_content'));
  $request["function"]($params);
}


?>
