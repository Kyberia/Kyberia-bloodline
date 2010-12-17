<div class='bordered' style='text-align: center; padding: 5px; width: 662px; wordwrap: break-word'>
<span class='most_important' style='font-size: 15px; letter-spacing: 5px;'>najnovsie prispevky v <a href='/id/64113' style='font-size: 15px; letter-spacing: 5px; font-weight: bolder;'>NEWSLIST</a>e<hr></span>
{get_nodes_by_parent parent=64113 listing_amount=3 offset=0}
{foreach from=$get_nodes_by_parent item=node}
{if $node.external_link neq "session://fook"}
<div style='margin-bottom:13px'>
<div class='header' style='text-align:center; height: 2em'>
<a href='/id/{$node.node_id}'>{$node.node_name}</a> by <a
href='/id/{$node.user_id}'>{$node.login}</a> |{$node.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
</div>
<div style='text-align: left;'>
{$node.node_content|strip_tags|truncate:180|stripslashes}
</div>
</div>
{/if}
{/foreach}
</div>