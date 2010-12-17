<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <META http-equiv='Default-Style' content='kyberia'>
   <meta http-equiv='Cache-Control' content='Public'>
    <meta http-equiv='Content-Type' content='text/html; charset=windows-1250'>
     <link rel='stylesheet' title="kyberia" type='text/css' href='/id/2052465/'>
    <title>{include file='791948.tpl'}</title>
     <script> function vymena() {ldelim} document.formular.mail_to.value =
document.formular.mail_to.value.toLowerCase() ; document.images['fricon'].src =
'/images/users/'+document.formular.mail_to.value+'.gif'; {rdelim} function
chngto(name,id) {ldelim} document.formular.mail_to.value = name ; name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/'
+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif'; {rdelim}
</script>
<script src='/id/1515428' type='text/javascript'></script>
<style type='text/css' media='all'> @import '/id/2052465/'; </style>
   </head>
   <body>
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script
language='JavaScript' type='text/javascript'>p =
document.getElementById('panel');</script>
<div class='t1'>
<form enctype='multipart/form-data' action='/id/{$node.node_id}/{if $action neq
false}{$action}{/if}' method='post'>
<center>
<tr>
<td><span class="hm">[:<a href='/id/1'>root</a>-</span></td>
<td><span class="hm"><a href='/id/876611'>senat</a>:]</span></td>
<td><span class="hm">[:<a href='/id/101'>kyberka</a>-</span></td>
<td><span class="hm"><a href='/id/102'>hysterka</a>:]</span></td>
<td><span class="hm">[:<a href='/id/19'>bookmarks</a>-</span></td>
<td><span class="hm"><a href='/id/24'>mail</a>-</span></td>
<td><span class="hm"><a href='/id/23'>last</a>-</span></td>
<td><span class="hm"><a href='/id/27'>people</a>:]</span></td>
<td><span class="hm">[:<a href='/id/25'>search</a>-</span></td>
<td><span class="hm"><a href='/id/{$user_id}'>me</a>-</span></td>
<td><span class="hm"><a href='/id/1017832'>help!</a>-</span></td>
<td><span class="hm"><a href='/id/{$user_id}/1961033'>setup</a>:]</span>
</td>
</tr>
<input type='submit' value='logout' name='event'
tabindex='23'>
</center>
</form>
</div><div class='t2'></div>
    {if $error eq true}<center><span
class='most_important'>{$error}</span></center>{/if}
    {if $new_mail eq true}
     <center><a href='/id/24/' class='mail'>u have {$new_mail} new
mail,last from {$new_mail_name}</a></center>
    {/if}