<?php
function display() {
	global $node,$db,$error,$referer_id,$smarty,$permissions,$template_id;
	global $timer_start;
	if (!$referer_id) $referer_id=1;
	$content='';

	$node_id=$node['node_id'];
	$user_id=(empty($_SESSION['user_id'])) ? "" : $_SESSION['user_id'];

if ($permissions['r']) {

// data gained will be used for scientific purposes

if ((isset($_SESSION['user_id'])) && ($_SESSION['user_id'])) {
	nodes::levenshteinLog($_SESSION['user_id'],$node['node_id']);
}

// WTF
//if node is css
//XXX into function
if ($node['template_id']!='2019721'){

	logger::log('enter',$node['node_id'],'ok',$node['node_user_subchild_count']);
	if (!empty($_SESSION['user_id']) && is_numeric($node['node_id'])) {
		$q="update node_access set visits=visits+1,node_user_subchild_count='0',last_visit=NOW() where node_id='".$node['node_id']."' and user_id='".$_SESSION['user_id']."'";
		$result=$db->update($q);

		if (!$result) {
			$q="insert into node_access set user_id='".$_SESSION['user_id']."',node_id='".$node['node_id']."',last_visit=NOW()";
			$db->query($q);
		}
	}//end of if node os css
}

}

//assigning user data to smarty if user logged in
if (isset($_SESSION['user_id'])&&($user_id=$_SESSION['user_id'])) {
	$smarty->assign('_POST',$_POST);
	$smarty->assign('bookmarks',$_SESSION['bookmarks']);
	if (isset($_SESSION['ignore'])) { $smarty->assign('ignore',$_SESSION['ignore']); };
	$smarty->assign('bookstyl',$_SESSION['bookstyl']);
	if (isset($_SESSION['fook'])) {$smarty->assign('fook',$_SESSION['fook']); };
	$smarty->assign('user_id',$_SESSION['user_id']);
	$smarty->assign('user_name',$_SESSION['user_name']);
	if (!empty($_SESSION['cube_vector'])) 
		$smarty->assign('cube_vector',$_SESSION['cube_vector']);
        $smarty->assign('friends',$_SESSION['friends']); //req by freezy, done by darkaural
	if (isset($_SESSION['user_quota'])) {$smarty->assign('user_quota',$_SESSION['user_quota']);};

	// XXX into function
	$newmail_q = sprintf('select u.user_mail_id
				, u.user_k
				, u.k_wallet
				, u.user_mail
				, ms.user_id as mail_sender_id
				, ms.login as mail_sender
				from users u
				left join users ms on ms.user_id = u.user_mail_id
				where u.user_id = %d',
				$user_id);
	$newmailset = $db->query($newmail_q);


	$newmailset->next();
	$new_mail=$newmailset->getString('user_mail');
	// XXX into function
	$newmailset2 = $db->query("select users.user_mail_id,mailsender.login
 from users left join users as mailsender on users.user_mail_id = mailsender.user_id where users.user_id = '$user_id'");
	$newmailset2->next();
	$smarty->assign('new_mail',$new_mail);
	$smarty->assign('new_mail_name',$newmailset->getString('mail_sender'));
	$smarty->assign('new_mail_name2',$newmailset2->getString('login'));
	$user_k=$newmailset->getString('user_k');
	$smarty->assign('user_k',$user_k);
	$k_wallet=$newmailset->getString('k_wallet');
	$smarty->assign('k_wallet',$k_wallet);
	$user_id=$_SESSION['user_id'];

	//mail node //OMG remove constant
	if ($node['node_id']==MAIL_NODE) {

		//clear new mail message
		if ($new_mail) {
			//set messages as delivered 
			$db->query("update users set user_mail=0 where user_id='$user_id'");
			$db->query("update mail set mail_read='yes' where mail_to='$user_id' and mail_read='no'");
		}

	}
}



if ($node['node_system_access']=='crypto') {
	$smarty->assign('crypto_pass',$_SESSION['crypto'][$node['node_id']]);
}

$smarty->assign('error',$error);
$smarty->assign('permissions',$permissions);
$smarty->assign('current_vector',$node['node_vector']);
if ($permissions['r']) {
	$smarty->assign('node',$node);
	$smarty->assign('node_json',json_encode($node));
}
else {
	$smarty->assign('node',$node);
	//new templates by Dark matter
	$smarty->template_dir=OWN_TEMPLATE_DIR;

	$smarty->display('1549864.tpl');
	$smarty->display('1549885.tpl');
	$smarty->display('630526.tpl');
	die();

	//redirect to mainpage
// looks like poeple totaly hate this redirect!
//	header("Location: /id/1");
}


// XXX into function
if (isset($_SESSION['user_id']) && ($_SESSION['user_id']!='')){
	//setting user location
	$q="update users set last_action=NOW(),user_location_vector='".
	$node['node_vector']."',user_action='".addslashes($node['node_name']).
	"',user_action_id='".$node['node_id']."' where user_id='".$_SESSION['user_id']."'";
	$db->query($q);
}

$whole_time=SubStr((Time()+SubStr(MicroTime(),0,8)-$timer_start),0,7);
$smarty->assign('whole_time',$whole_time);


if ($template_id=='data') {
	if ($permissions['r']) {
		$linkname = FILE_DIR."/".$node['node_id'];
		$filename= readlink($linkname);
		$suffix=preg_replace("/(.*?)\.(.*?)/i","$2",$filename);

		$ext = substr( $filename,-3 );
		if( $filename == "" ) {
		   echo "ERROR: Empty file to download. ";
		   exit;
		} elseif ( ! file_exists( $filename ) ) {
		 	exit;
	};
	switch( strtolower($ext) ){
	   case "pdf": $ctype="application/pdf";              break;
	   case "exe": $ctype="application/octet-stream";      break;
	   case "zip": $ctype="application/zip";              break;
	   case "doc": $ctype="application/msword";            break;
	   case "xls": $ctype="application/vnd.ms-excel";      break;
	   case "ppt": $ctype="application/vnd.ms-powerpoint"; break;
	   case "gif": $ctype="image/gif";                    break;
	   case "png": $ctype="image/png";                    break;
	   case "jpg": $ctype="image/jpg";                    break;
	   default:    $ctype="application/force-download";
	}
	$file=str_replace(" ","_",$node['node_name']).".$ext";
	header("Pragma: public");
	header("Expires: 0");
	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
	header("Content-Type: $ctype");
	$user_agent = strtolower ($_SERVER["HTTP_USER_AGENT"]);
	if ((is_integer (strpos($user_agent, "msie"))) && (is_integer
	(strpos($user_agent, "win")))) {
	   header( "Content-Disposition: filename=$file;" );
	} else 	{
	   header( "Content-Disposition: attachment;
	filename=$file;" );
	}
	header("Content-Transfer-Encoding: binary");
	header("Content-Length: ".filesize($filename));
	readfile("$filename");
	exit();
	}
	else { 
		echo "you don't have permissions for downloading this data"; 
		die(); 
	}
}



//for cases like search & preview
	$smarty->assign('post_vars',$_POST);
if (!empty($_POST['template_event'])) {
	$smarty->assign('template_event',$_POST['template_event']);

}

//setting listing parameters
        $children_count=$node['node_children_count'];
	$descendant_count=$node['node_descendant_count'];

        if (isset($_POST['listing_amount']) && is_numeric($_POST['listing_amount'])) { 
		$listing_amount=db_escape_string($_POST['listing_amount']);
	}elseif (!empty($_SESSION['listing_amount'])) $listing_amount=$_SESSION['listing_amount'];
        else $listing_amount=DEFAULT_LISTING_AMOUNT;
	$smarty->assign('listing_amount',$listing_amount);

	if (isset($_POST['listing_order']) && $_POST['listing_order']) {
		$listing_order=db_escape_string($_POST['listing_order']);
	} elseif (!empty($_SESSION['listing_order'])) $listing_order=$_SESSION['listing_order'];
	else $listing_order=DEFAULT_LISTING_ORDER;
	$smarty->assign('listing_order',$listing_order);

	if (isset ($_POST['get_children_offset']) && is_numeric($_POST['get_children_offset'])) {
		$offset=$_POST['get_children_offset'];
	} else { $offset=0; }


        //movement forward and backward
//	if ($listing_order=='asc' && !$offset) $offset=$descendant_count-$listing_amount;

	if (isset($_POST['get_children_move'])) { 
		if ($_POST['get_children_move']=='<') {
			$offset=$offset-$listing_amount;
	 		if ($offset<0) $offset=0;
		}
		elseif ($_POST['get_children_move']=='>') {
			$offset=$offset+$listing_amount;
		}
		elseif ($_POST['get_children_move']=='>>') {
			$offset=$descendant_count-$listing_amount;
	 	}

		elseif ($_POST['get_children_move']=='<<') {
			$offset=0;
		}
	}
	if ($offset<0) $offset=0;
	$_POST['offset']=$offset; // XXX sqli?
	$smarty->assign('offset',$offset);

if ($node['external_link']=='header://svg' && !is_numeric($template_id)) {
	header("Content-Type: image/svg+xml");
}

//show own header
elseif (isset($_SESSION['header_id']) && ($_SESSION['header_id']==true)) {
	$smarty->assign('header_id',$_SESSION['header_id']);
	$smarty->template_dir=OWN_TEMPLATE_DIR;
	$content=$smarty->fetch($_SESSION['header_id'].".tpl");
	$smarty->template_dir = TEMPLATE_DIR.TEMPLATE_SET;
	//not registered user
	if ($_SESSION['header_id']==2091520) {
		echo $content;
		session_destroy();
		die();
	}
}

$smarty->template_dir=OWN_TEMPLATE_DIR;

if (is_numeric($template_id)) {
	$content.=$smarty->fetch($template_id.".tpl");
}

else {
	$template_id=$node['template_id'];
	$content.=$smarty->fetch($node['template_id'].".tpl");
}

// XXX remove constant
if ($template_id=='2019721'){
	$content=$smarty->fetch($template_id.".tpl");
	echo $content;
}else{
	$time=SubStr((Time()+SubStr(MicroTime(),0,8)-$timer_start),0,7);
	echo $content;
//	echo "<center>page generation took: $time second</center>";
}
//end of displaying

	return true;
}
