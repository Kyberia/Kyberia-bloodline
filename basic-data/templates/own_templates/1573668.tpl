{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{include file="1549925.tpl"}

{* showing poll *}
{*include file="1549834.tpl"*}
<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>

<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/1573668' style='margin:1em 0'> mesiac_<input type='text' name='mes' value=''>
rok_<input type='text' name='rok' value=''>
<input type='submit' value='mnoo'>
<div style='margin-top:1em'>[ format mesiac: mm rok: yyyy ]</div>
</form>

{if $smarty.post.rok && $smarty.post.mes eq true}

{getCreationByTemplateId template_id="4" creator_id=$node.node_id listing_amount=232323}

{foreach from=$getCreationByTemplateId item=child}
{if $child.node_created|date_format:"%Y" eq $smarty.post.rok && $child.node_created|date_format:"%m" eq $smarty.post.mes}

<div style=''>{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
<div class='bordered' style='margin-bottom:13px; margin-left:90px;'>
   <div class='header' style='text-align:left; padding: 2px; padding-bottom:5px; height:auto;'>
      <a href='/id/{$child.node_id}'>{$child.node_name|escape:"html"}</a>  in  <a href='/id/{$child.node_parent}'>{$child.parent_name|escape:"html"}</a>
{if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
<!-- $child.node_created: {$child.node_created}, $node.last_visit: {$node.last_visit} -->
   </div>
   <div>
     {$child.node_content|truncate:230|stripslashes|escape:"html"}
   </div>
</div></div>
{/if}
{/foreach}

{else}
{getCreationByTemplateId template_id="4" creator_id=$node.node_id listing_amount=$listing_amount offset=$offset}

{foreach from=$getCreationByTemplateId item=child}

<div class='bordered' style='margin-bottom:13px'>
   <div class='header' style='text-align:center;padding:2px;'>
      <a href='/id/{$child.node_id}'>{$child.node_name|strip_tags}</a>  in  <a href='/id/{$child.node_parent}'>{$child.parent_name|strip_tags}</a> {if $child.user_action neq false} [lokacia :: <a href='/{$child.user_action}/'>{$child.user_action|strip_tags}</a>]{/if}
      <br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
      {if $child.k > 0} [<span class='most_important'>{$child.k}K</span>] {/if}
      {if $child.lastdescendant_created  > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
<!-- $child.lastdescendant_created: {$child.lastdescendant_created}, $child.last_visit: {$child.last_visit} -->
   </div>
   <div>
      {$child.node_content|truncate:230|stripslashes|strip_tags:false|imagestrip}
   </div>
</div>
{/foreach}
{/if}
<!--end of central column-->
<form method='post'> <table align='center'><tr> <td><input type='hidden' name='get_children_offset' value='{$offset}'></td> <td><input type='submit' name='get_children_move' value='<'></td> <td><input type='submit' name='get_children_move' value='<<'></td> <td><input name='get_children_move' type='submit' value='>>'></td> <td><input type='submit' name='get_children_move' value='>'></td> </tr></table> </form>
</td></tr></table>
{/if}





