<html>
  <head>
    <meta http-equiv="Default-Style" content="kyberia">
    <meta http-equiv="Cache-Control" content="Public">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
    <title>{include file="791948.tpl"}</title>
    <style type="text/css" media='all'>  @import "/id/2052465/"></style>
  </head>
<body>
{if $user_id eq true}
<table border=0>
  <tr>
     <td><img src="http://hysteria.sk/redtime/kyberia/tmpl/azet_logo.gif"></td>
     <td>{include file="1549959.tpl"}</td>
  <tr>
</table>
{/if}

{if $error eq true}
   <center><span class='most_important'>{$error}</span></center>
{/if}
{if $new_mail eq true}
   <center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name} </a></center>
{/if}