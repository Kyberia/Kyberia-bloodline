<link rel='stylesheet' type='text/css' href='/id/1625480/download'> <title> {$node.node_name}</title> {if $node.node_name eq 'mail'} <script> function vymena() {ldelim} document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ; document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif'; {rdelim} function chngto(name,id) {ldelim} document.formular.mail_to.value = name ; name = name.toLowerCase() ; document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif'; {rdelim} </script> {/if} </head> <body> <!-- here you can realize yourself --> <div class="t1"> <form enctype="multipart/form-data" action='/id/{$user_id}/' action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>

<a href='/id/1'>main</a> ----
<a href='/id/101'>kyberia</a> ----
<a href='/id/1058182'>forums</a> ----
<a href='/id/19'>bookmarks</a> ----
<a href='/id/683643'>kinznica</a> ----
<a href='/id/24'>posta</a> ----
<a href='/id/23'>posledne</a> ----
<a href='/id/15'>k</a> ----
<a href='/id/27'>ludia</a> ----
<a href='/id/21'>denniky</a> ----
<a href='/id/25'>search</a> ----

<a href='/id/{$user_id}/1961033'>nastavenie</a> -----

<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</div>
<div class="t2"></div>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}
