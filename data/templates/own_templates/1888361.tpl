{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}


{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}


{getCreationByTemplateId template_id="4" creator_id=$node.node_creator listing_amount=232323}
{foreach from=$getCreationByTemplateId item=child}
{if $child.node_created|date_format:"%m.%Y" eq "03.2004"}
<div style='float:left;'>{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</div>


<div class='bordered' style='margin-bottom:13px; float:right;'>
   <div class='header' style='text-align:left; padding: 2px; padding-bottom:5px; height:auto;'>
      <a href='/id/{$child.node_id}'>{$child.node_name}</a>  in  <a href='/id/{$child.node_parent}'>{$child.parent_name}</a>
{if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
   </div>

   <div>
     {$child.node_content|truncate:230|stripslashes|escape:"html"}<br />
   </div>
</div>
{/if}
{/foreach}

{/if}