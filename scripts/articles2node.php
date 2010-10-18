<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select * from articles";
$set=$db_old->query($q);
$db->query("set autocommit=0");
while ($set->next()) {

$q="insert into nodes set ";

if (!is_numeric($set->getString('autor'))) $node_name=$set->getString('autor')."::".$set->getString('nazov');
else $node_name=$set->getString('nazov');
$node_name=addslashes(strip_tags($node_name));

$q.="node_name='$node_name'";

	$q2="select * from nodes where node_type='2' and old_id='".$set->getString('id_rubrika')."'";
	$res2=$db->query($q2);
	$res2->next();
	$q.=",node_parent='".$res2->getString('node_id')."'";
	$q.=",node_thread_vector='".$res2->getString('node_thread_vector').";".$res2->getString('node_id')."'";


if (is_numeric($set->getString('autor'))) {
	$autor=nodes::getNodeByOldId($set->getString('autor'));
	$q.=",node_creator='".$autor['node_id']."'";
}
else $q.=",node_creator='548'";

$q.="
,node_type='5'
,node_created='".$set->getString('datum')."'
,node_views='".$set->getString('hits')."'
,node_system_access='public'
,node_external_access='yes'
,node_children_count='".$set->getString('prispevky')."'
,old_id_diskuse='".$set->getString('id_diskuse')."'
,old_id='".$set->getString('id_article')."'";
$db->query($q);
echo $q;
$q="insert into node_content set node_content='".AddSlashes($set->getString('short_desc')).":::".AddSlashes($set->getString('text1'))."',node_id=LAST_INSERT_ID()";
$db->query($q);
$db->query("commit");
}

?>