<?php

function transport_load($transport) {
	require_once(TRANSPORT_DIR.$transport.'.inc');
}

function transport_translate($transport_handle) {
	$transport = preg_split('/[:@]/',trim($transport_handle));
	transport_load($transport[0]);
	global $transports;
	
	$id=$transport[1];
	$domain='defaulthost'; if(isset($transport[2])) $domain=$transport[2];
	$transport=$transport[0];

	$node['node_name']="$transport:$id@$domain";
	$node['url']=$transports[$transport]['get_node_url']($id);
	$node['node_content']=$node['url'].'<br />'.$transports[$transport]['get_node_content']($id);

	return $node;
}
