<?php
error_reporting(0);
// include lastRSS library
include './lastRSS.php';

// create lastRSS object
$rss = new lastRSS;

// setup transparent cache
$rss->cache_dir = './cache';
$rss->cache_time = 3600; // one hour

// load some RSS file
// XXX
if ($rs = $rss->get('http://h-k.sk/scripts/google2rss.php?num=15&q=smallpox')) {

print_r($rs);
}
else {
	die ('Error: RSS file not found...');
}

?>

