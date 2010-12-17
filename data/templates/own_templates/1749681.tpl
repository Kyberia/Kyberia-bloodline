<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' href='/id/1745749/download' type='text/css'>
<title>{* title.tpl *}{include file="791948.tpl"}|{if $new_mail eq true}{$new_mail} new mail,last from {$new_mail_name}{/if}</title>

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
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<a href='#top' style='display:block; height:15px; width:40px; color:#FD00B3; border:1px solid; float:left;'>top</a><input type='submit' value='logout' name='event' tabindex='23' style='float:right;'>
<a href='/id/1389313/1961033'><font size="1" color="black">.</font></a>
<a href='/id/1'>main</a> ---

<a href='/id/101/'>kyberia</a> ---
<a href='/id/1669447'>bookmarks</a> ---
<a href='/id/24'>mail</a> ---
<a href='/id/1462783'>last</a> ---
<a href='/id/15'>k!</a> ---

<a href='/id/1569351'>noimg-k!</a> ---
<a href='/id/27'>people</a> ---
<!-- <a href='/id/20'>články</a> --- -->
<a href='/id/21'>blogs</a> ---
<a href='/id/25'>search</a> ---

<a href='/id/1370868'>kev-main</a> ---
<a href='/id/1370880'>kev-bookmarks</a> ---
<a href='/id/15/01370868'>kev-k!</a> ---
<a href='/id/{$user_id}'>userinfo</a>
<a href='/id/1389313/1961033'><font size="1" color="black">.</font></a>
</form>

</div>
<div class="t2"></div>
</center>
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}