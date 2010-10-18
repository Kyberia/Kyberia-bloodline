<?php
function smarty_function_get_k_filtred_nodes($params,&$smarty) {

global $db,$node;

$user_id = $_SESSION['user_id'];
$node_id = 2472165;
$q="select src from neurons where synapse_creator='$user_id' and dst='$node_id'";

$set=$db->query($q);
while ($set->next()) {
$k_filtred_nodes_array[0][]=$set->getRecord();
}

// get k

if (is_numeric($params['offset'])) $offset=$params['offset'];
else $offset=0;
if (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
else $listing_amount=DEFAULT_LISTING_AMOUNT;
if (!is_numeric($_POST['interval'])) $interval=1;
else $interval = $_POST['interval'];
if ($params['vector']) {
$vector=$params['vector'];
$interval=365;
}
else $vector="00";

$q="select node_content.node_content,nodes.*,parent.node_name as parent_name,users.login as creator
from nodes left join node_content on node_content.node_id=nodes.node_id left join nodes as parent on nodes.node_parent=parent.node_id
left join users on users.user_id=nodes.node_creator where nodes.node_created>now()-interval $interval day
and nodes.node_vector like '$vector%' and nodes.k>0 and nodes.node_system_access!='private' order by nodes.k desc limit $offset,$listing_amount";

$set=$db->query($q);
while ($set->next()) {
$k_filtred_nodes_array[1][]=$set->getRecord();
}

$smarty->assign('get_k_filtred_nodes',$k_filtred_nodes_array);

}
?>