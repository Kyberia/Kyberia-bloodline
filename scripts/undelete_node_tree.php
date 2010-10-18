<?
//	ini_set("error_reporting", "E_ALL & ~E_NOTICE");

	require('config/config.inc');
	require(SYSTEM_ROOT.'inc/database.inc');

	$db=new CLASS_DATABASE();

	$vector_size = VECTOR_CHARS;

	$target = '1478222';

	$query = "select node_thread_vector from tiamat where node_id = '$target'";
	$set = $db->query($query);
	$set->next();
	$parent_vector = $set->getString('node_thread_vector');

	$query = "select * from nodes where node_parent = '$target'";
	$set = $db->query($query);

	while($set->next())
	{
		$level_one[$set->getString('node_id')] = $set->getString('node_name');
	}

	print_r($level_one);

	echo $parent_vector;

	$test = str_split($parent_vector, $vector_size);

	print_r($test);

        echo "parent node_id :: $target <br /><br />";

	$query = "insert into nodes
			(node_id, node_name, node_parent, node_vector, node_type, node_external_access,
			node_system_access, node_children_count, node_creator, node_created,
			lastchild_created, k, node_views, node_descendant_count, lastdescendant_created, template_id)
		select
			tiamat.node_id, tiamat.node_name, tiamat.node_parent, tiamat.node_thread_vector, tiamat.node_type,
			tiamat.node_external_access, tiamat.node_system_access, tiamat.node_children_count, tiamat.node_creator,
			tiamat.node_created, tiamat.lastchild_created, tiamat.k, tiamat.node_views, tiamat.node_descendant_count,
			tiamat.lastdescendant_created, tiamat.template_id from tiamat where tiamat.node_id = '$target' limit 1";

//	$db->query($query);
//	echo $query."<br><br>";

//	echo "recovered!<br /><br />";

	echo "starting update process at vector $parent_vector ...<br /><br />";

	foreach($level_one as $target_id => $target_name)
	{
		$q = "select * from nodes where node_vector like '%$target_id%'";
		echo $q."<br>";
/*		$raise = $db->query($q);
		while($raise->next())
		{
			$q = "update nodes set node_vector = '".$parent_vector.$raise->getString('node_vector')."' where node_id = '".$raise->getString('node_id')."'";
		//	$db->query($q);
			echo $q."<br>";
		}*/
	}

	echo "update finished!";

?>
