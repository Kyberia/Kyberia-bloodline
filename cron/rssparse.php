#!/usr/local/bin/php
<?php
require('../config/config.inc');
//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$set=$db->query("select nodes.*,node_content.*,nodes.node_id as node_id from nodes left join node_content on nodes.node_id=node_content.node_id where node_type='28' and nodes.node_id>100");

// include lastRSS library
include '../inc/lastRSS.php';

// create lastRSS object
$rss = new lastRSS;

// setup transparent cache
$rss->cache_dir = './cache';
$rss->cache_time = 3600; // one hour

while ($set->next()) {
// load some RSS file
	if (!preg_match("/http:(.*)/",$set->getString('node_content'))) {
		$rs = $rss->get("http://kyberia.sk/scripts/google2rss.php?num=25&q=".$set->getString('node_content'));
	}
	else {
/*
		ob_start();
		readfile($set->getString('node_content'));
		$data=ob_get_contents();
		ob_end_clean();
*/
		$rs=$rss->get($set->getString('node_content'));

	}


	foreach ($rs['items'] as $item) {
			$q="select node_id from nodes where node_name='".addslashes($item['title'])."'";
			$itemset=$db->query($q);
			if (!$itemset->getNumRows()) {
/*
				$q="insert into nodes set
node_name='".addslashes($item['title'])."',
node_parent='".$set->getString('node_parent')."',
node_thread_vector='".$set->getString('node_thread_vector').";".$set->getString('node_parent')."',
node_system_access='".$set->getString('node_system_access')."',
node_external_access='".$set->getString('node_external_access')."',external_link='".addslashes($item['link'])."',
node_type=13,node_creator='".$set->getString('node_id')."',node_created=NOW()";
				$db->query($q);
				$id=$db->getLastInsertId();
				$text=$item['description'];
*/
				//$text.="<br><br><iframe width='666' height='230' src='".$item['link']."'>";
				$text=AddSlashes($item['description']);
				$params['node_content']=$text;
				$params['node_name']=addslashes($item['title']);
				$params['node_parent']=$set->getString('node_parent');
				$params['node_creator']=$set->getString('node_id');
				nodes:addNode($params);

			}
		}
	}




?>