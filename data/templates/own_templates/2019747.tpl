vyvolanie get_node_commanders : {get_node_commanders}<br /><br />
echo masters : {$masters}<br /><br />

vyvolanie get_node_commanders2 : {get_node_commanders2}<br /><br />
echo masters : {foreach from=$get_node_commanders2.master item=one}
{$one}
{/foreach}
