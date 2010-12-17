{* header *}{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center> {* loginbox *}{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node_settings *}{include file="1549925.tpl"}

</td>
<!--end of left column-->

<td valign='top'>
{include file="1549913.tpl"}
{get_movement user_id=$node.node_id offset=$offset listing_amount=$listing_amount}
{foreach from=$get_movement item=movement}
	<a href='/id/{$movement.node_id}'>{$movement.node_name}</a>
&nbsp;({$movement.last_visit|date_format:"%d.%m.%Y. - %H:%M:%S"})<br>
{/foreach}
</td>

<!--end of central column-->

</td></tr></table>
{/if}

{* footer *}{include file="1549377.tpl"}

