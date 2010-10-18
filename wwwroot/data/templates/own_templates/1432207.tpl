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

{* include file="modules/get_threaded_children.tpl" children_type=4 *}

{if $template_event eq 'preview'}
<div class='sub{$user_id}' style='margin-top: 10px;'>
  <img width='50' hspace='5' src='{get_image_link id=$user_id}' alt='' style='float:left; margin-right:5px;' class='icon' />
  <div class='th_header' style='background:#333; margin-left: 55px;'>
    PREVIEW
  </div>
  <div class='th_content' style='margin-top: 5px; margin-left: 55px;'>
    {$post_vars.node_content|preview}
  </div>
</div>
{* end of preview *}

{elseif $template_event eq 'filter_by'}
{get_threaded_children listing_amount=23232322323 offset=$offset types=$children_types search_type=$post_vars.search_type search=$post_vars.node_content}
{elseif $user_id neq true}
{get_threaded_children offset=0 listing_amount=232 orderby="asc"}
{elseif $node.node_user_subchild_count eq true}
{get_threaded_children offset=0 listing_amount=232 time=$node.last_visit time=$node.last_visit orderby=$listing_order types=$children_types}

{else}
{get_threaded_children listing_amount=$listing_amount offset=$offset types=$children_types orderby=$listing_order}
{/if}

{*get_linked_nodes time_1=$time_1 time_2=$time_2 orderby=$listing_order*}
{if $user_id neq true}
{merge_arrays array1=$get_threaded_children array2=$get_linked_nodes sort_by='thread' orderby="asc"}
{else}
{merge_arrays array1=$get_threaded_children array2=$get_linked_nodes sort_by='thread' orderby=$listing_order}
{/if}

{foreach from=$merged item=child}
{if $child.template_id eq 11}
{get_poll poll=$child}
{include file="modules/show_poll.tpl" get_poll=$get_poll}
<br>
{else}
{math equation="(x-y)-8" x=$child.depth y=$node.vector_depth assign="oover"}
<div class='sub{$user_id}' style='margin-top: 5px; width:666px;'>
  {*if $child.node_created > $node.last_visit and $child.depth>$node.vector_depth*}
  <a href='/id/{$child.node_parent}' class='vector'>{$child.node_vector}</a>
  {*/if*}
  <div class='th_cnt' style='margin-left: {math equation="(x-y)-8" x=$child.depth y=$node.vector_depth}%;'>
    {* put.Ty hack *}
    {if $child.synapse_creator neq ''}
    <img src='{get_image_link id=$child.synapse_creator}' width='50' alt='SYNAPSE CREATOR' style='float:left; margin-right:5px;' class='icon' />
    {else}
    <img src='{get_image_link id=$child.node_creator}' width='50' alt='{$child.login}' style='float:left; margin-right:5px;' class='icon' onclick="km();sm('{$child.login}','{$child.node_creator}','{$node.node_id}')" />
    {/if}
    {*end of put.Ty hack *}
    <div class='bordered' style='margin-left: 55px; padding:2px; overflow:visible; {if $oover > 50} width:500px;{/if}'>
      <div class='th_header'>
        &nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
        {if $child.user_action neq false}
        &nbsp;[lokacia :: <a href='/{$child.user_actions}/'>{$child.user_action}</a>]
        {/if}
        &nbsp;&nbsp;<input type='checkbox' value='{$child.node_id}' name='node_chosen[]'>
        &nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
        {if $child.node_updated}
        (modif: {$child.node_updated|date_format:"%d.%m.%Y. - %H:%M:%S"})
        {/if}
        {if $child.k > 0}
        [<span class='most_important'>{$child.k}K</span>]
        {/if}
        {if $child.node_created > $node.last_visit}
        <span class='most_important'>&nbsp;&nbsp;NEW</span>
        {/if}
        {if $child.node_status eq 'linked'}
        &nbsp;<span class='most_important'>HARDLINK</span>
        {/if}
        {if $child.node_updated > $node.last_visit}
        <span class='most_important'>!!CONTENT CHANGED!!</span>
        {/if}
        {if $bookmarks.last_visit eq true and $child.lastdescendant_created > $bookmarks.last_visit}
        <span class='most_important'>!!NEW DESCENDANT!!</span>
        {/if}

        <div style='text-align:center;'>
          {if $child.node_name eq ''}
          <a href='/id/{$child.node_id}'>enter node {$child.node_id}</a>
          {else}
          <a href='/id/{$child.node_id}'>{$child.node_name}</a>
          {/if}
          {if $child.node_creator eq $user_id}
          | <a href='/id/{$child.node_id}/1961033'>conf</a>
          {/if}
        </div>
      </div>
      <div class='th_content' style='margin-top: 5px;'>
        {$child.node_content|stripslashes|nl2br}
      </div>
    </div>
  </div>
  <br style='clear:left'>
</div>
{/if}
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