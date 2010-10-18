<?php
function test_button() {
	global $db,$error;
	$referer = $_SERVER['HTTP_REFERER'];
	echo $referer;
	echo $_POST['text'];
//	header("location: ".$referer."");
}
?>
