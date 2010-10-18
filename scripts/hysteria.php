<?php
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

  $fd=fopen("hysteria.logins",'r');
  while(!feof($fd)) {
   $data=fread($fd, 4096);
}
$array=explode("\n",$data);

foreach ($array as $login) {
	$result=$db->query("select user_id from users where login='$login'");
	if (!$result->getNumRows()) {
		$db->query("insert into nodes set node_name='$login',node_type='7',node_parent='102',node_thread_vector=';1;102'");
		$id=$db->getLastInsertId();
		$db->query("insert into node_content set node_id='$id',node_content='hysteria user $login'");
		$db->query("insert into users set login='$login',user_id='$id'");
	}
	else {
		echo "duplicitny $login \n<br>";
	}
}

?>