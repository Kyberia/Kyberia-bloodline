<?php
//requiring main config file with path/database etc. constants
require_once('config/config.inc'); 

//Ask for auth if enabled...
//if(isset($realm) && isset($users)) require_once(INCLUDE_DIR.'http_auth.php'); 

//starting timer for benchmarking purposes
$timer_start=Time()+SubStr(MicroTime(),0,8);
//setting PHPSESSID cookie and starting user session

//error reporting has to be before session_start
error_reporting(-1);
ini_set('display_errors','On');
session_start();

@ini_set('magic_quotes_gpc' , 'off');
if(get_magic_quotes_gpc()) {
	die("Error: magic_quotes_gpc needs to be disabled! F00K!\n");
}

//Smarty from DB
$smarty_resource = 'kyberia';

//connecting to database and creating universal $db object
//require_once(INCLUDE_DIR.'senate.inc'); // in config already
require_once(INCLUDE_DIR.'log.inc');
require_once(INCLUDE_DIR.'ubik.inc');
require_once(INCLUDE_DIR.'nodes.inc');
require_once(INCLUDE_DIR.'error_messages.inc');
require_once(INCLUDE_DIR.'database.inc');
require_once(INCLUDE_DIR.'transports.inc');

$db = new CLASS_DATABASE();

switch(true) {
	case preg_match('/id\/([0-9]+)(?:\/([a-zA-Z0-9]+)\/?)?/',$_SERVER['PATH_INFO'],$match):
		$_GET['node_id']=$match[1];
		if (!empty($match[2])) {
			$_GET['template_id']=$match[2];
		}
		//Base36
/*
		if(!count($_POST) && !(isset($_GET['template_id']) && $_GET['template_id'] == 'download')) { //Fix ugly download hack...
			header('Location: /k/'.base_convert($_GET['node_id'], 10, 36).
				(isset($_GET['template_id'])?'/'.base_convert($_GET['template_id'], 10, 36):'')
			);
			die("Die!!! All Fascists Are Bastards...\n")
		}
*/
		break;

	case preg_match('/k\/([a-z0-9]{1,7})(?:\/([a-z0-9]+))?/',$_SERVER['PATH_INFO'],$match):
		$_GET['node_id']=base_convert($match[1], 36, 10);
		if (!empty($match[2])) {
			$_GET['template_id']=$match[2];
		}
		break;
	case preg_match('/name\/(.*?)\/?$/',$_SERVER['PATH_INFO'],$match):
		$_GET['node_id']  = nodes::getNodeIdByName($match[1]);
		break;
	case preg_match('/search\/(.*?)\/?$/',$_SERVER['PATH_INFO'],$match):
		//$query  = nodes::getNodeIdByName($match[1]);
		//XXX TODO: Predat searchi az bude fungovat
		break;
	case preg_match('/\/(.+)\/?$/',$_SERVER['PATH_INFO'],$match):
		$_GET['node_id']  = nodes::getNodeIdByName($match[1]);
		break;
	default:
		$_GET['node_id']=1; //WELCOME_NODE
		break;
}



if (!empty($_GET['template_id'])) {
	$template_id=$_GET['template_id'];
} else {
	$template_id=false;
}

error_reporting(E_ALL);
//use wwwroot/debugswitch.php (from Your browser) to switch debugging on/off 
if(isset($_SESSION['debugging']) && $_SESSION['debugging']) {
    ini_set('display_errors','On');
    echo 'GET VARIABLES::<br/>';
    print_r($_GET);
    echo 'POST VARIABLES::<br/>';
    print_r($_POST);
    echo 'FILES VARIABLES::<br/>';
    print_r($_FILES);    
    echo '<b>SESSION VARIABLES::</b><br/>';
    print_r($_SESSION);
} else {
	$_SESSION['debugging']=false;
	set_error_handler('logger::error_handler');
}

require_once(INCLUDE_DIR.'logout_idle.inc'); //Logout when idle

//initializing node
$node = nodes::getNodeById($_GET['node_id'],(isset($_SESSION['user_id']))?$_SESSION['user_id']:'');

//XXX Paths are wrong (!)
//loading smarty template engine and setting main parameters
require(SMARTY_DIR.'Smarty.class.php');
$smarty = new Smarty;
require(INCLUDE_DIR.'smarty/resource.kyberia.php');
$smarty->default_resource_type=$smarty_resource;

//$smarty->php_handling = SMARTY_PHP_REMOVE; //XXX
$smarty->template_dir = TEMPLATE_DIR;
//echo TEMPLATE_DIR.TEMPLATE_SET;
//echo $smarty->template_dir;
$smarty->compile_dir = SYSTEM_DATA.'templates_c/';
$smarty->config_dir = SMARTY_DIR.'configs/'; //XXX neexistuje
$smarty->cache_dir = SMARTY_DIR.'cache/';
$smarty->plugins_dir = SMARTY_PLUGIN_DIR ;
if (isset($_SESSION['debugging']) && $_SESSION['debugging']) $smarty->debugging=true;

// initializing variables
// preg_replace prevents LFI
if (empty($_POST['event'])) $event='display';
else $event= preg_replace( "![^a-zA-Z0-9_]+!", "", $_POST['event']);


if (isset($_SESSION['debugging']) && $_SESSION['debugging']) {
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

#@include_once(INCLUDE_DIR.'mail_rss.inc'); //haluz...

//checking permissions
include_once(BACKEND_DIR.'/'.DB_TYPE.'/permissions.inc');
$permissions=permissions::checkPerms($node);
if (!empty($_SESSION['debugging']) && $_SESSION['debugging']) {
	print_r($permissions);
}



// DO NOT MESS WITH THIS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//creating neural network
if  (preg_match('/id\/(\d+)/',isset($_SERVER['HTTP_REFERER'])? $_SERVER['HTTP_REFERER'] : "",$match)) {
	$referer_id=$match[1];
} elseif (preg_match('/k\/([a-z0-9]{1,7})/',isset($_SERVER['HTTP_REFERER'])? $_SERVER['HTTP_REFERER'] : "",$match)) {
	$referer_id=base_convert($match[1], 36, 10);
} elseif (preg_match('/name\/(.*?)\/?$/',isset($_SERVER['HTTP_REFERER'])? $_SERVER['HTTP_REFERER'] : "",$match)) {
	$referer_id  = nodes::getNodeIdByName($match[1]);
}

$db->update("update nodes set node_views=node_views+1 where node_id='".$node['node_id']."'");
if (isset($referer_id) && is_numeric($referer_id)) {
	$q="update neurons set synapse=synapse+1 where dst='".$node['node_id']."' and src='$referer_id'";
	$result=$db->update($q);
	if (!$result) {
		$q="insert into neurons set synapse_creator='".$_SESSION['user_id']."',dst='".$node['node_id']."',src='$referer_id',synapse=1";
		$db->query($q);
		}
} else {
	logger::log('enter',$node['node_id'],'failed');
}



//entering the node (executing the eventz)
if (($permissions['r']) || ($event != 'register')) {
	//performing node_events (based on update/insert/delete db queries)
	if ($event) {
		require(INCLUDE_DIR.'eventz.inc');
	}
}

?>
