<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<title>{if $new_mail eq true}{$new_mail} NEW MAIL ({$new_mail_name}):{/if}{$user_id}@{$node.node_name}.kyberia.sk</title>
<link rel='shortcut icon' href='http://outdooractive.info/kyb/shortcut.ico'>
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/1126515.tpl'>
{if $node.node_name eq 'mail'}
<script language="JavaScript" type="text/javascript">
<!--
{literal}
function vymena() {
 document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase();
 var browser = navigator.appName;
 if(browser == "Microsoft Internet Explorer") {
  xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
 } else {
  xmlhttp = new XMLHttpRequest();
 }
 get_id_url = '/ajax/get_username_by_id.php?name=';
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
 document.formular.mail_to.value = name;
 name = name.toLowerCase();
 document.images['fricon'].src = '/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
}
{/literal}
-->
</script>
{/if}
<script src='/data/templates/own_templates/1515428.tpl' type='text/javascript'></script>
</head>
<body>
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div>
<script type='text/javascript'>p=document.getElementById("panel")</script>
<form enctype="multipart/form-data" action='/id/24/' method='post'>
<div id="t1">
<a href='/id/1/'>r00t</a> ---
<a href='/id/101/'>kyberia</a> ---
<a href='/id/102/'>hystóryja</a> ---
<a href='/id/876611'>špenát</a> ---
<a href='/id/19/'>bookmarks</a> ---
<a href='/id/24/'>mail</a> ---
<a href='/id/23/'>last</a> ---
<a href='/id/27/'>ppl</a> ---
<a href='/id/29/'>news</a> ---
<a href='/id/1569351/'>K</a> ---
<a href='/id/21/'>blogs</a> ---
<a href='/id/25/'>search</a> ---
{if $user_id eq 660}
<a href='/id/1127587/1961033'>tpl_edit</a> ---
{/if}
<a href='/id/{$user_id}/1961033'>{$user_id}_conf</a> -----
<input type='hidden' name='event' value='logout'>
<input type='submit' value='isc het' tabindex='23'>
{if $new_mail eq true}
<br>
<strong><a href="/id/24">u have {$new_mail} new mail,last from</a> <a href="/{$new_mail_name}" style="color:red">{$new_mail_name}</a></strong>
{/if}
{if $error eq true}
{$error}
{/if}
</div>
<div id="corr"></div>
</form>
{if $node.node_name eq 'bookmarks'}
<div id="adv"></div>
<div class="nic"></div>
{/if}
