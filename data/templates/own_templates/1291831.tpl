<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' type='text/css' href='http://freezy.wnet.sk/kyberia/green.css'>

<title>{if $new_mail eq true}{$new_mail} mail from {$new_mail_name} & {/if}in: {$node.node_name}</title>
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
<!-- here you can realize yourself -->
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<a href='/id/1/'>main</a> ~
<a href='/id/101/'>kyberia</a> ~
<a href='/id/19'>bookmarks</a> ~
<a href='/id/24'>post</a> ~
<a href='/id/23'>latest</a> ~
<a href='/id/15'>k!</a> ~
<a href='/id/27'>people</a> ~
<a href='/id/21'>blogs</a> ~
<a href='/id/29'>news</a> ~
<a href='/id/25'>search</a> ~
<a href='/id/1017832'>help</a> ~
<a href='/id/{$user_id}/configure'>configure</a> ~
 <input type='submit' value='logout' name='event' tabindex='23'>
 </form>
</div>
 <div class="t2"></div>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}