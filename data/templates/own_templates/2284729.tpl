<html>
<head>
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
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css'
href='/data/css/main.css'>
<title>{$user_id}@{$node.node_name}</title>
</head>
<body>
{if $new_mail eq true}
<div><center><a href='/id/24'><b>kukni si tie {$new_mail}ks posty, posledny/a ti pisal(a) {$new_mail_name}</b></a></center></div>
{/if}
<a href='/id/1/'>r00t</a> ::
<a href='/id/101/'>kyberka</a> ::
<a href='/id/102/'>hysterka</a> ::
<a href='/id/876611/'>spinach</a> ::
<a href='/id/19'>zalozky</a> ::
<a href='/id/24'>ma</a>|<a href='/id/1953327'>il</a> ::
<a href='/id/23'>last</a> ::
<a href='/id/27'>zavislaci</a> ::
<a href='/id/15'>K!</a> ::
<a href='/id/64113'>newsy</a> ::
<a href='/id/21'>blogujeme</a>::
<a href='/id/{$user_id}/stats'>2209</a> ::
<a href='/id/{$user_id}/1961033'>2209_conf</a> ::
{if $user_id eq '2209'}<a href='/id/2284729/1961033'>TPL_conf</a>::{/if}<form enctype="multipart/form-data" action='/id/24/' method='post'><input type='hidden' name='event' value='logout'><input type='submit' value='isc_het' tabindex='23'></form>::<form enctype="multipart/form-data" action='/id/25/' method='post'><input type='text' value='' tabindex='24' name="query"><input type='submit' name='template_event' value='search'></form>