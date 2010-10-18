<?php

require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();
$db_old=new CLASS_DATABASE("kyberia","kyberia","cyb3ry","127.0.0.1");

$q="select * from nodes where old_id_diskuse>0 and node_type='6'";

$bigset=$db->query($q);

while ($bigset->next()) {

unset($set_array);
unset($set_array_item);
unset($prispevky);
unset($prispevky_array);
unset($prispevky_new_array);
unset($prispevky_old_array);
unset($oldidz);

$q="select * from nodes where node_type='7'";
$userset=$db->query($q);
while ($userset->next()) {
	$users[$userset->getString('node_name')]=$userset->getString('node_id');
}


$q="select * from prispevky where id_diskuse='".$bigset->getString('old_id_diskuse')."' order by id_prispevku";
$set=$db_old->query($q);



while ($set->next()) {
	$set_array[]=$set->getRecord();
	$prispevky[$set->getString('thread')]=$set->getString('id_prispevku');
}

foreach ($prispevky as $thread_vector => $prispevok_id) {
	if (strlen($thread_vector)>4) {
	$prispevky_old_array[$prispevok_id]=$prispevky[substr($thread_vector,0,strlen($thread_vector)-5)];
	}
}

foreach ($set_array as $set_array_item) {

$q="insert into nodes set
node_name='".addslashes($set_array_item['vlozeno'])."::".addslashes($set_array_item['jmeno'])."',node_type='4'
,old_id='".$set_array_item['id_prispevku']."'
,node_created='".$set_array_item['vlozeno']."'
,old_id_diskuse='".$set_array_item['id_diskuse']."'
,old_type='blog'
,node_creator='".($users[$set_array_item['jmeno']])."'";


	$db->query($q);
	$lid=$db->getLastInsertId();

	$k="insert into node_content set node_content='".addslashes($set_array_item['telo'])."',node_id='$lid'";
	$db->query($k);
	$oldidz[$set_array_item['id_prispevku']]=true;
	echo $k;
}



print_r($prispevky_old_array);

foreach ($oldidz as $key=>$value) {
	echo "wantin key $key";
	if ($prispevky_old_array[$key]) {
		$q23="select node_id from nodes where old_id=".$prispevky_old_array[$key]." and node_type='4'";
		$lal=$db->query($q23);
		$lal->next();
		print_r($lal);
		$g="update nodes set node_parent='".$lal->getString('node_id')."' where old_id=$key and node_type='4'";
	}
	else $g="update nodes set node_parent='".$bigset->getString('node_id')."' where old_id=$key and node_type='4'";
	$db->query($g);
	echo "<br>".$g;
}

}

?>