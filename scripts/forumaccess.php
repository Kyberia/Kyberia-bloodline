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
	$users[$userset->getString('old_id')]=$userset->getString('node_id');
}

$q="select * from nodes where node_type='3'";
$forumset=$db->query($q);
while ($forumset->next()) {
	$forums[$forumset->getString('old_id')]=$forumset->getString('node_id');
}

$q="select * from nodes where node_type='10'";
$bookcatset=$db->query($q);
while ($bookcatset->next()) {
	$bookcats[$bookcatset->getString('node_creator')][$bookcatset->getString('old_id')]=$bookcatset->getString('node_id');
}



foreach ($forums as $forum_old => $forum_new) {
	$q="select user_forum.*,node_access.*,user_forum.user_id as user_id from user_forum left join node_access on (node_access.node_id=user_forum.forum_id and node_access.user_id=user_forum.user_id) where forum_id='$forum_old'";
	echo $q;
	$set=$db_old->query($q);

	while ($set->next()) {
		$user_id=$users[$set->getString('user_id')];
		$q="insert into node_access set
node_id='$forum_new',user_id='$user_id',node_bookmark='".$set->getString('user_bookmark')."'
,node_permission='".$set->getString('access_type')."',
bookmark_category='".($bookcats[$user_id][$set->getString('parent_id')])."',
node_user_subchild_count='".$set->getString('submission_count')."',
last_visit='".$set->getString('last_visit')."'";

		if ($forum_new>0 AND $user_id>0) $db->query($q);

	}
	echo "forum $forum_new flushed<br>";

}


?>
