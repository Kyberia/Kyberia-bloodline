<?

	require('config/config.inc');
	require(SYSTEM_ROOT.'inc/database.inc');

	$db=new CLASS_DATABASE();

	$query = "select node_id, node_name, node_vector from nodes where node_parent = '63530' or node_vector like '%63530%'";
	$set = $db->query($query);

	$count = $set->getNumRows();

	while($set->next())
	{
		echo $set->getString('node_id')." :: ".$set->getString('node_name')." :: ".$set->getString('node_vector')." :: ";
		$count = strlen($set->getString('node_vector'));
		$node_vector = $set->getString('node_vector');
		for($i = 1; $i <= $count; $i++)
		{
			$node_vector = "0".$node_vector;
		}
		if(strstr($set->getString('node_vector'), "00000101"))
		{
			echo $set->getString('node_vector');
		}
		else
		{
			echo $node_vector;
		}
		echo "<br>";
	}

	//echo "<b>Fixing ownership problems for $count users...</b><br><br>";

	//while($set->next())
	//{
	//	$victims[] =  $set->getString('node_id');
	//}

	//foreach($victims as $target)
	//{
	//	$query = "update nodes set node_creator = '$target' where node_id = '$target'";
	//	$db->query($query);
	//	echo "User_id $target ownership problem fixed.<br>";
	//}

	//echo "<br><br><b>Fix script finished!<br>U need to believe that nothing has fucked up ;o)!</b>";

?>
