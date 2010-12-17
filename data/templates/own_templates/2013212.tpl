{getCreationByTemplateId template_id="4" creator_id=$node.node_creator listing_ammount=23232323232323323 offset=0}

{foreach from=$getCreationByTemplateId item=child}

<div class='bordered' style='margin-bottom:13px'>
<div class='header' style='text-align:center; height: 3em'>
<a href='/id/{$child.node_id}'>{$child.node_name}</a> in <a href='/id/{$child.node_parent}'>{$child.parent_name}</a> {if $child.user_action neq false} [lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]{/if}
<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
</div>
<div>
{$child.node_content|stripslashes}
</div>
</div>

{/foreach}
