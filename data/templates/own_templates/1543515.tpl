<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' type='text/css' href='http://www.ianus.sk/aspecial/ianus-001.css'>
<title>{$node.node_name}</title>
<script src='/id/1515428' type='text/javascript'></script>
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
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>
<div class='pageheader'>
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post' class="pageheaderform">
<a href='/id/1/'>&nbsp;main&nbsp;</a>::::
<a href='/id/101/'>&nbsp;kyberia&nbsp;</a>::::
<a href='/id/19'>&nbsp;bookmarks&nbsp;</a>::::
<a href='/id/24'>&nbsp;posta&nbsp;</a>::::
<a href='/id/23'>&nbsp;posledne&nbsp;</a>::::
<a href='/id/15'>&nbsp;k&nbsp;</a>::::
<a href='/id/27'>&nbsp;ludia&nbsp;</a>::::
<a href='/id/21'>&nbsp;denniky&nbsp;</a>::::
<a href='/id/25'>&nbsp;search&nbsp;</a>::::
<a href='/id/1017832'>&nbsp;help&nbsp;</a>::::
<a href='/id/313'>&nbsp;ianus&nbsp;</a>::::
<a href='/id/313/1961033'>&nbsp;nastavenie&nbsp;</a>:::: ::::
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</div>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}