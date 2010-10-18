<?php
// bugfix. Opravuje zobrazovanie ankiet v nadparentoch kde nemaju byt.
function smarty_function_get_poll($params,&$smarty) {
global $db,$node;
$user_id=$_SESSION['user_id'];
$node_vector=$node['node_vector'];
if (!is_numeric($params['poll_id'])) $poll_id=$node['node_id'];
else $poll_id=$params['poll_id'];

if (is_array($params['poll'])) {
$array=$params['poll'];
$voted='yes';
}

else {
$set=$db->query("select nodes.*,node_access.node_permission from nodes left join node_access on (nodes.node_id=node_access.node_id and node_access.user_id='$user_id') where node_parent='$poll_id' and template_id='1549834' order by node_id desc limit 1");

$set->next();
$array=$set->getRecord();
if ($array['node_permission']=='ban') $voted='yes';
else $voted='no';
}

$option_array=unserialize($array['node_content']);
$permission=$array['node_permission'];

$poll=Array("voted"=>$voted,"node_id"=>$array['node_id'],"question"=>$array['node_name'],"total"=>$array['node_views'],"options"=>$option_array);
$smarty->assign('get_poll',$poll);

}
?>
