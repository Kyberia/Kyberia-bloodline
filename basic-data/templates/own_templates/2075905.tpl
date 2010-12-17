<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<title>{if $new_mail eq true}{$new_mail} NEW MAIL ({$new_mail_name}):{/if}{$node.node_name|strip_tags}</title>
<link rel="shortcut icon" href="/id/1459933/download">
<link rel='stylesheet' type='text/css' href='http://outdooractive.info/KR_PZ.css'>

<link rel='stylesheet' type='text/css' href='/id/1126515/download'>
{if $node.node_name eq 'mail'}
<script>
function vymena() {ldelim}
document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase();
document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}
function chngto(name,id) {ldelim}
document.formular.mail_to.value = name;
name = name.toLowerCase();
document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
</script>
{/if}
</head>
<body onload="document.getElementById('krpz').src='/id/1126515/download'">
<form enctype="multipart/form-data" action='/id/24/' method='post'>
<div id="t1">
<a href='/id/1663286/'>my.branch</a> ---
<a href='/id/1/'>1</a> ---
<a href='/id/101/'>101</a> ---

<a href='/id/102/'>hysteria</a> ---
<a href='/id/19/'>bookmarks</a> ---
<a href='/id/24/'>mail</a> ---
<a href='/id/23/'>posledne</a> ---
<a href='/id/27/'>ludia</a> ---

<a href='/id/29/'>news</a> ---
<a href='/id/1569351/'>Karma</a> ---
<a href='/id/21/'>blogs</a> ---
<a href='/id/25/'>search</a> ---

<a href='/id/{$user_id}/1961033'>conf.</a> -----
<input type='hidden' name='event' value='logout'>
<input type='submit' value='logout' tabindex='23'>
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
{/if}
<!-- KR PZ location hack: -->
<img style='position:absolute;top:-1px;left:-1px;width:1px;height:1px' id='krpz' src='' alt=''>