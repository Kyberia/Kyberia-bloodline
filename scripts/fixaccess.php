<?
require('../config/config.inc');
require('../node_types.php');
require(SYSTEM_ROOT.'inc/log.inc');
require(SYSTEM_ROOT.'inc/nodes.inc');
require(SYSTEM_ROOT.'inc/database.inc');

$db=new CLASS_DATABASE();

$q = "select node_id,user_id,count(*) as pocet from node_access_backup where node_bookmark='yes' group by node_id,user_id order by pocet desc";
echo $q;
$set = $db->query($q);

while($set->next()) {
	if ($set->getString('pocet')<2) die();
	$node_id=$set->getString('node_id');
	$user_id=$set->getString('user_id');
//	echo "insert into node_access set node_id=$node_id and user_id=$user_id and node_bookmark='yes'\n";
	$db->query("insert into node_access set node_id=$node_id, user_id=$user_id,node_bookmark='yes'");



}

?>
