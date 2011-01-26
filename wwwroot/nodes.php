<?php
//requiring main config file with path/database etc. constants
require_once('config/config.inc'); 

//Ask for auth if enabled...
//if(isset($realm) && isset($users)) require_once(INCLUDE_DIR.'http_auth.php'); 

//starting timer for benchmarking purposes
$timer_start=Time()+SubStr(MicroTime(),0,8);
//setting PHPSESSID cookie and starting user session
session_start();

@ini_set('magic_quotes_gpc' , 'off');
if(get_magic_quotes_gpc()) {
	die("Error: magic_quotes_gpc needs to be disabled! F00K!\n");
}

//Smarty from DB
$smarty_resource = 'kyberia';
//$smarty_resource = ''; //same as 'file' (fallback)
/* I have moved old templates to DB using following lame script:
 * for i in *.tpl; do j=$(echo "$i" | cut -d . -f 1); 
   echo UPDATE nodes SET node_content = "'$(php -r 
   "echo mysql_escape_string(file_get_contents('$i'));")'" WHERE 
   node_id = "'$j'" COLLATE utf8_bin LIMIT '1;';
   done | mysql --user=kyberia --password=PASSSSSSS kyberia
 * In future we should have some mechanism for distributing templates 
 * because they are very important part of kyberia source...
 */

//connecting to database and creating universal $db object
//require_once(INCLUDE_DIR.'senate.inc'); // in config already
require_once(INCLUDE_DIR.'log.inc');
require_once(INCLUDE_DIR.'ubik.inc');
require_once(INCLUDE_DIR.'nodes.inc');
require_once(INCLUDE_DIR.'error_messages.inc');
require_once(INCLUDE_DIR.'database.inc');
require_once(INCLUDE_DIR.'transports.inc');

$db = new CLASS_DATABASE();

if (preg_match('/id\/([0-9]+)(?:\/([0-9]+)\/?)?/',$_SERVER['PATH_INFO'],$match)) {
//	print_r($match);
	$_GET['node_id']=$match[1];
	if (!empty($match[2])) {
		$_GET['template_id']=$match[2];
	}
} elseif (preg_match('/k\/([a-z0-9]{1,7})(?:\/([a-z0-9]{1,7}))?/',$_SERVER['PATH_INFO'],$match)) {
	$_GET['node_id']=base_convert($match[1], 36, 10);
	if (!empty($match[2])) {
		$_GET['template_id']=base_convert($match[2],36,10);	
	}
} elseif (preg_match('/name\/(.*?)\/?$/',$_SERVER['PATH_INFO'],$match)) {
	$_GET['node_id']  = nodes::getNodeIdByName($match[1]);
}

if (!empty($_GET['template_id'])) {
	$template_id=$_GET['template_id'];
} else {
	$template_id=false;
}

error_reporting(1);
//$_SESSION['debugging']=0;
//unset($_SESSION['debugging']); 
//Well... we should make some event 
//or JavaScript page to turning this on/off...
//exit;
if ($_SESSION['debugging']) {
    error_reporting(E_ALL);
    echo 'GET VARIABLES::<br/>';
    print_r($_GET);
    echo 'POST VARIABLES::<br/>';
    print_r($_POST);
    echo '<b>SESSION VARIABLES::</b><br/>';
    print_r($_SESSION);
}



//initializing node
if (!is_numeric($_GET['node_id'])) {
	$_GET['node_id']=WELCOME_NODE;
}

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
if ($_SESSION['debugging']) $smarty->debugging=true;

// initializing variables
// preg_replace prevents LFI
if (empty($_POST['event'])) $event='display';
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

@include_once(INCLUDE_DIR.'mail_rss.inc'); //haluz...

//checking permissions
function _checkPermissions()
{
	global $permissions, $node;
	require(INCLUDE_DIR.'permissions.inc');
	$permissions=permissions::checkPermissions($node);
	$permissions['h']=permissions::isHierarch($node);
}
_checkPermissions();


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
