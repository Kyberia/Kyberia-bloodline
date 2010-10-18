{*header*}{include file="1549864.tpl"}

<table width=100%>
<tr><td valign='top'>
<a
href="javascript:chngto('{$active_friend.login}','{$active_friend.user_id}')">
<img border='0' alt='{$active_friend.login|strip_tags}' width='23' height='23' alt='{$active_friend.login|strip_tags}' src='{get_image_link id=$active_friend.user_id}'></a>[<a href='http://kyberia.sk/id/{$active_friend.user_action_id}'>{$active_friend.user_action|strip_tags}</a>]<br>[{$active_friend.idle_time_minutes}min {$active_friend.idle_time_seconds}sec]
</td></tr>
{/foreach}
{/if}
<tr><td>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{include file="1549897.tpl"}
{include file="1549888.tpl" listing_amount=10 offset=$offset}
</form>


</td>

</tr></table>

{include file="modules/footer.tpl"}<img src="/id/24" width=1 height=1>