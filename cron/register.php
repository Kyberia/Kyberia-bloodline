#!/usr/bin/php

<?php
/*
 * Script that register new users who gaind enough K (votes)
 * Called once a day at 0:42
 * 
 * TODO: ? call only function from eventz ? 
 */


// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require($dir.'/../wwwroot/config/config.inc');

require(INCLUDE_DIR.'/log.inc');
require(INCLUDE_DIR.'/database.inc');
require(INCLUDE_DIR.'/nodes.inc');
require(INCLUDE_DIR.'/permissions.inc');
require(INCLUDE_DIR.'/ubik.inc');
require(INCLUDE_DIR.'/senate.inc');

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
      $db->update("update nodes set 
			template_id=7,
			external_link='db://users',
			node_name='$login' 
			where node_id=".$set->getString('node_id'));
      $mail=$set->getString('email');
      mail($mail,"kyberia gate is opened","Vitaj v kyberii");

      //VHODNE POSLAT ZACIATOCNIKOVI POSTU
      ubik::ubikMail($params);
}

?>
