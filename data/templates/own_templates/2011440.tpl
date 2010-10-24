<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' type='text/css' href='/id/1066289/download'>
<title> {$node.node_name}</title>

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


</head>

<body>
<!-- here you can realize yourself -->
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<a href='/id/1/'>main</a> ----
<a href='/id/2024839/101/'>kyberia</a> ----
<a href='/id/2024839/19'>bookmarks</a> <a href='/id/1999688/156968'>101</a> ----
<a href='/id/2024839/24'>posta</a> ----
<a href='/id/2024839/23'>posledne</a> ----
<a href='/id/2024839/15'>k</a> ----
<a href='/id/2024839/27'>ludia</a> ----
<a href='/id/2024839/20'>clanky</a> ----
<a href='/id/2024839/21'>denniky</a> ----
<a href='/id/2024839/29'>news</a> ----
<a href='/id/2024839/25'>search</a> ----
<a href='/id/1419407/1961033'>nastavenie</a> -----
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</div>
<div class="t2"></div>
{if $new_mail eq true}
<center><a href='/id/1999688/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}

