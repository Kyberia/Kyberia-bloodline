<center> <h3>All nodes with external link 'event://' set</h3><br>
testing version by DarkAural </center>

{get_nodes_by_external_link external_link='event://' listing_amount=all offset=0 orderby=desc}
{foreach from=$get_nodes_by_external_link item=node}

<div class='bordered' style='margin-bottom:13px'>
<div class='header' style='text-align:center; height: 3em'>Node ID: {$node.node_id} Named:
<a href='/id/{$node.node_id}'>{$node.node_name}</a> by ID: <a href='/id/{$node.user_id}'>{$node.login}</a>
<br>&nbsp;&nbsp;{$node.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
</div>
<div>
{$node.node_content|stripslashes|escape:"html"|nl2br}
</div>
</div>
{/foreach}


