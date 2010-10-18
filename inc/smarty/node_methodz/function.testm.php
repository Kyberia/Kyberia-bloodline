<?php

function smarty_function_testm($params,&$smarty) {

if ($params['orderby']=='desc') $orderby="desc";

//$external_link=$params['external_link'];
$external_link='event://';
if ($params['listing_amount']=='all')
$listing_amount='23232323232323323';
else $listing_amount=$params['listing_amount'];

if (empty($params['offset'])) $offset=0;
else $offset=$params['offset'];

global $db,$node;
//if (!$params['parent_id']) {
$parent_id=$node['node_id'];
//}
//else $parent_id=$params['parent_id'];

$user_id=$_SESSION['user_id'];

$q="select users.*,nodes.*,node_content.* from nodes  left join
node_content on (node_content.node_id=nodes.node_id) left
join users on users.user_id=nodes.node_creator where external_link like '$external_link%' LIMIT 0,322323232323232323";

$set=$db->query($q);
while ($set->next()) $pole[]=$set->getRecord();
$smarty->assign('testm',$pole);
}
?>