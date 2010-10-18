<html>
<head>
<META http-equiv="Default-Style" content="kyberia">
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' title="kyberia" type='text/css' href='/data/templates/own_templates/2227710.tpl'>
<title>{* title.tpl *}{include file="791948.tpl"}</title>
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
		get_id_url = 'http://kyberia.sk/ajax/get_username_by_id.php?name=';
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

<!-- USER MENU PANEL JS -->
<script src='/id/1515428' type='text/javascript'></script>

</head>
<body>
{if $user_id eq true}
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<center>
<a href='/id/1/'>main</a> --
<a href='/id/101/'>kyberia</a> --
<a href='/id/102/'>hysteria</a> --
<a href='/id/19'>bookmarkz</a>[<a href='/id/156968'>v2</a>] --
<a href='/id/24'>posta</a> --
<a href='/id/23'>posledne</a> --
<a href='/id/15'>k NEW</a> / <a href='/id/788016'>CONSCIOUSNESS</a>--
<a href='/id/27'>ludia</a> --
<a href='/id/876611'>senate</a> --
<a href='/id/21'>blogz</a> --
<a href='/id/1058182'>forumz</a> --
<a href='/id/25'>search</a> --
<a href='/id/{$user_id}'>userinfo</a>[<a href='/id/{$user_id}/1961033'>conf</a>]  --
<a href='/id/1017832'>help</a> --
<input type='submit' value='logout' name='event' tabindex='23'>
</center>
</form>
</div><div class="t2"></div>
{/if}
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>

{if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
{if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}
