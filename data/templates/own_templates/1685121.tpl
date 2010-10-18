{include file="modules/header.tpl"}

<table width=100%>
<tr><td valign='top' width=23%>
{include file="modules/get_mail_userlist.tpl"}
</td>
<td valign='top'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{include file="modules/mailform.tpl"}
{include file="modules/mail.tpl" listing_amount=$listing_amount offset=$offset}
</form>
</td></tr></table>

{include file="modules/footer.tpl"}
