<style>
.neukaz {ldelim}color:black{rdelim}
</style>

{get_movement_params children_count=$node.node_children_count}
{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%' id='left-pan'>
{* show node info *}
{include file="1549925.tpl"}

{* showing poll *}
{include file="1549834.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=66% valign='top'>
{*showing node_content*}
{include file="1549916.tpl"}
{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/
{if $action neq false}{$action}{/if}' method='post' name='formular'>

{if $permissions.w eq true}{include file="1548927.tpl"}{/if}

{if $template_event eq 'preview'}
<table>
  <tr>
    <td valign='top' rowspan='2' ><img hspace='5' src='{get_image_link id=$user_id}'></td>
    <td width='100%' valign='top'>
      <table width='100%'>
        <tr class='header'><td align='center'>PREVIEW</td></tr>
        <tr><td>{$post_vars.node_content|preview}</td></tr>
      </table>
</table>
{* end of preview *}
{elseif $template_event eq 'filter_by'}
{get_threaded_children listing_amount=23232322323 offset=$offset types=$children_types search_type=$post_vars.search_type search=$post_vars.node_content}
{elseif $node.node_user_subchild_count eq true}
{get_threaded_children offset=0 link='yes' listing_amount=23232323232 time=$node.last_visit time=$node.last_visit orderby=$listing_order }
<!--<center><span class='most_important'>pozor doslo k zmene funkcnosti systemu, NEW prispevky (vsetky) sa zobrazuju od najstarsieho k najnovsiemu zhora dolu</span></center>-->
{else}
{get_threaded_children link='yes' listing_amount=$listing_amount offset=$offset ordearby=$listing_order}
{/if}
{math equation="x + 16" x=$node.vector_depth assign="nparent"}
{foreach from=$get_threaded_children item=child}
<table width='666'>
  <tr>
{*if $child.node_created > $node.last_visit and $child.depth>$node.vector_depth*}
    <td colspan='3'><a href='/id/{$child.node_parent}'>{$child.node_vector}</a></td>
  </tr>
{*/if*}
  <tr>
    <td width='{math equation="(x-y)-8" x=$child.depth y=$node.vector_depth}%'></td>
    <td valign='top' rowspan='2'>
{* put.Ty hack *}
{if $child.synapse_creator neq ''}
    <img src='{get_image_link id=$child.synapse_creator}' width='50' hspace='5' alt='SYNAPSE CREATOR' />
{else}
    <img src='{get_image_link id=$child.node_creator}' width='50' hspace='5' alt='{$child.login}' onclick="km();sm('{$child.login}','{$child.node_creator}','{$node.node_id}')" />
{/if}
{*end of put.Ty hack *}
    </td>
    <td width='{math equation="100-(x-y)" x=$child.depth y=$node.vector_depth}%'>
      <table class='bordered' width='100%'><tr class='header'>
        <td>
          &nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
{if $child.user_action neq false}
          &nbsp;[lokacia :: <a href='/{$child.user_actions}/'>{$child.user_action}</a>]
{/if}
&nbsp;&nbsp;<input type='checkbox' value='{$child.node_id}' name='node_chosen[]'>
&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
{if $child.node_updated} (modif: {$child.node_updated|date_format:"%d.%m.%Y. - %H:%M:%S"}){/if}
{if $child.k > 0} [<span class='most_important'>{$child.k}K</span>] {/if}
{if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
{if $child.node_status eq 'linked'}
&nbsp;<span class='most_important'>HARDLINK</span>
{/if}
{if $child.node_updated > $node.last_visit}<span class='most_important'>!!CONTENT CHANGED!!</span>{/if}
{if $bookmarks.last_visit eq true and $child.lastdescendant_created > $bookmarks.last_visit}<span class='most_important'>!!NEW DESCENDANT!!</span>{/if}


<div style='text-align:center;'>
{if $child.node_name eq ''}
<a href='/id/{$child.node_id}'>enter node {$child.node_id}</a>
{else}
<a href='/id/{$child.node_id}'>{$child.node_name}</a>
{/if}
{if $child.node_creator eq $user_id}| <a href='/id/{$child.node_id}/1961033'>conf</a>{/if}
</div></td></tr>
<tr><td>{if $child.depth eq $nparent}<span class='neukaz'>{$child.node_content|stripslashes|nl2br}</span>{else}{$child.node_content|stripslashes|nl2br}{/if}</td></tr>
</table></td></tr>
</table>

<br>
{/foreach}

<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>

</form>
<!--end of central column-->

</td></tr></table>

{include file="1549377.tpl"}