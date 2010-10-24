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
		<br>
		{*showing bookmark_statistics*}
		{include file="1549386.tpl"}
	</td>
	<!--end of left column-->

	<!--main central column-->
	<td width=66% valign='top'>
		<div>
			<div class='header'>
				<span class='important'><a href='/id/{$node.node_creator}/'>{$node.owner}&#39;s</a> friend <a href='/id/{$node.node_parent}/'>{$node.node_parent_name}</a></span><br />
			</div>
			<br />
			title:: <a href='/id/{$node.node_id}/'>{$node.node_name}</a> comment::<br />
			{$node.node_content|nl2br}
		</div>
		<br />
		<br />
		{if $node.node_creator eq $user_id}
			<form method='post'>
				{if $node.external_link neq 'session://ignore'}
					<input type='submit' name='event' value='ignore'>
				{else}
					<input type='submit' name='event' value='unignore'>
				{/if}
				{if $node.external_link eq 'session://friend'}
					<input type='submit' name='event' value='unfriend'>
				{/if}
			</form>
		{/if}
	</td>
	<!--end of central column-->
</tr></table>
{include file="1549377.tpl"}