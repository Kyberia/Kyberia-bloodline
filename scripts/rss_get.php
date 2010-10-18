<?php
//requiring main config file with path/database etc. constants
require('../config/config.inc');

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/DomXml.inc');

$db=new CLASS_DATABASE();

$data = file_get_contents("http://www.djeaux.com/rss/insecure-full-bugtraq.rss");
#echo $data;
$xml_root = new DomXml($data);
$xml_image = $xml_root->getNodeContent("channel/image/url");

echo "<img src='$xml_image'>";

$xml_items = $xml_root->getNodes("channel/item");
while ($xml_item = $xml_items->next()) {

	$text = addslashes($xml_item->get("title"));
	$text2 = addslashes($xml_item->get("description"));
	$url = addslashes($xml_item->get("link"));

	echo $text.$text2.$url;
}


?>