<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<!--
YOU CAN PUT YOUR OWN CSS SKIN HERE!!!
<link rel='stylesheet' type='text/css' href='/data/css/zabke.css'>
-->
<link rel='stylesheet' type='text/css' href='/data/css/zabke.css'>
<style>
#menu.a
{
 background:#ababab;
}
</style>
<title>kwak</title>
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
<center><span align='center' class='most_important'>23</span></center>

<!-- here you can realize yourself -->

<center>
<div id="menu">
<a href='/id/1/'>main</a> ----
<a href='/id/101/'>kyberia</a> ----
<a href='/id/19'>bookmarks</a> ----
<a href='/id/24'>posta</a> ----
<a href='/id/23'>posledne</a> ----
<a href='/id/15'>k</a> ----
<a href='/id/27'>ludia</a> ----
<!-- <a href='/id/20'>clanky</a> ---- -->
<a href='/id/21'>denniky</a> ----
<a href='/id/29'>news</a> ----
<a href='/id/25'>search</a> ----
<a href='/id/1017832'>ZACINAME S KYBERIOU</a> ----
<a href='/id/{$user_id}/configure'>nastavenie</a> -----
</div>
<input type='submit' value='logout' name='event' tabindex='23'>

</center>
</form>
