<?
function get_templates() {
$sql = "select * from `nodes` where `external_link` LIKE 'template://%'";
$q = mysql_query($sql);
if(mysql_num_rows($q)) {
$count = mysql_num_rows($q);

while($res = mysql_fetch_object($q)) {
	$content = mysql_fetch_object(mysql_query("select * from `node_content` where `node_id` = '{$res->node_id}'"));
	print $res->node_id;
	print ">>>";
	print $content->node_content;
	print "<br>";
}
}
}

?>
