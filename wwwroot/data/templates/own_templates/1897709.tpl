{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}
fylter prispevkov<br>
/1897709 zadajte do adresy za niekoho userinfo vo formate mesiac: mm rok: yyyy<br><br>

<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/1897709'>
mesiac_<input type='text' name='mes' value=''> rok_<input type='text' name='rok' value=''><input type='submit' value='mnoo'>
</form>

{getCreationByTemplateId template_id="4" creator_id=$node.node_creator listing_amount=232323}

{foreach from=$getCreationByTemplateId item=child}
{if $child.node_created|date_format:"%Y" eq $smarty.post.rok && $child.node_created|date_format:"%m" eq $smarty.post.mes}

<div style=''>{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
<div class='bordered' style='margin-bottom:13px; margin-left:90px;'>
   <div class='header' style='text-align:left; padding: 2px; padding-bottom:5px; height:auto;'>
      <a href='/id/{$child.node_id}'>{$child.node_name|escape:"html"}</a>  in  <a href='/id/{$child.node_parent}'>{$child.parent_name|escape:"html"}</a>
{if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
   </div>
   <div>
     {$child.node_content|truncate:230|stripslashes|escape:"html"}
   </div>
</div></div>
{/if}
{/foreach}

<!--end of central column-->

{/if}