<html>
 <head>
  <META http-equiv='Default-Style' content='kyberia'>
   <meta http-equiv='Cache-Control' content='Public'>
    <meta http-equiv='Content-Type' content='text/html;
charset=windows-1250'>
    <title>{include file='791948.tpl'}</title>
    <script> function vymena() {ldelim} document.formular.mail_to.value =
document.formular.mail_to.value.toLowerCase() ; document.images['fricon'].src =
'/images/users/'+document.formular.mail_to.value+'.gif'; {rdelim} function
chngto(name,id) {ldelim} document.formular.mail_to.value = name ; name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/'
+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif'; {rdelim}
</script>
<script src='/id/1515428' type='text/javascript'></script>
<style type='text/css' media='all'>
            @import '/id/2019722/';
        </style>

   </head>
   <body>
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script
language='JavaScript' type='text/javascript'>p =
document.getElementById('panel');</script>
<div class='t1'>
<form enctype='multipart/form-data' action='/id/{$node.node_id}/{if $action neq
false}{$action}{/if}' method='post'>
<center>
<a href='/id/1'>main</a> ----
<a href='/id/101'>kyberia</a> ----
<a href='/id/102'>hysteria</a> ----
<a href='/id/19'>bookmarks</a> ----
<a href='/id/24'>posta</a> ----
<a href='/id/23'>last</a> ----
<a href='/id/1'>K</a> ----
<a href='/id/876611'>senate</a> ----
<a href='/id/19'>blogz</a> ----
<a href='/id/1058182'>forumz</a> ----
<a href='/id/25'>search</a> ----
<a href='/id/25'>search</a> ----
<a href='/id/{$user_id}/1961033'>setup</a> -----
<a href='/id/1017832'>help</a> ----
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