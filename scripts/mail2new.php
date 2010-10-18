<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$userset=$db->query("select old_id,node_id from nodes where node_type='7'");

while ($userset->next()) {
	$old_id=$userset->getString('old_id');
	$user_id=$userset->getString('node_id');
	$db->query("update mail set mail_user_new='yes',mail_user='$user_id' where mail_user='$old_id' and mail_user_new='no'");
	$db->query("update mail set mail_from_new='yes',mail_from='$user_id' where mail_from='$old_id' and mail_from_new='no'");
	$db->query("update mail set mail_to_new='yes',mail_to='$user_id' where mail_to='$old_id' and mail_to_new='no'");
}

$db->query("create index uf on mail (mail_user,mail_from)");
$db->query("create index ut on mail (mail_user,mail_to)");


$userset=$db->query("select old_id,node_id from nodes where node_type='7'");
while ($userset->next()) {
	$old_id=$userset->getString('old_id');
	$user_id=$userset->getString('node_id');
	$db->query("insert into mail_folders set user_id='$user_id',folder_name='sent'");
	$sent_id=$db->getLastInsertId();
	$db->query("insert into mail_folders set user_id='$user_id',folder_name='received'");
	$received_id=$db->getLastInsertId();
	$db->query("insert into mail_folders set user_id='$user_id',folder_name='trash'");
	$db->query("update users set folder_id='$sent_id' where mail_user='$user_id' and mail_from='$user_id'");
	$db->query("update users set folder_id='$received_id' where mail_user='$user_id' and mail_to'$user_id'");
}

?>