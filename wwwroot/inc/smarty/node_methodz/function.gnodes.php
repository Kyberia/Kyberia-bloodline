function smarty_function_get_nodes_by_external_link($params,&$smarty) {

if ($params['orderby']=='desc') $orderby="desc"; else $orderby="asc";
echo 'xxxxxxxxxxxxxxxx';
$external_link=$params['external_link'];
if ($params['listing_amount']=='all')
$listing_amount='23232323232323323';
else $listing_amount=$params['listing_amount'];

if (empty($params['offset'])) $offset=0;
else $offset=$params['offset'];

global $db,$node;

$q="select users.*,nodes.*,node_content.* from nodes left join
node_content on (node_content.node_id=nodes.node_id) left
join users on users.user_id=nodes.node_creator where external_link like '$external_link%' order by node_created $orderby LIMIT $offset,$listing_amount";

$set=$db->query($q);
while ($set->next()) $pole[]=$set->getRecord();
$smarty->assign('get_nodes_by_external_link',$pole);
}
?>