<?php


class ubik {


	function ubikRegister() {

		global $db;
		$user_info=$_POST['user_info'];
		$login=$_POST['login'];
//		$user_www=$_POST['user_www'];
		$email=$_POST['email'];
//		$icq=$_POST['user_icq'];

		$text=nodes::processContent($user_info)."<br><br>";
		$node_name="user $login registration";

		$params['node_creator']=UBIK_ID;
		$params['node_content']=$text;
		$params['node_name']=$node_name;
		$params['node_parent']=63802;
		return nodes::addNode($params);

	}

	function ubikMail($params) {
		global $db;
		if (is_numeric($params['mail_to'])) $mail_to=$params['mail_to'];
		else return false;
		if (!empty($params['mail_text'])) $mail_text=addslashes($params['mail_text']);
		else return false;


	$q_i = sprintf('insert into mail set mail_user = %2$d, mail_from = %1$d, mail_to = %2$d, mail_timestamp = NOW(), mail_text = "%3$s"'
		,UBIK_ID, $mail_to, $mail_text);
	$db->update($q_i);
	$q_u = sprintf('update users set user_mail = user_mail + 1, user_mail_id = %1$d where user_id = %2$d', UBIK_ID, $mail_to);
	$db->update($q_u);
	}
}

?>
