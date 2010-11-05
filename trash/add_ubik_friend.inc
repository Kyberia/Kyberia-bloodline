<?php
function add_ubik_friend() {
$params['node_creator']=UBIK_ID;
$params['node_parent']=1419407;
$params['node_name']="ahoj";
$params['template_id']=8;
$params['external_link']="session://friend";
$params['node_content']=$_POST["f_text"];

$params['node_content']=addslashes($params['node_content']);
nodes::addNode($params);
}
?>