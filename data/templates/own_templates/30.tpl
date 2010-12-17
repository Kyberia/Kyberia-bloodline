<form method='post'>
<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'</td>
<td><input type='submit' name='get_children_move' value='>'</td>
</tr></table>
</form>

{if $node.node_id eq 30} {get_tiamat all=true}
{else} {get_tiamat node_vector=true} {/if}

	<br><center><span class='important' align='center'>Kaos.It.Self</span></center>
	{foreach from=$get_tiamat item=child }
		<table width='100%' class='bordered'>
			<tr><td><img width=75 src='{get_image_link id=$child.node_id}' align='left' hspace='5' vspace='5' border='0'>
			<a href='/id/{$child.node_id}'>{$child.node_name}</a><br>
<form method='post'><input type='submit' name='event' value='undelete'><input type='hidden' name='undelete_id' value='{$child.node_id}'></form>
			{$child.node_content}
			<br>
<br><i>content destroyed by <a href='/id/{$child.node_destructor}'>{$child.login}</a></i>
			</td></tr>
		</table><br>
	{/foreach}






