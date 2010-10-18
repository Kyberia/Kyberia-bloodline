<?
function smarty_function_get_nodes_by_external_link($params,&$smarty) {

if ($params['orderby']=='desc') $orderby="desc"; else $orderby="asc";
// echo 'xxxxxxxxxxxxxxxx';
$external_link=$params['external_link'];
if ($params['listing_amount']=='all')
$listing_amount='232323';
else $listing_amount=$params['listing_amount'];

if (empty($params['offset'])) $offset=0;
else $offset=$params['offset'];

global $db,$node;

$q="select users.*,nodes.* from nodes left join users on users.user_id=nodes.node_creator where external_link = '$external_link' order by node_id $orderby LIMIT $offset,$listing_amount";

$set=$db->query($q);
while ($set->next()) $pole[]=$set->getRecord();
$smarty->assign('get_nodes_by_external_link',$pole);
}
?>