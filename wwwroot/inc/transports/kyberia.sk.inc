<?php
$transport_name='kyberia.sk';

global $transports;

$transports[$transport_name]['get_node_url']=function($id, $protocol='http', $domain='kyberia.sk') {
	return "$protocol://$domain/id/$id";
};

$transports[$transport_name]['get_node_content']=function($id, $protocol='http', $domain='kyberia.sk', $content_template='2019721') {
	return file_get_contents("$protocol://$domain/id/$id/$content_template");
};

//echo $transports[$transport_name]['get_node_content'](2019721); //Example

unset($transport_name);
