{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}

<center>{* loginbox *}{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node settings *}
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


{getCreationByTemplateId template_id="10" creator_id=$node.node_creator}

{foreach from=$getCreationByTemplateId item=child}


<div class='bordered' style='margin-bottom:13px'>
   <div class='header' style='text-align:center; height: 3em'>
      <a href='/id/{$child.node_id}'>{$child.node_name}</a>  in  <a href='/id/{$child.node_parent}'>{$child.parent_name}</a> {if $child.user_action neq false} [lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]{/if}
   <br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}

   </div>
   <div>
     {$child.node_content|truncate:230|stripslashes}
   </div>
</div>

{/foreach}

<!--end of central column-->

</td></tr></table>

{/if}
{* footer *}{include file="1549377.tpl"}