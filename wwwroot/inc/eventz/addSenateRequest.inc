<?php
function addSenateRequest() {
//first creates the request node, then request sub-nodes

global $db,$node;

                $params['node_name']=$_POST['node_name'];
if (is_array($optionz)) $params['node_system_access']='moderated';
else $params['node_system_access']='public';
                $params['node_creator']=$_SESSION['user_id'];
                $params['node_content']=nodes::processContent($_POST['request_content']);
                $id=nodes::addNode($params);


$options=explode(";",$_POST['options']);
$i=0;
foreach ($options as $option) {
    ++$i;
    $params['node_name']=$_POST['node_name']." $i. alternative";
    $params['node_system_access']='public';
    $params['node_creator']=UBIK_ID;
    $params['node_parent']=$id;
    $params['node_content']=nodes::processContent($option);
    nodes::addNode($params);
}

}

?>

