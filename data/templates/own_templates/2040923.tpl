<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' type='text/css' href='/id/2040929/download'>
<!--
<link rel='stylesheet' type='text/css' href='http://x86.sk/~acidmilk/shadowrun.css'>
-->

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
<br>

<div style=" background-color: #111; ">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
[<a href='/id/101/' style='header'>101</a>] --
[<a href='/id/19' style='header'>bkmrks</a>] --
[<a href='/id/24' style='header'>mail</a>] --
[<a href='/id/23' style='header'>last</a>] --
[<a href='/id/15' style='header'>k</a>] --
[<a href='/id/788016' style='header'>k2</a>] --
[<a href='/id/27' style='header'>ppl</a>] --
[<a href='/id/21' style='header'>blogs</a>] --
[<a href='/id/25' style='header'>search</a>] --
[<a href='/id/876611' style='header'>senate</a>] --
[<a href='/id/1571388' style='header'>RB@K</a>] --
[<a href='/id/1582474' style='header'>0</a>] --
[<a href='/id/{$user_id}/1961033' style='header'>conf /me</a>] --
[<a href='/id/2040923/1961033' style='header'>conf /header</a>] ----


<input type='submit' value='logout' name='event' tabindex='23'>
</form>



</center>


{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}


</div>


