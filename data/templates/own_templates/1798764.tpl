<html>
 <head>
  <META http-equiv="Default-Style" content="kyberia">
   <meta http-equiv="Cache-Control" content="Public">
    <meta http-equiv="Content-Type" content="text/html;
charset=windows-1250">
    <title>{include file="791948.tpl"}</title>
    <script> function vymena() {ldelim} document.formular.mail_to.value =
document.formular.mail_to.value.toLowerCase() ; document.images['fricon'].src =
'/images/users/'+document.formular.mail_to.value+'.gif'; {rdelim} function
chngto(name,id) {ldelim} document.formular.mail_to.value = name ; name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/'
+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif'; {rdelim}
</script>
        <style type="text/css" media='all'>
            @import "/id/2019722/";
        </style>
   </head>
   <body>
   {if $user_id eq true}{include file="1549959.tpl"} <br>
    {/if}
    {if $error eq true}<center><span
class='most_important'>{$error}</span></center>{/if}
    {if $new_mail eq true}
     <center><a href='/id/24/' class='mail'>u have {$new_mail} new
mail,last from {$new_mail_name}</a></center>
    {/if}
