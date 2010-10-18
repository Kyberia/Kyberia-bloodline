{* header *}{include file="1549864.tpl"}

{if $user_id eq false}
<center>{* loginbox *}{include
file="1549885.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node_settings *}
{include file="1549925.tpl"}

{* get_poll_box *}
{include file="1549834.tpl"}
<br>
{*get_bookmark_statistics_box*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=666 valign='top'>
{*node_content*}
{include file="1549916.tpl"}
{*include file="2072862.tpl"*}
{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq
false}{$action}{/if}'method='post' name='formular'>
{if $permissions.w eq true}{*addnode*}{*include file="1548927.tpl"*}
{if $permissions.w eq true}
<table>
  <tr>
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title or keywords::
      <input type='text' name='node_name'>
    </td>
    <td>
      <input type='checkbox' name='no_html' value='yes'><td
valign='middle'>&nbsp;NO HTML
    </td>
<!--
    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional data file::<input
type='file' name='data_file'>
      &nbsp;{$user_quota}bytez
-->
  </tr>
</table>

<textarea name='node_content'>{$post_vars.node_content}</textarea>

<table width=666>
  <tr>
    <td>
      <input type='submit' name='event' value='add'>
    </td>
    <td>
      <!--
      <select name='template_id'>
      <option value='4'>submission</option>
      <option value='3'>forum</option>
      <option value='2'>nodeshell</option>
      <option value='8'>friend</option>
      </select>
      -->
      <input type='text' name='template_id' size=5 value='4'
title='[submission: 4 | forum: 3 | nodeshell: 2 | article: 5 | data: 12]'>
    </td>
    <td>
      <input type='submit' name='template_event'
value='preview'>
    </td>
    <!--<td>&nbsp;<input type='checkbox' name='between'
value='yes'><td valign='middle'>&nbsp;use between</td>-->

    <td>
      {include file="1549913.tpl"}
    </td>
    <td align='left'>
      <input type='submit' name='template_event'
value='filter_by'>
    </td>
    <td align='left'>
      <select name='search_type'>
        <option value='user'>user</option>
        <option value='content'>content</option>
      </select>
    </td>
    <td>
      <input type='hidden' name='node_parent'
value='{$node.node_id}'>
    </td>
  </tr>
  <tr>
    <td colspan='5' align='center'>

{if $permissions.h eq true or $node.node_creator eq $user_id or $node.node_permission eq 'master'}
<div id='own_toolbar'>
<!--<input type='submit' name='event' value='offtopic'>-->
&nbsp;<input type='submit' name='event' value='set_parent2'>::<input
type='text' name='new_parent'>
</div>{/if}



    </td>
  </tr>
</table>

<div class='add_put'>
   <!--&nbsp;<input type='submit' name='event'
value='delete'>-->
   u have {$user_k} <input type='submit' value='K' name='event'
style='margin-right:23px'>
<input type='submit' name='event' value='destroy_synapse'>
   <input type='submit' name='event' value='put'> into
   <select name='nodeshell_id'>
   {foreach from=$bookmarks key=id item=name}<option
value='{$id}'>{$name|strip_tags|truncate:42:"":true}</option>{/foreach}
   </select>
</div>
<br>
{if $permissions.w eq true}
   {* get_node_userlist *}{include file="1549803.tpl"}
{/if}

{/if}






{/if}
{*get_threaded_children*}{include file="1549839.tpl" children_type=4}
</form>
<!--end of central column-->

</td></tr></table>

{*footer*}{include file="1549377.tpl"}