<?
require('config/config.inc');
require('node_types.php');
require(SYSTEM_ROOT.'inc/log.inc');
require(SYSTEM_ROOT.'inc/nodes.inc');
require(SYSTEM_ROOT.'inc/database.inc');

$db=new CLASS_DATABASE();

$q = "select distinct parent.node_id as parent_node_id from nodes left join nodes as parent on parent.node_id = nodes.node_parent where nodes.node_system_access = 'public' and parent.node_system_access = 'private' order by parent_node_id";

$set = $db->query($q);
echo "Updating security access for ".$set->getNumRows()." nodes ...<br>";
while($set->next())
{
	$parents[] = $set->getString('parent_node_id');
}

foreach($parents as $parent)
{
	echo "Updating node $parent ... ";
	$query = "update nodes set node_system_access = 'private' where node_system_access = 'public' and node_parent = '$parent'";
	$set = $db->query($query);
//	echo $query;
	echo "done<br>";
}

//print_r($parents);

?>
