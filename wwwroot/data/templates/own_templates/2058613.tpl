My written blogz:
{get_nodes_by_parent parent=21 listing_amount=2323232 offset=$offset}
{foreach from=$get_nodes_by_parent item=child}
{if $child.node_creator eq 1342}
<a href='/id/{$child.node_id}'>{$child.node_name}</a> |||
{/if}
{/foreach}