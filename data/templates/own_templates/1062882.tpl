<html>
<head>
<script src='/id/1515428' type='text/javascript'></script>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' title="kyberia" type='text/css' href='/data/templates/own_templates/2019722.tpl'>

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
<!-- <center><span align='center' class='most_important'>42</span></center> -->

<!-- here you can realize yourself -->
<center>
<form enctype="multipart/form-data" action='/id/349/' method='post'>
<a href='/id/1/'>main</a><b> || </b>
<a href='/id/101/'>kyberia</a><b> || </b>
<!-- <a href='/id/156968'><b>book's</b></a><b> || </b> -->
<a href='/id/19'>bookmarks</a><b> || </b>
<span align='center' class='most_important'><a href='/id/24'>posta</a></span><b> || </b>
<a href='/id/23'>posledne</a><b> || </b>
<a href='/id/15'>k</a><b> || </b>
<a href='/id/27'>ludia</a><b> || </b>
<!-- <a href='/id/20'>clanky</a> || -->
<a href='/id/21'>denniky</a><b> || </b>
<a href='/id/932514'><b><font color=red>aNg.SaNc</font></b></a><b> || </b>
<a href='/id/25'>search</a><b> || </b>
<a href='/id/349/1961033'>nastavenie</a><b> || </b>
<input type='submit' value='logout' name='event' tabindex='23'>
</center>
</form>

{if $new_mail eq true}
<a href='/id/24'><b><center><span align='center' class='most_important'>u have {$new_mail} new mail,last from {$new_mail_name}</span></center></b></a>
{/if}

{if $error eq true}
{$error}
{/if}
























