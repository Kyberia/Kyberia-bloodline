<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");


$q="select * from nodes where node_type='poll'";
$set=$db->query($q);

while ($set->next()) {
unset($options);
$node_id=$set->getString('node_id');
$old_poll_id=$set->getString('old_id');
$q="select * from poll_options where id_poll=$old_poll_id";
$pollset=$db_old->query($q);
while ($pollset->next()) {
	$pollset_array[]=array("text"=>$pollset->getString('text'),"number"=>$pollset->getString('number'));
}
$options=serialize($pollset_array);
$db->query("insert into node_content set node_id='$node_id',node_content='$options'");
}
