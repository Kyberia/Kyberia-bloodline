<?php
// output buffering forcing (mx)
if (!empty($_POST['FORCE_OB']) && $_POST['FORCE_OB'] == 'true') ob_start();

//header("Location: http://web.archive.org/web/20020925021139/http://kyberia.sk");
//echo "je to uz uplne v pici. vsetky data su stratene, prajem pekny den :)";
//exit;

//starting timer for benchmarking purposes
$timer_start=Time()+SubStr(MicroTime(),0,8);

//setting PHPSESSID cookie and starting user session
session_start();

error_reporting(1);
//$_SESSION['debugging']=1;
//exit;


if ($_SESSION['debugging']) {

    error_reporting(E_ALL);
    echo "GET VARIABLES::<br/>";
    print_r($_GET);
    echo "POST VARIABLES::<br/>";
    print_r($_POST);
    echo "<b>SESSION VARIABLES::</b><br/>";
    print_r($_SESSION);
}

//requiring main config file with path/database etc. constants
require('config/config.inc');
require(INCLUDE_DIR.'senate.inc');

if (isset($_SERVER['HTTP_REFERER'])) {
	preg_match("/id\/([0-9]*)\//",$_SERVER['HTTP_REFERER'],$ref_match);
	$referer_id=$ref_match[1];
}

//connecting to database and creating universal $db object
require(INCLUDE_DIR.'log.inc');
require(INCLUDE_DIR.'ubik.inc');
require(INCLUDE_DIR.'nodes.inc');
require(INCLUDE_DIR.'error_messages.inc');
require(INCLUDE_DIR.'database.inc');

$db = new CLASS_DATABASE();

if (!empty($_GET['template_id'])) {
	$template_id=$_GET['template_id'];
} else {
	$template_id=false;
}

//initializing node methods
if (!empty($_GET['node_name'])) {
	$node  = nodes::redirByName($_GET['node_name']);
} elseif (!empty($_GET['node_id'])) {
	$node = nodes::getNodeById($_GET['node_id'],
		(isset($_SESSION['user_id']))?$_SESSION['user_id']:'');
}

//XXX Paths are wrong (!)
//loading smarty template engine and setting main parameters
require(SMARTY_DIR.'Smarty.class.php');
$smarty = new Smarty;

//$smarty->php_handling = SMARTY_PHP_REMOVE; //XXX
$smarty->template_dir = TEMPLATE_DIR;
//echo TEMPLATE_DIR.TEMPLATE_SET;
//echo $smarty->template_dir;
$smarty->compile_dir = SYSTEM_DATA."templates_c/";
$smarty->config_dir = SMARTY_DIR.'configs/'; //XXX neexistuje
$smarty->cache_dir = SMARTY_DIR.'cache/';
$smarty->plugins_dir = SMARTY_PLUGIN_DIR ;
if ($_SESSION['debugging']) $smarty->debugging=true;

// initializing variables
// preg_replace prevents LFI
if (empty($_POST['event'])) $event=false;
else $event= preg_replace( "![^a-zA-Z0-9_]+!", "", $_POST['event']);


if ($_SESSION['debugging']) {
	echo "<pre><b>NODE::";
	print_r($node);
	echo "</pre>";
}

if ((isset($_SESSION['user_id']) && ($node['node_creator']==$_SESSION['user_id']))) {
	$node['node_permission']='owner';
}

if (isset($_SESSION['cube_vector']) && ($_SESSION['cube_vector'])) {
	if (strpos($node['node_vector'],$_SESSION['cube_vector'])===false) {
		echo "node::".$node['node_vector'];
		echo "cube_Vector::".$_SESSION['cube_vector'];
		echo "you are out of allowed cwbe. access forbidden";
		die();
	}
}

//if not existent node show our own 404
if (empty($node)) {
	$nodes= nodes::getNodesByName($_GET['node_name']);
	if ($nodes) {
		$smarty->assign('nodes',$nodes);
		$content=$smarty->display("404.tpl");
		die();
	}
	elseif ($_SESSION['user_id']) {
		$smarty->assign('node_name',$_GET['node_name']);
		$content=$smarty->display("modules/addnode.tpl");
	}
}

//modifying node glass pearl //XXX WTF
if (is_array($children_types[$node['node_type']])) {
	$smarty->assign('children_types',$children_types[$node['node_type']]);
}
$smarty->assign('types',$types);


//$node['node_type']=$types[$node['node_type']];
$node['node_content']= StripSlashes($node['node_content']);
$node['node_name']= StripSlashes($node['node_name']);

//checking permissions
function _checkPermissions()
{
	global $permissions, $node;

	require(INCLUDE_DIR.'permissions.inc');
	$permissions=permissions::checkPermissions($node);
	$permissions['h']=permissions::isHierarch($node);
}

// mail rss
if ($template_id=='rss') //XXX WHAT?
{
	$_feedType = "RSS0.91";
	if (!is_numeric($_SESSION['user_id']))
	{
		if (!isset($_SERVER['PHP_AUTH_USER'])) {
			header('WWW-Authenticate: Basic realm="Kyberia"');
			header('HTTP/1.0 401 Unauthorized');
			echo 'Cancel button';
			exit;
		}
		else
		{
			require_once(EVENT_DIR.'/login.inc');
			$_POST['login'] = $_SERVER['PHP_AUTH_USER'];
			$_POST['password'] = $_SERVER['PHP_AUTH_PW'];
			$_POST['login_type'] = "name";
			if (!login())
			{
				echo "Zle meno/heslo.";
				exit();
			}
		}
	}

	_checkPermissions();

	// Mail
	if ($_GET['node_id']==='24' && $permissions['r'])
	{
	   require_once(INCLUDE_DIR.'/feedcreator.class.php');

	   $rss = new UniversalFeedCreator();
	   $rss->title = "Kyberia mail";
	   $rss->description = "";
	   $rss->link = "https://". SYSTEM_URL . "/id/24";

		//XXX into function
	   $query = "select date_format(mail.mail_timestamp,\"%e.%c. %k:%i:%s\") as cas,
   userfrom.user_action as locationfrom_action,
   userfrom.user_action_id as locationfrom_action_id,
   userto.user_action as locationto_action,
   userto.user_action_id as locationto_action_id,
   userto.login as mail_to_name, userfrom.login as mail_from_name,
   mail.* from mail left join users as userfrom on
   mail_from=userfrom.user_id left join users as userto on mail_to=userto.user_id
   where mail_user='$_SESSION[user_id]' and mail_to='$_SESSION[user_id]' order by mail_id desc limit 0,10";

	   $set = $db->query($query);

	   while($set->next()) {
		   $m = $set->getRecord();
		   if ($m['mail_to'] != $_SESSION['user_id'])
			   continue;
		   $item = new FeedItem();
		   $item->title = $m['mail_from_name'];
		   $item->link = "https://".SYSTEM_URL."/id/24";
		   $item->description = $m['mail_text'];
		   $rss->addItem($item);
	   }
	}
	// bookmarks
	elseif ($_GET['node_id']=='19' && $permissions['r'])
	{
		require_once(INCLUDE_DIR.'/feedcreator.class.php');

		$rss = new UniversalFeedCreator();
		$rss->title = "Kyberia bookmarks";
		$rss->link = "http://".SYSTEM_URL."/id/19"; //XXX https ?

		require_once(SMARTY_PLUGIN_DIR.'/function.get_bookmarks.php');
		smarty_function_get_bookmarks(array(), $smarty);
		$_items = $smarty->get_template_vars('get_bookmarks');
		foreach ($_items as $_item)
		{
			if (is_array($_item['children']))
				foreach ($_item['children'] as $_b)
				{
					$item = new FeedItem();
					$item->title = $_b['node_name'];
					$item->link = "http://".SYSTEM_URL."/id/".$_b['node_id']."/rss";
					$rss->addItem($item);
				}
		}
		$_feedType = 'OPML';
	}
	elseif ($permissions['r'])
	{
		require_once(INCLUDE_DIR.'/feedcreator.class.php');

		$rss = new UniversalFeedCreator();
		$rss->title = $node['node_name'];
		$rss->description = "";
		$rss->link = "http://".SYSTEM_URL."/id/".$node['node_id'];

		// K list
		if ($_GET['node_id']=='15')
		{
			require_once(SMARTY_PLUGIN_DIR.'/function.get_k.php');
			smarty_function_get_k(array(), $smarty);
			$_items = $smarty->get_template_vars('get_k');
		}
		else
		{
			require_once(SMARTY_PLUGIN_DIR.'/function.get_children.php');
			smarty_function_get_children(
				array('orderby' => 'desc', 'orderby_type' => 'time'), $smarty);
			$_items = $smarty->get_template_vars('get_children');
		}

		foreach ($_items as $_item)
		{
			$item = new FeedItem();
			$item->title = $_item['node_name'];
			$item->link = "http://".SYSTEM_URL."/id/".$_item['node_id'];
			$item->description = $_item['node_content'];
			$rss->addItem($item);
		}
	}

	if ($permissions['r']) $rss->showFeed($_feedType);
	exit();
}

_checkPermissions();

//entering the node

//sventest
if (($permissions['r']) || ($event != 'register')) {

	//performing node_events (based on update/insert/delete db queries)
	if ($event) {
		require(INCLUDE_DIR.'eventz.inc');
	}

	elseif ($transaction) {
		require(INCLUDE_DIR.'transaction.inc');
	}
	//end of performing node events

	//sventest
}


if ($permissions['r']) {

// these 4 lines are not the source of kyberia lagging problems.
// leave them. started on the 10.4. 
// data gained will be used for scientific purposes

// if (isset($_SESSION['user_id']) {
//	log_levenshtein($_SESSION['user_id'],$node['node_id']);
// }

if ((isset($_SESSION['user_id'])) && ($_SESSION['user_id'])) {
	$q="insert delayed into levenshtein set user_id='".$_SESSION['user_id']."',node_id='".$node['node_id']."'";
	$db->update($q);
}

//if node is css
//XXX into function
if ($node['template_id']!='2019721'){

	logger::log('enter',$node['node_id'],'ok',$node['node_user_subchild_count']);
	if (!empty($_SESSION['user_id']) && is_numeric($node['node_id'])) {
		$q="update node_access set visits=visits+1,node_user_subchild_count='0',last_visit=NOW() where node_id='".$node['node_id']."' and user_id='".$_SESSION['user_id']."'";
//		echo $q;
		$result=$db->update($q);

		if (!$result) {
			$q="insert into node_access set user_id='".$_SESSION['user_id']."',node_id='".$node['node_id']."',last_visit=NOW()";
			$db->query($q);
		}
	}//end of if node os css
}

}

//XXX into function
// if (isset($_SESSION['user_id']) {
//	if (isset($referer_id)) {
//		update_nodes($_SESSION['user_id'],$node['node_id'],$referer_id);
//	} else {
//		update_nodes($_SESSION['user_id'],$node['node_id'],0);	
//	}
// }

// DO NOT MESS WITH THIS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//creating neural network
$db->update("update nodes set node_views=node_views+1 where node_id='".$node['node_id']."'");
if (isset($referer_id) && is_numeric($referer_id)) {
	$q="update neurons set synapse=synapse+1 where dst='".$node['node_id']."' and src='$referer_id'";
	$result=$db->update($q);
	if (!$result) {
		$q="insert into neurons set synapse_creator='".$_SESSION['user_id']."',dst='".$node['node_id']."',src='$referer_id',synapse=1";
		$db->query($q);
		}
}


elseif (!$permissions['r'] && $_GET['magic_word']) {
	$magic_word_big=$_GET['magic_word'];

	if ( preg_match("/(\d+)-(.+)/",$_GET['magic_word'],$mu)) {
		$magic_uid=$mu['1'];
		$magic_word=addslashes($mu['2']);
		// XXX WTF column magic_word does not exists
		$q="select login from users where user_id='$magic_uid' and magic_word='$magic_word'";
		$set=$db->query($q);
		if ($set->getNumRows()) {
			$permissions['r']=true;
		}
	}
}





else {
	logger::log('enter',$node['node_id'],'failed');
}



//assigning user data to smarty if user logged in
if (isset($_SESSION['user_id'])&&($user_id=$_SESSION['user_id'])) {
	$smarty->assign('_POST',$_POST);
	$smarty->assign('bookmarks',$_SESSION['bookmarks']);
	$smarty->assign('ignore',$_SESSION['ignore']);
	$smarty->assign('bookstyl',$_SESSION['bookstyl']);
	$smarty->assign('fook',$_SESSION['fook']);
	$smarty->assign('user_id',$_SESSION['user_id']);
	if (!empty($_SESSION['cube_vector'])) 
		$smarty->assign('cube_vector',$_SESSION['cube_vector']);
        $smarty->assign('friends',$_SESSION['friends']); //req by freezy, done by darkaural
	$smarty->assign('user_quota',$_SESSION['user_quota']);

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

	//mail node
	if ($node['node_name']=='mail') {

		//clear new mail message
		
		if ($new_mail) $db->query("update users set user_mail=0 where user_id='$user_id'");

		//set messages as delivered to recipient
		$set=$db->query("select mail_id,mail_duplicate_id from mail where mail_user='$user_id' and mail_to='$user_id' and mail_read='no'");
		while($set->next()) {
			$db->query("update mail set mail_read='yes' where mail_id='".$set->getString('mail_duplicate_id')."'");
			$db->query("update mail set mail_read='yes' where mail_id='".$set->getString('mail_id')."'");

			$new_messages[$set->getString('mail_id')]=true;
		}
/*
		if (count($new_messages)) {
			$db->query("update mail set mail_read='yes' where mail_user='$user_id' and mail_user=mail_to and mail_read='no'");
			$smarty->assign('new_messages',$new_messages);

        	}
*/
	}
}



if ($node['node_system_access']=='crypto') {
	$smarty->assign('crypto_pass',$_SESSION['crypto'][$node['node_id']]);
}

$smarty->assign('error',$error);
$smarty->assign('permissions',$permissions);
$smarty->assign('current_vector',$node['node_vector']);
if ($permissions['r']) $smarty->assign('node',$node);
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
if (($node['template_id']!='2019721') && (isset($_SESSION['user_id']))){
//setting user location
$q="update users set last_action=NOW(),user_location_vector='".$node['node_vector']."',user_action='".addslashes($node['node_name'])."',user_action_id='".$node['node_id']."' where user_id='".$_SESSION['user_id']."'";
$db->executequery($q);
}

$whole_time=SubStr((Time()+SubStr(MicroTime(),0,8)-$timer_start),0,7);
$smarty->assign('whole_time',$whole_time);


if ($template_id=='download' OR $template_id=='download.jpg') {
	if ($permissions['r']) {
	$linkname = SYSTEM_ROOT."/files/".$node['node_id'];
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
	else { echo "you don't have permissions for downloading this data"; die(); }
}

if ($node['template_id']=='2019721'){
Header("Cache-control: max-age=3600");
}else{
Header("Cache-control: no-cache");
Header("Expires:".gmdate("D, d M Y H:i:s")." GMT");
header("Last-Modified: ".gmdate("D, d M Y H:i:s")." GMT");
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
		$listing_amount=mysql_real_escape_string($_POST['listing_amount']);
	}elseif (!empty($_SESSION['listing_amount'])) $listing_amount=$_SESSION['listing_amount'];
        else $listing_amount=DEFAULT_LISTING_AMOUNT;
	$smarty->assign('listing_amount',$listing_amount);

	if (isset($_POST['listing_order']) && $_POST['listing_order']) {
		$listing_order=mysql_real_escape_string($_POST['listing_order']);
	} elseif (!empty($_SESSION['listing_order'])) $listing_order=$_SESSION['listing_order'];
	else $listing_order=DEFAULT_LISTING_ORDER;
	$smarty->assign('listing_order',$listing_order);

	if (isset ($_POST['get_children_offset']) && is_numeric($_POST['get_children_offset'])) {
		$offset=$_POST['get_children_offset'];
	} else { $offset=0; }


        //movement forward and backward
//	if ($listing_order=='asc' && !$offset) $offset=$descendant_count-$listing_amount;

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
        if ($offset<0) $offset=0;
        $_POST['offset']=$offset;
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

if ($template_id=='2019721'){
	$content=$smarty->fetch($template_id.".tpl");
	echo $content;
}else{
	$time=SubStr((Time()+SubStr(MicroTime(),0,8)-$timer_start),0,7);
	echo $content;
//	echo "<center>page generation took: $time second</center>";
}
//end of displaying

// output buffering forcing (mx)
if (!empty($_POST['FORCE_OB']) && $_POST['FORCE_OB'] == 'true') ob_end_flush();

?>
