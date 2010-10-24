<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<!-- bloody white -->
<link rel='stylesheet' type='text/css' href='http://aph.szm.sk/tmp.css'> 

<title>{$node.node_name}</title>

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
<script src='/id/1515428' type='text/javascript'></script>
</head>

<body>
<center>
<div id="dmenu">
<ul>
<li><a href='/id/1496001'>main</a></li>
<li><a href='/id/101'>tree</a></li>
<li><a href='/id/19'>b'marks</a></li>
<li><a href='/id/24'>mail</a></li>
<li><a href='/id/23'>last.subs</a></li>
<li><a href='/id/1058182'>last.forums</a></li>
<li><a href='/id/1432305/'>last.datas</a></li>
<li><a href='/id/15'>K.</a></li>
<li><a href='/id/1569351'>K.text</a></li>
<li><a href='/id/788016'>K.last</a></li>
<li><a href='/id/21'>blogs</a></li>
<li><a href='/id/27'>people</a></li>
<li><a href='/id/1370868'>k3v</a></li>
<li><a href='/id/25/'>search</a></li>
<li><a href='/id/{$user_id}'>self</a></li>
<li><form action='/id/24/' method='post' enctype="multipart/form-data" name="logout_form" id="logout_form"><input type='hidden' name='event' value='logout'><input type='submit' value='°het' tabindex='23'></form></li>
<li>
{if $new_mail eq true}
<a href='/id/24'><span class='most_important'>{$new_mail} new mail</span></a>
{else}
<span class='most_important'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
{/if}
</li>
</ul>
</div>
</center>
<!--
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}
-->

<!-- lets br some to make room for the menu up there -->
<br>
{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}