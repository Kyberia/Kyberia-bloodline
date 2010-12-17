{* header *}{include file="1549864.tpl"}
{get_last vector=683643 listing_amount=$listing_amount offset=$offset}
<div style='margin:0 10%'>
<br><br>
{foreach from=$get_last item=child name=autor}
{if $child.template_id eq 2}
<a href='/id/{$child.node_id}'>{$child.node_name}</a>  |
{/if}
{/foreach}
<hr style='margin-bottom:30px; border:1px solid;'>
{foreach from=$get_last item=child name=kniha}
{if $child.template_id eq 12}
<div style='margin-bottom:15px; border-bottom:1px solid #666'>
<a href='/id/{$child.node_id}'>{$child.node_name}</a> in <a href='/id/{$child.node_parent}'>{$child.parent_name}</a><br>
{$child.node_content|truncate:300|strip_tags}
</div>
{/if}
{/foreach}
</div>
{*footer*}{include file="1549377.tpl"}