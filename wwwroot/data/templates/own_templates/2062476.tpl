{* header *}
{include file="1549864.tpl"}
{if $user_id eq false}
	<center>{* loginbox *}{include file="1549885.tpl"}</center><br><br>
{/if}
<table width='100%' align='center'>
	<th width="760"></th>
	<tr>
		<td valign="top" style="padding-left: 10px; padding-right: 10px; width: 25%;">
			<img src="/images/nodes/6/4/64716.gif">
		</td>
		<td valign="top" style="padding-left: 10px; padding-right: 10px; width: 25%;">
node:	<a href="/id/64716">Blender 3D</a><br />
parent:	<a href="/id/759017">::design::3D::scuplture</a><br />
owner:	<a href="/id/2240">xyzz</a><br />
master:	<a href="/id/1379">juraj</a>, <a href="/id/1538">MARIN</a>
		</td>
		<td valign="top" style="padding-left: 10px; padding-right: 10px; width: 25%;">
			<li><a href='/id/{$node.node_id}/1961036'>neurons</a>
			<li><a href='/id/{$node.node_id}/1961037'>statistics</a>/<a href='/id/64716/748131'>sort</a>
			<li><a href='/id/{$node.node_id}/14'>source</a>
			<li><a href='/id/{$node.node_id}/30'>tiamat</a>
			<li><a href='/id/{$node.node_id}/2'>node view</a>
			<li><a href='/id/{$node.node_id}/3'>normal view</a>
			<li><a href='/id/{$node.node_id}/1961033'>configure</a><br />
			<form action='/id/64716/' method='post'><input type='submit' name='event' value='unbook'>&nbsp;<input type='submit' name='event' value='book'></form>
			<form action='/id/64716/' method='post'><input type='button' name='event' value='K'></form>
			</form>
		</td>
		<td valign="top" style="padding-left: 10px; padding-right: 10px; width: 25%;">
		{* get_poll_box *} {include file="1549834.tpl"}
		</td>
	</tr>
</table>
{* node_content *} {include file="1549916.tpl"}
{* showing form for adding child node *}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $permissions.w eq true}{* addnode *}{include file="1548927.tpl"}{/if}
{* get_threaded_children *}{include file="1549839.tpl" children_type=4}
</form>
<!--end of central column-->
{*footer*}{include file="1549377.tpl"}