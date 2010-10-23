<?php
error_reporting(1);
require('../config/config.inc');
require(INCLUDE_DIR.'database.inc');
$db=new CLASS_DATABASE();
$user_id = $_GET['user_id'];
$node_id = $_GET['node_id'];

// listing amount
$set=$db->query("select users.listing_amount, users.listing_order from users where users.user_id='$user_id' limit 1");
$set->next();
$listing_amount=$set->getString('listing_amount');
if (!is_numeric($listing_amount)) {
	$listing_amount=23;
}
$offset=0;

$q="select creator.node_name as creator,users.user_id,nodes.node_name,nodes.node_id as node_id from nodes
left join node_access on (nodes.node_id=node_access.node_id and node_access.user_id='$user_id') left join users on users.user_id=nodes.node_creator left join nodes as creator on nodes.node_creator=creator.node_id where nodes.node_parent='$node_id'";

$q.=" order by nodes.template_id,nodes.node_name LIMIT 0,3";
$set=$db->query($q);

while ($set->next()) {
	$get_children_array[]=$set->getRecord();
}
printf('<script language="JavaScript" type="text/javascript">function deti(){ var childrens = new Array();');
foreach ($get_children_array as $index => $content) {
	printf('childrens[%d] = new Array("%s", %d, "%s", %d);'."\n", $index, $content['creator'], $content['user_id'], $content['node_name'], $content['node_id']);
}
printf('for (x = 0; x < childrens.length; x++) {document.write(childrens[x] + "<br>");} }</script>');
?>
