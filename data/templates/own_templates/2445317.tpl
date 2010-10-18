<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' type='text/css' href='/id/2444289/download'>
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



</head>

<body>
<center>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<a href='/id/1/'>:main:</a> <b>--</b>
<a href='/id/101/'>:kyberia:</a> <b>--</b>
<a href='/id/102/'>:hysteria:</a> <b>--</b>
<a href='/id/19'>:bookmarks:</a> <b>--</b>
<a href='/id/24'>:mail:</a> <b>--</b>
<a href='/id/23'>:last:</a> <b>--</b>
<a href='/id/15'>:k!arma:</a> <b>--</b>
<a href='/id/27'>:people:</a> <b>--</b>
<a href='/id/21'>:blogs:</a> <b>--</b>
<a href='/id/876611'>:senat:</a> <b>--</b>
<a href='/id/25'>:search:</a> <b>--</b>
<a href='/id/{$user_id}/1961033'>:cfg:</a> <b>--</b>
<a class="important" href='/id/1017832'>:help:</a> <b>--</b>
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</center>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}