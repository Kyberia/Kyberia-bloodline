<?php
function smarty_function_get_search($params,&$smarty) {

global $db, $node;
if (is_numeric($params['offset'])) $offset = $params['offset'];
else $offset = 0;

if (is_numeric($params['listing_amount'])) $listing_amount = $params['listing_amount'];
else $listing_amount = 32;
$query = addslashes($params['query']);
$q = "select users.login, nodes.* from nodes left join users on
 users.user_id = nodes.node_creator where node_name like '$query%'";
$set = $db->query($q);
while ($set->next()) {
    $array[] = $set->getRecord();
}
$smarty->assign('get_search_short',$array);

if ($_POST['orderby'] != ("k" || "node_created" || "probability" ||
"node_views")) $orderby = "k";
else $orderby=$_POST['orderby'];

$q = "select users.login as login, users.*, nodes.*, nodes.node_creator,
 nodes.node_content, match (node_content.node_content) against ('$query') as
 probability from node_content left join users on node_content.node_id = users.user_id
 left join nodes on node_content.node_id = nodes.node_id where
 node_system_access!='private' and match (node_content.node_content)
 against ('$query') order by $orderby desc limit $offset,$listing_amount";

$set = $db->query($q);
while ($set->next()) {
    $search[] = $set->getRecord();
}

$smarty->assign('get_search',$search);
}
?>
