<?php
//Zatim jen test, je tu hromada SQLi, etc...
//Problem je v tom, ze kybca jentak nezobrazi hardlink pokud prislusna noda neexistuje lokalne...

die('Transport not ready yet! :-(');
function transport() {
/*php > print_r(preg_split('/[:@]/','kyberia.sk:23456@lol'));
Array
(
    [0] => kyberia.sk
    [1] => 23456
    [2] => domena.tld
)
*/

$nodeshell_id=$_POST['nodeshell_id'];

$transport = preg_split('/[:@]/',$nodeshell_id);
$nodeshell_id=$chosen;
$chosen=$transport[1];
if(isset($transport[2])) $domain=$transport[2];
$transport=$transport[0];

	global $error_messages,$db,$node,$error;
	$user_id = $_SESSION['user_id'];

	$nodeshell = nodes::getNodeById($nodeshell_id,UBIK_ID);
	//$nodeshell_permissions = permissions::checkPermissions($nodeshell);
	$nodeshell_vector = $nodeshell['node_vector'];

		$dst_vector = $nodeshell_vector.str_pad($chosen,VECTOR_CHARS,0,STR_PAD_LEFT);
		$q = "update neurons set synapse_created=NOW(),link='hard',synapse=synapse+1,
dst_vector='$dst_vector' where src='$chosen' and dst='$nodeshell_id'";
		$result=$db->update($q);

		if (!$result) $db->query("insert into neurons set synapse_creator='$user_id',synapse_created=NOW(),
src='$chosen',dst='$nodeshell_id',dst_vector='$dst_vector',link='hard',synapse=1,transport='$transport'");

		$db->query("update nodes set lastdescendant_created=NOW() where node_id='$nodeshell_id'");
}
?>
