<?php
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","root","db.h-k.sk","127.0.0.1");

$q="select * from nodes where node_type='3'";
$forumset=$db->query($q);
while ($forumset->next()) {
	$forums[$forumset->getString('old_id')]=array("thread"=>$forumset->getString('node_thread_vector'),"id"=>$forumset->getString('node_id'),"owner"=>$forumset->getString('node_creator'));
}

$q="select * from polls where forum_id>0 order by id_poll";
$set=$db_old->query($q);

while ($set->next()) {
if (is_array($forums[$set->getString('forum_id')])){
$q="insert into nodes set
node_name='".addslashes($set->getString('question'))."',old_id='".$set->getString('id_poll')."',node_parent='".
$forums[$set->getString('forum_id')]['id']."'
,node_creator='".$forums[$set->getString('forum_id')]['owner']."'
,node_thread_vector='".$forums[$set->getString('forum_id')]['thread'].";".$forums[$set->getString('forum_id')]['id']."'
, node_views='".$set->getString('responses')."',node_type='11'";
$db->query($q);

$q="select * from poll_options where id_poll=".$set->getString('id_poll');
$pollset=$db_old->query($q);
unset($pollset_array);
while ($pollset->next()) {
	$pollset_array[]=array("text"=>$pollset->getString('text'),"number"=>$pollset->getString('number'));
}
$options=AddSlashes(serialize($pollset_array));
$db->query("insert into node_content set node_id=LAST_INSERT_ID(),node_content='$options'");
echo "<br><br>";
}
}
?>
