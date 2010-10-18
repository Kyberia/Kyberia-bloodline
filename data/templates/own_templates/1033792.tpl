
{get_nodes_by_type type=10 offset=0 listing_amount=233}
{foreach from=$get_nodes_by_type item=child}
{if $user_id eq $child.node_creator}
<a href='/id/{$child.node_id}'>{$child.node_name}</a> [{$child.node_id}]<br>
{/if}
{/foreach}
<br><br>
<form action='/id/{$node.node_id}' method='post'>
add bookcat::<br>
name::<input type='text' name='node_name'><br>
content::<input type='text' name='node_content'><br>
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='hidden' name='node_system_access' value='public'>
<input type='hidden' name='template_id' value='10'>
<input type='submit' name='event' value='add'>
</form>