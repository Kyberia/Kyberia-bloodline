#!/usr/bin/php
<?php
/*
 * Script that XXX
 * Called XXX
 */


// Use relative address of config file
// Change this, if you move you cron directory.
$dir=substr(__FILE__, 0, strrpos(__FILE__, '/'));
require_once($dir.'/../wwwroot/config/config.inc');


//connecting to database and creating universal $db object
require_once(INCLUDE_DIR.'/log.inc');
require_once(INCLUDE_DIR.'/database.inc');
require_once(INCLUDE_DIR.'/nodes.inc');
require_once(INCLUDE_DIR.'/permissions.inc');
require_once(INCLUDE_DIR.'/ubik.inc');

$_SESSION['user_id']=UBIK_ID;

$db=new CLASS_DATABASE();

$set=$db->query("select * from node_access where 
		node_id='1961061' and node_permission='execute'");
$citizens=$set->getNumRows();

$set2=$db->query("select k,node_id,node_creator,login from nodes 
		left join users on nodes.node_creator=users.user_id where 
		node_name='request for citizenship'");

 echo "TOTAL $citizens citizens \n";

while ($set2->next()) {
  $request_id=$set2->getString('node_id');
  $votes=$set2->getString('k');
  $login=$set2->getString('login');
  $citizen=$set2->getString('node_creator');
  echo "citizen $citizen - $login has $votes needs ".floor(log($citizens,"1.42"))." \n";

  if (($citizens<66 && $votes>=floor($citizens/6)) ||
    ($citizens>=66 && $votes>floor(log($citizens,"1.42")))) {

      $params['node_parent']=$request_id;
      $params['node_creator']=UBIK_ID;
      $params['node_content']="request of user $login approved by $votes citizens";
      $params['node_name']="citizen $citizen approved";
      //print_r($params);
      echo $votes.$citizen."\n";
      nodes::addNode($params);
      $t1=$db->query("select * from node_access where 
		node_id='1961061' and 
		user_id='$citizen' 
		and node_permission='execute'");
      if (!$t1->getNumRows()) { 
	$db->query("insert into node_access set 
				node_id='1961061',
				user_id='$citizen',
				node_permission='execute'"); 
	}
      $t1=$db->query("select * from node_access where 
		node_id='1061495' and 
		user_id='$citizen' and 
		node_permission='execute'");
      if (!$t1->getNumRows()) {
      $db->query("insert into node_access set 
					node_id='1061495',
					user_id='$citizen',
					node_permission='execute'");
	}
      $t1=$db->query("select * from node_access where 
		node_id='1961070' and 
		user_id='$citizen' and 
		node_permission='execute'");
      if (!$t1->getNumRows()) {
      $db->query("insert into node_access set 
		node_id='1961070',
		user_id='$citizen',
		node_permission='execute'");
	}
      $db->query("update nodes set node_name='approved citizenship request' 
		where node_id='$request_id'");
      $params['mail_to']=$citizen;
      $params['mail_text']="you have become a citizen";

      ubik::ubikMail($params);
  }
}

?>
