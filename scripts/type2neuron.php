#!/usr/local/bin/php
<?php
require('../config/config.inc');
//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$type_id=3;
$dst_id=1058182;

$q="select node_creator, node_id from nodes where template_id='$type_id'";
$set=$db->query($q);

while ($set->next()) {
  $node_id=$set->getString('node_id');
  $creator=$set->getString('node_creator');
  $q="insert into neurons set dst='$dst_id',src='$node_id',link='hard',synapse_creator='$creator'";
  echo $q."\n";
  $db->query($q);

}




?>