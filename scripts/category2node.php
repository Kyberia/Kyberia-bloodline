<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select * from category";
$set=$db_old->query($q);
$db->query("set autocommit=0");
while ($set->next()) {

$q="insert into nodes set ";
$q.="node_name='".addslashes(strip_tags($set->getString('category_name')))."'";
if ($set->getString('category_parent')>0) {
	$q2="select node_id from nodes where old_type='category' and old_id='".$set->getString('category_parent')."'";
	$res2=$db->query($q2);
	$res2->next();
	$q.=",node_parent='".$res2->getString('node_id')."'";
	$q.=",node_thread_vector=';1;101;".$res2->getString('node_id')."'";
}
else {
	$q.=",node_parent='101' ,node_thread_vector=';1;101'";
}
$q.="
,node_creator='129'
,node_type='2'
,old_type='category'
,node_system_access='".$set->getString('public')."'
,old_id='".$set->getString('category_id')."'";
$db->query($q);
echo $q;
//$q="insert into node_content set node_content='".AddSlashes($set->getString('description'))."',node_id=LAST_INSERT_ID()";


}

$db->query("commit");

?>