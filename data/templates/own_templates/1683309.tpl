{get_movement_params children_count=$node.node_children_count}
{* header *}{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node settings *}
{include file="1549925.tpl"}

{* get_poll_box *}
{include file="1549834.tpl"}
<br>
{*get_bookmark_statistics_box*}
{include file="1549386.tpl"}
</td>

<!--end of left column-->

<!--main central column-->
<td valign='top'>
{*node_content*}
{include file="1549916.tpl"}

<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $permissions.w eq true}
<table>
	<tr><td>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title or keywords::
		<input type='text' name='node_name'>
	</td>
	<td><input type='checkbox' name='no_html' value='yes'><td valign='middle'>&nbsp;NO HTML</td>

</tr></table>

<textarea name='node_content'></textarea>

<table width=666><tr>
<td>

	<input type='submit' name='event' value='add'>
<td>
	<select name='template_id'>
	<option value='2'>nodeshell</option>
	<option value='3'>forum</option>
	<option value='4'>submission</option>
	<option value='5'>article</option>
	<option value='10'>bookcat</option>
	<option value='12'>data</option>
	<option value='14'>template</option>
	<option value='28'>rss_bot</option>
	<option value='1683309'>noudshell</option>
	</select>
</td>

<td><input type='submit' name='template_event' value='preview'>
<td><table><tr>
<td><input type='hidden' name='get_children_offset' value='0'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input class='small' name='listing_amount' type='text' value=''></td>
<td><select name='listing_order'>
<option value='desc'  selected >zozadu :-)</option>
<option value='asc'  >(-: zpredu</option></select></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table></td>

<td align='left'><input type='submit' name='template_event' value='filter_by'>
<td align='left'><select name='search_type'><option value='user'>user</option><option value='content'>content</option>
</select>

<td><input type='hidden' name='node_parent' value='{$node.node_id}'>
</tr>

<tr><td colspan='5' align='center'>
<table><tr><td colspan='5' align='center'>
<input type='submit' name='event' value='delete'>
&nbsp;<input type='submit' name='event' value='set_parent'>::<input type='text' name='new_parent'>
</td></tr></table></td></tr>
</table>

<table align='center'>
<tr>
<td>u have {$user_k}</td>
<td><input type='submit' value='K' name='event'></td>
</tr>
</table>

{/if}
</form>

{* frz's get children *}{include file="1994155.tpl"}

<!--end of central column-->
</td></tr></table>

{* footer *}{include file="1549377.tpl"}