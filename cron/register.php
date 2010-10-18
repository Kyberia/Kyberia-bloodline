#!/usr/local/bin/php
<?php
require('../config/config.inc');
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
require(SYSTEM_ROOT.'/inc/permissions.inc');
require(SYSTEM_ROOT.'/inc/ubik.inc');
require(SYSTEM_ROOT.'/inc/senate.inc');

//REGISTRATION_VOTES CONSTANT DEFINED IN INC/SENATE.INC
define('REGISTER_TEXT','request for access');
define('REGISTRATION_REQUEST_NODE',2091448);

$_SESSION['user_id']=UBIK_ID;

$db=new CLASS_DATABASE();

$q="select users.login as persona,users.email as email,
k,node_id,node_creator,login from nodes
left join users on nodes.node_creator=users.user_id
where node_name like '".REGISTER_TEXT."%'
and node_parent=".REGISTRATION_REQUEST_NODE."
and k >=".REGISTRATION_VOTES;

$set=$db->query($q);

while ($set->next()) {
      $q="update users set header_id=0 where user_id=".$set->getString('node_id');
      $db->update($q);
      $login=$set->getString('login');
      echo $login." registered\n";
      $db->update("update nodes set template_id=7,external_link='db://users',node_name='$login' where node_id=".$set->getString('node_id'));
      $mail=$set->getString('email');
      mail($mail,"kyberia gate is opened","Vitaj v kyberii");

      //VHODNE POSLAT ZACIATOCNIKOVI POSTU
//      ubik::ubikMail($params);

}

?>