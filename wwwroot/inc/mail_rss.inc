<?php
//Celej tenhle soubor je totalni haluz... bud opravit nebo neresit... ~harvie

/*
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

*/
