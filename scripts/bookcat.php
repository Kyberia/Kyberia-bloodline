#!/usr/local/bin/php
<?php
require('../config/config.inc');
//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select * from node_access where node_bookmark='yes'");
while ($set->next()) {
      $creator=$set->getString('user_id');
      $node=$set->getString('node_id');
      $category=$set->getString('bookmark_category');
      if (!$category) $category=$creator;
      $help=$db->query("select * from neurons where central='$category' and peripheral='$node'");
      if (!$help->getNumRows()) {
        $q="insert into neurons set central='$category',peripheral='$node',synapse_creator='$creator',link='bookmark',synapse_created=NOW()";
        echo $q."\n";
        $db->query($q);
      }
      unset($help);
}



?>