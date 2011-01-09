<?php

//requiring main config file with path/database etc. constants
require_once('config/config.inc'); 

//Ask for auth if enabled...
//if(isset($realm) && isset($users)) require_once(INCLUDE_DIR.'http_auth.php'); 

//PATH_INFO Debug (usefull when messing with mod_rewrite)
//echo($_SERVER['PATH_INFO']."\n<pre>"); 
//var_dump(preg_split('/\//', $_SERVER['PATH_INFO'])); die();
//output buffering forcing (mx)

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

//Path info (Experimental - this replaced most of mod_rewrites...)
@$PATH_INFO=trim($_SERVER[PATH_INFO]);
if($PATH_INFO != '') {
	$PATH_CHUNKS = preg_split('/\//', $PATH_INFO);
	if(isset($PATH_CHUNKS[1])) switch($PATH_CHUNKS[1]) {
		case 'k':
			if(isset($PATH_CHUNKS[2]) && $PATH_CHUNKS[2] != '') $_GET['node_kid'] = $PATH_CHUNKS[2];
			if(isset($PATH_CHUNKS[3]) && $PATH_CHUNKS[3] != '') $_GET['template_kid'] = $PATH_CHUNKS[3];
			break;
		case 'id':
			if(isset($PATH_CHUNKS[2]) && $PATH_CHUNKS[2] != '') $_GET['node_id'] = $PATH_CHUNKS[2];
			if(isset($PATH_CHUNKS[3]) && $PATH_CHUNKS[3] != '') $_GET['template_id'] = $PATH_CHUNKS[3];

			//Base36 fascism redirect
			if($_GET['template_id'] == 'download') break; //Fix ugly download hack...
			if(!count($_POST)) {
				header('Location: /k/'.base_convert($_GET['node_id'], 10, 36).
					(isset($_GET['template_id'])?'/'.base_convert($_GET['template_id'], 10, 36):'')
				);
				die("Base36 fascism...\n"); 
				// If you want to be a fascist 
				// you have to die imediatelly...
			}

			break;
		default:
			if($PATH_CHUNKS[1] != '') $_GET['node_name'] = $PATH_CHUNKS[1];
			if(isset($PATH_CHUNKS[2]) && $PATH_CHUNKS[2] != '') $_GET['template_kid'] = $PATH_CHUNKS[2];
			break;
	}
}
if(
	(!isset($_GET['node_kid']) || trim($_GET['node_kid']) == '') &&
	(!isset($_GET['node_id']) || trim($_GET['node_id']) == '')
) $_GET['node_kid'] = 1;

//Base36 http://en.wikipedia.org/wiki/Base_36 (Initial support only :-)
if(isset($_GET['node_kid'])) $_GET['node_id'] = base_convert($_GET['node_kid'], 36, 10);
if(isset($_GET['template_kid'])) $_GET['template_id'] = base_convert($_GET['template_kid'], 36, 10);

if (isset($_SERVER['HTTP_REFERER'])) {
	preg_match('/(k|id)\/([0-9]*)\//',$_SERVER['HTTP_REFERER'],$ref_match);
	$referer_id=$ref_match[1];
}

//connecting to database and creating universal $db object
require_once(INCLUDE_DIR.'senate.inc');
require_once(INCLUDE_DIR.'log.inc');
require_once(INCLUDE_DIR.'ubik.inc');
require_once(INCLUDE_DIR.'nodes.inc');
require_once(INCLUDE_DIR.'error_messages.inc');
require_once(INCLUDE_DIR.'database.inc');
require_once(INCLUDE_DIR.'transports.inc');

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

//if not existent node show our own 404
if (empty($node)) {
	$nodes= nodes::getNodesByName($_GET['node_name']);
	if ($nodes) {
		$smarty->assign('nodes',$nodes);
		$content=$smarty->display('404.tpl');
		die();
	}
	elseif ($_SESSION['user_id']) {
		$smarty->assign('node_name',$_GET['node_name']);
		$content=$smarty->display("modules/addnode.tpl");
	}
}

//modifying node glass pearl //XXX WTF
//if (is_array($children_types[$node['node_type']])) {
//	$smarty->assign('children_types',$children_types[$node['node_type']]);
//}

//smarty->assign('types',$types);
//$node['node_type']=$types[$node['node_type']];

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

//entering the node (executing the eventz)
if (($permissions['r']) || ($event != 'register')) {
	//performing node_events (based on update/insert/delete db queries)
	if ($event) {
		require(INCLUDE_DIR.'eventz.inc');
	}
}

if (isset($_POST['FORCE_OB'])) ob_end_flush(); //output buffering forcing (mx)

?>
