<html>
 <head>
  <META http-equiv="Default-Style" content="kyberia">
   <meta http-equiv="Cache-Control" content="Public">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
    <title>{include file="791948.tpl"}</title>
    <script> function vymena() {ldelim} document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ; document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif'; {rdelim} function chngto(name,id) {ldelim} document.formular.mail_to.value = name ; name = name.toLowerCase() ; document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif'; {rdelim} </script>
        <style type="text/css" media='all'>
            @import "/id/2019722/";
{literal}
#panel {
position: absolute;
top: 0px;
left: 0px;
display: none;
z-index: 23;
color: #FFF;
background: #000;
border: 1px solid #6DAE42;
padding: 2px;
margin: 0;
}
#panel .panel_btn {
border: 0;
color: #FFF;
background: transparent;
margin: 0;
padding: 1px 0 1px 0;
}
#panel .panel_btn:hover {
color: #F00;
}
#panel form {
padding: 0;
margin: 0;
}
{/literal}
        </style>
   </head>
   <body>
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>
<script src='/id/1515428' type='text/javascript'></script>
   {if $user_id eq true}{include file="1549959.tpl"} <br>
    <center>
    <form method='post'>
    <table>
     <tr>
      <td><input type='submit' name='event' value='debugging'></td>

      <td> | </td>

      <td><input type='submit' name='event' value='addTemplate'></td>
      <td><input type='text' name='add_template_id' value='{$node.node_id}'></td>

      <td> |</td>

      <td><input type='submit' name='event' value='addEvent'></td>
      <td><input type='text' name='add_event_id' value='{$node.node_id}'></td>

      <td> | </td>

      <td><input type='submit' name='event' value='addPlugin'></td>
      <td><input type='text' name='add_plugin_id' value='{$node.node_id}'></td>

      <td> | </td>

      <td><input type='submit' name='event' value='undelete'></td>
      <td><input type='text' name='undelete_id' value='31337'></td>
     </tr>
    </table>
    </form>
    </center>
    {/if}
    {if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
    {if $new_mail eq true}
     <center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>
    {/if}

