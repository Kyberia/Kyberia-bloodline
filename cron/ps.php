#!/usr/local/bin/php
<?php
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

require('../config/config.inc');
//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
require(SYSTEM_ROOT.'/inc/senate.inc');
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