<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='http://hysteria.sk/pyxel/kyberia/kazet.css'>
<title>K����-azet - UPOZORNENIE! K-azet od v�s nikdy ne�iada heslo e-mailom ani po�tou. V pr�pade, �e ste obdr�ali tak�to spr�vu, nereagujte na �u.</title>
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
<a href='/id/1/'>K�zet</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/19'>Hlawn� miestnosti</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/24'>r�chla po�ta</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/23'>posledne</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/27'>priatelia a Kazetac���</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/1213404'>FotoAlbumy</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/25'>hlada�(.sk?)</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/1017832'>pom�c</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/{$user_id}/1961033'>m�j profil</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<input type='submit' value='odhl�six z Kazetux' name='event' tabindex='23'>
</form>
</center>
{if $new_mail eq true}
<center><a href='/id/24'> <img src=http://img155.imageshack.us/img155/3008/cybermail0kz.gif border=0> <b>M� nov� r�chl� po�t�, x�x� !</b> <img src=http://img155.imageshack.us/img155/3008/cybermail0kz.gif border=0> </a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}