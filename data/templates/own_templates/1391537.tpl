{get_movement_params}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
;]
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
<form method='post'>
<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>
</form>
{if $node.node_id eq 23}
{get_last vector=0 listing_amount=$listing_amount offset=$offset}
{else}{get_last listing_amount=$listing_amount offset=$offset}
{/if}

{foreach from=$get_last item=child}
<table>
<tr>
<td width='100' valign='top' rowspan='2'><a href='/id/{$child.node_creator}'><img border=0 hspace='5' src='{get_image_link id=$child.node_creator}'></a>&nbsp;</td>
<td style='width: 100%' valign='top'>
<table width=100%><tr class='header' width=100%>
<td>
parent: <a href='/id/{$child.node_parent}'>{$child.parent_name}</a><br>
author: <a href='/{$child.login}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[lokacia :: <a href='/id/{$child.user_action_id}/'>{$child.user_action}</a>]
{/if}
&nbsp;&nbsp;{$child.node_created|date_format:"%H:%M:%S - %d.%m.%Y"}&nbsp;
<tr><td>{$child.node_content|stripslashes|nl2br|imagestrip}</td></tr>
</table>
</table>
{/foreach}
<!--end of central column-->

</td></tr></table>
{/if}