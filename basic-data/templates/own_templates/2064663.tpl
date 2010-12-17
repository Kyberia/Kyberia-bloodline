<form enctype="multipart/form-data" action='/id/2064673' method='post' name='formular'>
{if $permissions.w eq true}
<table>
  <tr>
  <td>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title or keywords::
 <input type='text' name='node_name'>
  </td>
  <td>
  <input type='checkbox' name='no_html' value='yes'><td valign='middle'>&nbsp;NO HTML
 </td>
 <!--
 <td>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional data file::<input type='file' name='data_file'>
  &nbsp;{$user_quota}bytez
-->
 </tr>
</table>

 <textarea name='node_content'>{$post_vars.node_content}</textarea> <table width=666>  <tr>  <td>  <input type='submit' name='event' value='add'>  </td>  <td>  <!-- <select name='template_id'>  <option value='4'>submission</option>  <option value='3'>forum</option>  <option value='2'>nodeshell</option>  <option value='8'>friend</option>  </select>  -->  <input type='text' name='template_id' size=5 value='4' title='[submission: 4 | forum: 3 | nodeshell: 2 | article: 5 | data: 12]'>  </td>  <td>  <input type='submit' name='template_event' value='preview'>  </td>  <!--<td>&nbsp;<input type='checkbox' name='between' value='yes'><td valign='middle'>&nbsp;use between</td>-->  <td>  {include file="1549913.tpl"} </td>  <td align='left'>  <input type='submit' name='template_event' value='filter_by'>  </td>  <td align='left'>  <select name='search_type'>  <option value='user'>user</option>  <option value='content'>content</option>  </select>  </td>  <td>  <input type='hidden' name='node_parent' value='{$node.node_id}'>  </td>  </tr>  <tr>  <td colspan='5' align='center'>  {* owner_toolbar *}{include file="1549939.tpl"} </td>  </tr> </table> <div class='add_put'>  <!--&nbsp;<input type='submit' name='event' value='delete'>-->  u have {$user_k} <input type='submit' value='K' name='event' style='margin-right:23px'> <input type='submit' name='event' value='destroy_synapse2'>  <input type='submit' name='event' value='put'> into <select name='nodeshell_id'> {foreach from=$bookmarks key=id item=name}<option value='{$id}'>{$name|strip_tags|truncate:42:"":true}</option>{/foreach} </select> </div> <br>
{if $permissions.w eq true} {* get_node_userlist *}{include file="1549803.tpl"} {/if} {/if}</form>
Prcat