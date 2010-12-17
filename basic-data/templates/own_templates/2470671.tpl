<html>
 <head>
  <META http-equiv="Default-Style" content="kyberia">
   <meta http-equiv="Cache-Control" content="Public">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
    <title>{include file="791948.tpl"}</title>
    <script> function vymena() {ldelim} document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ; document.images['fricon'].src = '/images/users/'+document.form
ular.mail_to.value+'.gif'; {rdelim} function chngto(name,id) {ldelim} document.formular.mail_to.value = name ; name = name.toLowerCase() ; document.images['fricon'].src = '/images/node
s/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif'; {rdelim} </script>
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
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='Jav
aScript' type='text/javascript'>p = document.getElementById("panel");</script>
<script src='/id/1515428' type='text/javascript'></script>
   {if $user_id eq true}{include file="1549959.tpl"} <br>
    <center>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>

<div id='mail_form'>
	To:<INPUT TYPE="text"  id='mail_to' NAME="mail_to" VALUE="" SIZE="10">
	Text:<INPUT TYPE="text"  id='mail_text' NAME="mail_text" VALUE="" SIZE="80">
        {$post_vars.mail_text|escape:"html"}</INPUT>
        <input type='submit' name='event' value='send'>
        <input type='checkbox' name='no_html' value='yes'>&nbsp;NO HTML
{include file="1549888.tpl" listing_amount=3 offset=$offset}
</form>
    </center>
    {/if}
    {if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
    {if $new_mail eq true}
     <center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>
    {/if}

