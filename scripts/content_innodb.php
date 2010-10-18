<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$qNCOld = "select * from node_content";
$i=0;
$set = $db->query($qNCOld);
while ($set->next()) {
  $i++;
  if ($i%100==0) echo "$i nodes loaded\n";
  $qNCNew = "update nodes set node_content='".addslashes($set->getString('node_content'))."' where node_id='".$set->getString('node_id')."'";
  $db->query($qNCNew);
}
?>