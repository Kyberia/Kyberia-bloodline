<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$forumset=$db_old->query("select forum_id from forum where forum_public='private'");
while ($forumset->next()) {
	$old_id=$forumset->getString('forum_id');
	$db->query("update nodes set node_system_access='private' where old_id='$old_id' and node_type='3'");
}
$forumset2=$db_old->query("select forum_id from forum where forum_public='moderated'");
while ($forumset2->next()) {
	$old_id=$forumset2->getString('forum_id');
	$db->query("update nodes set node_system_access='moderated' where old_id='$old_id' and node_type='3'");
}

?>