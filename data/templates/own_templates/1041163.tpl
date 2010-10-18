<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

{if $node.node_id eq 24}
<!-- IN MAIL SCRIPT -->
	<script language="JavaScript" type="text/javascript">
	<!--
	{literal}
		function vymena() {
			document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
			var browser = navigator.appName;
			if(browser == "Microsoft Internet Explorer") {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			else {
				xmlhttp = new XMLHttpRequest();
			}
			get_id_url = '/ajax/get_id_by_name.php?name=';
			get_id_url += document.formular.mail_to.value;
			xmlhttp.open("GET", get_id_url);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					id = xmlhttp.responseText;
					document.images['fricon'].src = '/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
				}
			}
			xmlhttp.send(null);
		}

		function chngto(name,id) {
			document.formular.mail_to.value = name ;
			name = name.toLowerCase() ;
			document.images['fricon'].src = '/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
		}
	{/literal}
	-->
	</script>
{/if}

<!-- MENU -->
<script language="JavaScript" type="text/javascript">
<!--
{literal}
	function hideMenu() {
		menu.className = "menu_off";
		offik.className = "onoff_off";
		onik.className = "onoff_on";
	}
	function showMenu() {
		menu.className = "menu_on";
		offik.className = "onoff_on";
		onik.className = "onoff_off";
	}
{/literal}
-->
</script>

<!-- PANEL JS -->
<script src='/data/templates/own_templates/1515428.tpl' type='text/javascript'></script>

<!-- CSS -->
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/645341.tpl' media='screen'>
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/973161.tpl' media='handheld'>

<!-- TITLE -->
<title>
	{if $new_mail eq true}
		{$new_mail} m@il | {$new_mail_name}
	{/if}
	{include file="791948.tpl"}
</title>

</head>
<body>
<center>
	<form method='post'>
		<table><tr>
			<td><input type='submit' name='event' value='debugging'></td>
			<td> | </td>
			<td><input type='submit' name='event' value='addTemplate'></td>
			<td><input type='text' name='add_template_id' value='{$node.node_id}' style='width: 75px;'></td>
			<td> |</td>
			<td><input type='submit' name='event' value='addEvent'></td>
			<td><input type='text' name='add_event_id' value='{$node.node_id}' style='width: 75px;'></td>
			<td> | </td>
			<td><input type='submit' name='event' value='addPlugin'></td>
			<td><input type='text' name='add_plugin_id' value='{$node.node_id}' style='width: 75px;'></td>
			<td> | </td>
			<td><input type='submit' name='event' value='addAjax'></td>
			<td><input type='text' name='add_ajax_id' value='{$node.node_id}' style='width: 75px;'></td>
			<td> | </td>
			<td><input type='submit' name='event' value='undelete'></td>
			<td><input type='text' name='undelete_id' value='31337' style='width: 75px;'></td>
		</tr></table>
	</form>
</center>

<!-- MAIL & ERROR -->
{if $new_mail eq true}
	<div class='most_important'><center>
		<a href='/id/24' class='mail'><b>u have {$new_mail} new mail last from {$new_mail_name2}</b></a>
	</center></div>
{/if}
{if $error eq true}
	<div class='most_important'><center>{$error}</center></div>
{/if}
<div id="main_menu">
	<button id="offik" class="onoff_on" onclick="return hideMenu()">x</button>
	<button id="onik" class="onoff_off" onclick="return showMenu()">x</button>
	<div id="menu" class="menu_on">
		<div class='line'>
			<a href='/id/1/' class='menu_l'>main</a>
			<a href='/id/1502464/' class='menu_r'>people</a>
		</div>
		<div class='line'>
			<a href='/id/101/' class='menu_l'>kyb</a>
			<a href='/id/102/' class='menu_r'>hyst</a>
		</div>
		<div class='line'>
			<a href='/id/1478235' class='menu_l'>book</a>
			{if $new_mail eq true}
				<a href='/id/24/' class='menu_r'><i>mail</i></a>
			{else}
				<a href='/id/24/' class='menu_r'>mail</a>
			{/if}
		</div>
		<div class='line'>
			<a href='/id/2024123/' class='menu_l'>k</a>
			<a href='/id/23/' class='menu_r'>last</a>
		</div>
		<div class='line'>
			<a href='/id/21/' class='menu_l'>blogz</a>
			<a href='/id/1058182/' class='menu_r'>forums</a>
		</div>
		<div class='line'>
			<a href='/id/1141959/' class='menu_l'>frz's</a>
			<a href='/id/25/' class='menu_r'>search</a>
		</div>
		<div class='line'>
			<a href='/id/{$user_id}/' class='menu_l'>me</a>
			<a href='/id/{$user_id}/1961033' class='menu_r'>cfg</a>
		</div>
		<br>
		<div class='line'>
			<a href='/id/{$node.node_id}/2' title='nodeshell view'>2</a> |
			<a href='/id/{$node.node_id}/3' title='forum view'>3</a> |
			<a href='/id/{$node.node_id}/14' title='template view'>14</a> |
			<a href='/id/{$node.node_id}/{$node.node_id}' title='selftemplate view'>nd</a>
		</div>
		{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}
			<div class='line'>
				<a href='/id/{$node.node_id}/1961033'>configure</a>
    		</div>
		{/if}
		<div class='line'>
			<a href='/id/1478222' title='templates'>tpl</a> |
			<a href='/id/1548898' title='modules'>mdl</a> |
			<a href='/id/1487381' title='recycle bin'>bin</a>
		</div>
		<br>
		<form enctype="multipart/form-data" action='/id/24/' method='post'>
			<input type='hidden' name='event' value='logout'>
			<input type='submit' value='pakes'>
		</form>
	</div>
</div>

<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div>
<script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>

<div id="body">