{get_nodes_by_external_link listing_amount=2323666 offset=$offset external_link='db://user'}

<div style="width:800px; margin: auto; ">
{foreach from=$get_nodes_by_external_link item=child}


<div style="float: left; width: 200px; text-align:center;"><a href="/id/{$child.node_id}">{$child.node_name}</a>::<a href="/id/{$child.node_id}/4">4</a></div>

{/foreach}

</div>



