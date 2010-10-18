{if $header_id neq true}
<html>
<head>
<META http-equiv="Default-Style" content="kyberia">
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' title="kyberia" type='text/css' href='/data/templates/own_templates/2019722.tpl'>

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
{if $user_id eq true}{include file="1549959.tpl"}{/if}
{if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
{if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail, last from {$new_mail_name}</a></center>{/if}
<!--<span class='most_important'>dnes v noci od 23:23 bude niekolko hodin kyberia vypnuta, vdaka za pochopenie</span>-->
{/if}
<!-- USER MENU PANEL -->
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div>
<script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>
