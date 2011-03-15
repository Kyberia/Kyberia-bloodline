<?php

function remove_users() {
	global $permissions,$node,$db,$error;
$user_id=$_SESSION['user_id'];
$user_name=$_SESSION['user_name'];

// XXX rewrite

require(INCLUDE_DIR."phpmailer.inc");
$mail = new PHPMailer();
$mail->IsSMTP();                                // send via SMTP
$mail->Host     = "molly.kyberia.cz";		// SMTP servers
$mail->From     = "root@kyberia.cz";
$mail->FromName = "kyberia.cz admin";
$mail->WordWrap = 50;                           // set word wrap
$mail->Subject  =  "kyberia.cz neuspesna registracia";


	if (!$permissions['w']) {
		$error="you don't have permissions for performing this event";
		return false;
	}

	foreach ($_POST['waiting'] as $user =>$value) {

		$set=$db->query("select email,login,node_creator from users left join nodes on nodes.node_id=users.user_id where user_id='$user'");
		$set->next();
		$email=$set->getString('email');
		$login=$set->getString('login');

		$application_id=$set->getString('node_creator');

		$params['node_creator']=$user_id;
		$params['node_parent']=$application_id;
		$params['node_name']="$login refused";
		$params['node_content']="user $login was refused by $user_name";
		nodes::addNode($params);

		$db->query("delete from users where user_id='$user' and user_status='waiting'");
		$db->query("delete from nodes where node_id='$user' and node_type=7");
		$db->query("delete from node_content where node_id='$user'");



		$mail->ClearAddresses();
		$mail->AddAddress($email);
		$mail->AltBody  =  "bohuzial si nebol zaregistrovany na ".SYSTEM_URL.". ked chces skus znovu";
		if(!$mail->Send())
		{
		   $error="could not sent mail";
		   return false;
		}


	 }
	return true;
}
?>
