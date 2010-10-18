<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select forum.*,forum_info.*,forum.forum_id as forum_id from forum left join forum_info on forum.forum_id=forum_info.forum_id";
$set=$db_old->query($q);

$categoryset=$db->query("select node_id,old_id,node_thread_vector from nodes where old_type='category'");
while ($categoryset->next()) {
	$categories[$categoryset->getString('old_id')]=array("id"=>$categoryset->getString('node_id'),"thread"=>$categoryset->getString('node_thread_vector'));
}
print_r($categories);

$creatorset=$db->query("select old_id,node_id from nodes where node_type='7'");
while ($creatorset->next()) {
	$users[$creatorset->getString('old_id')]=$creatorset->getString('node_id');
}

while ($set->next()) {
if ($set->getString('forum_type')=='kyberia') $a=",node_system_access='public',node_external_access='no'";
elseif ($set->getString('forum_type')=='public') $a=",node_system_access='public',node_external_access='yes'";
elseif ($set->getString('forum_type')=='private') $a=",node_system_access='private',node_external_access='no'";
$q="insert into nodes set ";
$q.="node_name='".AddSlashes($set->getString('forum_name'))."'";
$q.="
,node_creator='".$users[$set->getString('forum_owner')]."'
,node_parent='".$categories[$set->getString('forum_category')]['id']."'
,node_thread_vector='".$categories[$set->getString('forum_category')]['thread'].";".$categories[$set->getString('forum_category')]['id']."'
,node_type='3'
,old_id='".$set->getString('forum_id')."'";
$q.=$a;
$db->query($q);
echo $q;
$q="insert into node_content set node_content='".AddSlashes($set->getString('forum_info'))."',node_id=LAST_INSERT_ID()";
$db->query($q);


}



?>