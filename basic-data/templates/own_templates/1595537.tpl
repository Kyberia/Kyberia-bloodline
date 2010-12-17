<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<!--link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'-->
<!--link rel='stylesheet' type='text/css' href='http://bin.mypage.sk/FILES/easylistening2.css'-->
<link rel='stylesheet' type='text/css' href='/id/2148747'>

<title>{if $new_mail eq true}{$new_mail} m@il from {$new_mail_name} - {/if}{$node.node_name} - {$node.node_id}</title>

{if $node.node_name eq 'mail'}
<script>
function vymena() {ldelim}
document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}

function chngto(name,id) {ldelim}
document.formular.mail_to.value = name ;
name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
</script>
{/if}

<!-- for panels -->
<script src='/id/1515428' type='text/javascript'></script>

</head>

<body>

<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>

<!-- 2 novinky:
- tento template podporuje nove freezyho <a href="/id/2116365">panely</a>.
- 'nastavenia' v liste uz idu naozaj do nastaveni, nie do profilu. -->

<center>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<a href='/id/1/'>main</a> ----
<a href='/id/101/'>kyberia</a> ----
<a href='/id/19'>bookmarks</a> ----
<a href='/id/24'>{if $new_mail eq true}<B><font color=red>!!!</font>{$new_mail} mail, last: {$new_mail_name}</B>{else}
posta{/if}</a> ----
<a href='/chat/chat.htm'>chat</a> ----
<a href='/id/23'>posledne</a> ----
<a href='/id/1569351'>k!</a> + <a href='/id/15'>k!2</a> ----
<a href='/id/27'>ludia</a> ----
<!-- <a href='/id/20'>clanky</a> ---- -->
<a href='/id/21'>denniky</a> ----
<!-- <a href='/id/29'>news</a> ---- -->
<a href='/id/25'>search</a> ----
<a href='/id/1017832'>help</a> ----
<a href='/id/{$user_id}/1961033'>nastavenie</a> -----
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</center>

<!--
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}
-->

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}







