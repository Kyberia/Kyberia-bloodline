<?php


class ubik {


	function ubikRegister() {

		global $db;
		$user_info=$_POST['user_info'];
		$login=$_POST['login'];
		$user_www=$_POST['user_www'];
		$email=$_POST['email'];
		$icq=$_POST['user_icq'];

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
		$q="insert into mail set mail_from='".UBIK_ID."',mail_to='$mail_to',mail_user='$mail_to',mail_timestamp=NOW(),mail_text='$mail_text'";
		$db->query($q);
		$db->query("update users set
user_mail_name='ubik',user_mail_id=".UBIK_ID.",user_mail=user_mail+1 where
user_id='$mail_to'");

	}
}

?>
