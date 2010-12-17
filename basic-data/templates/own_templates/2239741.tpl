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
document.images['fricon'].src =
'/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
}
}
xmlhttp.send(null);
}

function chngto(name,id) {
document.formular.mail_to.value = name ;
name = name.toLowerCase() ;
document.images['fricon'].src =
'/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
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
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/2088188.tpl' media='handheld'>
<link rel='stylesheet' type='text/css' href='/id/2088188'
media='screen'>
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/2088188.tpl'
media='handheld'>

<!-- TITLE -->
<title>
{if $new_mail eq true}
{$new_mail} m@il | {$new_mail_name}
{/if}
{include file="791948.tpl"}
</title>


</head>
<body>
<div class="t1">
<center>
<form method='post'>
<!-- Menu ponuka -->
<a href='http://www.google.sk/advanced_search?hl=sk' target="blank">[Google]</a>:[
<a href='/id/101'>K</a>.
<a href='/id/102'>H</a>.
<a href='http://www.hysteria.sk'>H*o</a>][
<a href='/id/1'>Main</a>][
<a href='/id/19'>BooKmarkZ</a>
<a href='/id/1478235'>BOOK</a>][
<a href='/id/24'>PostA</a>][
<a href='/id/23'>LasT</a>][
<a href='/id/27'>&#1258;</a>]&#9474;[
<a href='/id/876611'>SeNaT</a>][
<a href='/id/25'>SearCh</a>][
<a href='/id/1017832'>help</a>][
<a href='/id/{$user_id}'>UserS</a>][
<a href='/id/{$user_id}/1961033'>SetUP</a>]
<input type='submit' value='logout' name='event'
tabindex='23'>
</form>
</center>
</div>

<!-- MAIL & ERROR -->
{if $new_mail eq true}
<div class='most_important'><center>
<a href='/id/24' class='mail'><b>u have {$new_mail} new mail last from
{$new_mail_name2}</b></a>
</center></div>
{/if}

{if $error eq true}
<div class='most_important'><center>{$error}</center></div>
{/if}


<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div>
<script language='JavaScript' type='text/javascript'>p =
document.getElementById("panel");</script>
<br>
<div id="body">