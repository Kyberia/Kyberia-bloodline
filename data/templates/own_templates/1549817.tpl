{get_nodes_by_type  orderby='rand()' vector=$vector type=$type listing_amount=$listing_amount offset=$offset}
{foreach from=$get_nodes_by_type item=child}
{if $type eq 11}
	in node <a href='/id/{$child.node_id}'>{$child.node_id}</a>
     {*get_poll poll=$child*}
     {*include file="modules/show_poll.tpl" get_poll=$get_poll*}
     <br>
{else}
<a href='/id/{$child.node_id}'>{$child.node_name}</a><br>( {$child.login} :: {$child.node_children_count} submissionz)<br><br>
{/if}
{/foreach}
