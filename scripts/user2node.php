<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select distinct login,user.* from user";
$set=$db_old->query($q);
$db->query("set autocommit=0");
while ($set->next()) {

$q="insert into nodes set node_name='".addslashes($set->getString('login'))."'
,node_parent='7',node_system_access='public',node_external_access='no',node_thread_vector=';1;7;',node_type='7',old_id='".$set->getString('id')."'";
$db->query($q);
$q="insert into node_content set
node_content='".addSlashes($set->getString('user_info'))."',node_id=LAST_INSERT_ID()";
$db->query($q);
$q="insert into users set user_id=LAST_INSERT_ID(),
login='".addslashes($set->getString('login'))."',
password='".$set->getString('password')."',
email='".$set->getString('email')."',
user_status='".$set->getString('user_active')."',
user_ad='".$set->getString('user_ad')."',
www='".$set->getString('www')."',
icq='".$set->getString('icq')."',
charisma='".$set->getString('charisma')."',
last_action='".$set->getString('last_click')."'";
$db->query($q);
$db->query("commit");
}

?>