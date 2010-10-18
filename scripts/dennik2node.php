<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select * from nodes where node_type='7'";
$userset=$db->query($q);
while ($userset->next()) {
	$user_array[$userset->getString('old_id')]=$userset->getString('node_id');
}

print_r($user_array);

$q="select * from dennik";
$set=$db_old->query($q);

while ($set->next()) {
	$node_creator=$user_array[$set->getString('autor')];
	$q="insert into nodes set node_creator='$node_creator',";
if ($set->getString('type')=='public') {
	$ea='yes';
	$sa='public';
}
elseif ($set->getString('type')=='private') {
	$ea='no';
	$sa='private';
}
else {
	$ea='no';
	$sa='public';
}

	$q.="
node_name='".addslashes(strip_tags($set->getString('nadpis')))."'
,node_parent='$node_creator'
,node_type='6'
,node_thread_vector=';1;7;$node_creator'
,node_created='".$set->getString('datum')."'
,node_views='".$set->getString('hits')."'
,node_system_access='".$sa."'
,node_external_access='".$ea."'
,old_id_diskuse='".$set->getString('id_diskuse')."'
,old_id='".$set->getString('id')."'";
	if ($node_creator) $db->query($q);

	$q="insert into node_content set node_content='".AddSlashes($set->getString('zapis'))."',node_id=LAST_INSERT_ID()";

	echo "inserted $node_creator<br>";
	if ($node_creator) $db->query($q);

}

?>