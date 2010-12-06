<?php
function k_wallet() {
// cheatfix, moznost prelievania user_k a k_walletu.

global $db,$node,$error;
$user_id=$_SESSION['user_id'];
$k_request=mysql_real_escape_string($_POST['k_wallet']);

$kset=$db->query("select user_k from users where user_id='$user_id'");
$kset->next();
$user_k=$kset->getString('user_k');

$kset=$db->query("select k_wallet from users where user_id='$user_id'");
$kset->next();
$k_wallet=$kset->getString('k_wallet');

$k_request = (int) $k_request; //integer only..



if (($k_wallet+(-1*$k_request)) < 0 or ($user_k-(-1*$k_request)) < 0 or (!$k_request)) {
	$error="Chybne zadanie alebo na to proste nemas:-)";
	return false;
}

$db->query("update users set k_wallet=k_wallet+(-1*$k_request) , user_k=user_k-(-1*$k_request) where user_id='$user_id'");
}

?>
