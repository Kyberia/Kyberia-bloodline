<html>
 <head>
  <META http-equiv="Default-Style" content="kyberia">
   <meta http-equiv="Cache-Control" content="Public">
    <meta http-equiv="Content-Type" content="text/html;
charset=windows-1250">
    <title>{include file="791948.tpl"}</title>
    <script> function vymena() {ldelim} document.formular.mail_to.value =
document.formular.mail_to.value.toLowerCase() ; document.images["fricon"].src =
"/images/users/"+document.formular.mail_to.value+".gif"; {rdelim} function
chngto(name,id) {ldelim} document.formular.mail_to.value = name ; name = name.toLowerCase() ;
document.images["fricon"].src = "/images/nodes/"
+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif'; {rdelim}
</script>
<link rel='stylesheet' type='text/css'href='http://darkaural.wz.cz/white.css'>

   </head>
   <body>
<div class="t1">
<form enctype="multipart/form-data" action="/id/{$node.node_id}/{if $action neq
false}{$action}{/if}" method="post">
<center>
<a href='/id/1/'>main</a> ----
<a href='/id/101/'>kyberia</a> ----
<a href='/id/102/'>hysteria</a> ----
<a href='/id/156968'>bookmarkz</a> ----
<a href='/id/24'>posta</a> ----
<a href='/id/23'>posledne</a> ----
<a href='/id/2024123'>k NEW</a> / <a
href='/id/788016'>CONSCIOUSNESS</a>----
<a href='/id/27'>ludia</a> ----
<a href='/id/876611'>senate</a> ----
<!--  <a href='/id/20'>clanky</a> ---- -->
<a href='/id/21'>blogz</a> ----
<a href='/id/1058182'>forumz</a> ----
<a href='/id/25'>search</a> ----
<a href='/id/{$user_id}/1961033'>setup</a> -----
<a href='/id/1017832'>help</a><br><center>
<input type='submit' value='logout' name='event'
tabindex='23'></center>
</center>
</form>
    <form method='post'>
    <table>
     <center>

     <tr>
      <td><input type='submit' name='event'
value='debugging'></td>

      <td> | </td>

      <td><input type='submit' name='event'
value='addTemplate'></td>
      <td><input type='text' name='add_template_id'
value='{$node.node_id}'></td>

      <td> |</td>

      <td><input type='submit' name='event'
value='addEvent'></td>
      <td><input type='text' name='add_event_id'
value='{$node.node_id}'></td>

      <td> | </td>

      <td><input type='submit' name='event'
value='addPlugin'></td>
      <td><input type='text' name='add_plugin_id'
value='{$node.node_id}'></td>
     </tr></center>
    </table>
    </form>
<hr>

    {if $error eq true}<center><span
class='most_important'>{$error}</span></center>{/if}
    {if $new_mail eq true}
     <center><a href='/id/24/' class='mail'>u have {$new_mail} new
mail,last from {$new_mail_name}</a></center>
    {/if}
