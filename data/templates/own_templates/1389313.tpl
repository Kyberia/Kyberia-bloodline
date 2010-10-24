<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' href='/data/templates/own_templates/2070521.tpl' type='text/css'>
<title>{$node.node_name}|{if $new_mail eq true}{$new_mail} new mail,last from {$new_mail_name}{/if}</title>
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



</head>

<body>
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<a href='#top' style='display:block; height:15px; width:40px; color:#6dae42; border:1px solid; float:left;'>top</a><input type='submit' value='logout' name='event' tabindex='23' style='float:right;'>
<a href='/id/2227639/'><font size="1" color="black">m</font></a>
<a href='/id/1496001'>main</a> ---
<a href='/id/101/'>kyberia</a> ---
<a href='/id/19'>bookmarks</a> ---
<a href='/id/24'>mail</a> ---
<a href='/id/23'>last</a> ---
<a href='/id/15'>k!</a>/<a href='/id/1569351'>k!if</a>/<a href='/id/788016'>k!cc</a> ---
<a href='/id/876611'>senate</a> ---
<a href='/id/27'>people</a> ---
<a href='/id/1058182'>forumz</a> ---
<!-- <a href='/id/20'>clánky</a> --- -->
<a href='/id/21'>blogs</a> ---
<a href='/id/25'>search</a> ---
<a href='/id/1370868'>kev!m</a>/<a href='/id/1370880'>kev!b</a>---
<a href='http://kyberia.sk/chat/chat.htm'>kybchat</a> ---
<a href='/id/{$user_id}'>userinfo</a>
<a href='/id/1389313/1961033'><font size="1" color="black">.</font></a>
</form>
</div>
<div class="t2"></div>
</center>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}
