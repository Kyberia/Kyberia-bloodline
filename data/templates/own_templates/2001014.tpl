<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' type='text/css' href='/id/2065925'>
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
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>
<center>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<a href='/id/1/'>- main</a> --
<a href='/id/101/'>kyberia</a> --
<a href='/id/102/'>hysteria</a> --
<a href='/id/156968'>bookmarks</a> --
<a href='/id/24'>mail</a> --
<a href='/id/23'>last</a> --
<a href='/id/2024123'>k</a> --
<a href='/id/27'>people</a> --
<!-- <a href='/id/20'>clanky</a> ---- -->
<a href='/id/21'>blogs</a> --
<a href='https://kyberia.sk/chat/chat.htm'>chat</a> --
<!-- <a href='/id/29'>news</a> ---- -->
<a href='/id/25'>search</a> --
<a href='/id/1017832'>help</a> --
<a href='/id/{$user_id}/1961033'>configure</a> ---
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</center>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}

