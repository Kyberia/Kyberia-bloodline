#!/usr/local/bin/php
<?php
require('../config/config.inc');
//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$q="select user_id,login from users";
$set=$db->query($q);
$i=0;
while ($set->next()) {
  $user_id=$set->getString('user_id');
  $user_name=$set->getString('login');
  $us=$db->query("select node_id from nodes where node_id='$user_id'");

  if (!$us->getNumRows()) {
    ++$i;
    $q="insert into nodes set node_id='$user_id',node_creator='$user_id',node_system_access='public',
    node_external_access='yes',template_id='7',node_name='$user_name',external_link='session://user',node_vector='$vector'";
    echo "\n $i $q <br>";
   $db->update($q);
  }
}
?>