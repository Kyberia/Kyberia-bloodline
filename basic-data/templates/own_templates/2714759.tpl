<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='http://darken.gbas.sk/~toxygen/tox.css'>
<title>kyberia.sk - {$node.node_name}</title>
{if $node.node_name eq 'mail'}
<script>
function vymena() {ldelim}
document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}

function chngto(name,id) {ldelim}
document.formular.mail_to.value = name ;
name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/'
+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
</script>
{/if}
</head>

<body>
<center>

<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'
method='post'>
[
<a href='/id/1/'>main</a> --
<a href='/id/101/'>kyberia</a> --
<a href='/id/102/'>hysteria</a> --
<a href='/id/19'>bookmarkz</a>
]
:
[
<a href='/id/24'>posta</a> --
<a href='/id/23'>posledne</a> --
<a href='/id/27'>ludia</a> --
<a href='/id/21'>blogz</a>
]
:
[
<a href='/id/15'>k NEW</a> / <a href='/id/788016'>CONSCIOUSNESS</a> --
<a href='/id/876611'>senate</a> --
<!--  <a href='/id/20'>clanky</a> ---- -->
<a href='/id/1058182'>forumz</a>
]
:
[
<a href='/id/25'>search</a> --
<a href='/id/{$USER_ID}/1961033'>setup</a> --
<a href='/id/1017832'>help</a>
]
<input type='submit' value='logout' name='event' tabindex='23'>
</form>


</center>
{if $new_mail eq true}
<center><a href='/id/24'><b>New cyber-mejl ({$new_mail}), posledny od
{$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}