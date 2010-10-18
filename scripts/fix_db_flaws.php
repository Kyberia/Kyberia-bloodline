<?

	require('config/config.inc');
	require(SYSTEM_ROOT.'inc/database.inc');

	$db=new CLASS_DATABASE();

	$query = "select * from nodes where node_name = 'maart' and external_link = 'db://user'";
	$set = $db->query($query);

	$count = $set->getNumRows();

//	echo "<b>Fixing ownership problems for $count users...</b><br><br>";

	while($set->next())
	{
		echo $set->getString('node_id')." :: ".$set->getString('node_name')."<br>";
		$victims[] =  $set->getString('node_id');
	}

//	foreach($victims as $target)
//	{
//		$query = "update nodes set node_creator = '$target' where node_id = '$target'";
//		$db->query($query);
//		echo "User_id $target ownership problem fixed.<br>";
//	}

//	echo "<br><br><b>Fix script finished!<br>U has to believe that nothing has fucked up ;o)!</b>";

?>
