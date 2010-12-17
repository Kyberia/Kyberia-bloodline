<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='http://hysteria.sk/pyxel/kyberia/kazet.css'>
<title>Káááá-azet - UPOZORNENIE! K-azet od vás nikdy nežiada heslo e-mailom ani poštou. V prípade, že ste obdržali takúto správu, nereagujte na ňu.</title>
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
<a href='/id/1/'>Käzet</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/19'>Hlawné miestnosti</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/24'>rýchla pošta</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/23'>posledne</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/27'>priatelia a Kazetacííí</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/1213404'>FotoAlbumy</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/25'>hladať(.sk?)</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/1017832'>pomóc</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<a href='/id/{$user_id}/1961033'>môj profil</a> <img src=http://img239.imageshack.us/img239/824/kvetynew8lw.gif>
<input type='submit' value='odhlásix z Kazetux' name='event' tabindex='23'>
</form>
</center>
{if $new_mail eq true}
<center><a href='/id/24'> <img src=http://img155.imageshack.us/img155/3008/cybermail0kz.gif border=0> <b>Máš novú rýchlú poštú, xíxí !</b> <img src=http://img155.imageshack.us/img155/3008/cybermail0kz.gif border=0> </a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}