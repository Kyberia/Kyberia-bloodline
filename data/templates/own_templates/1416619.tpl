{include file="1549864.tpl"}


{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr valign='top'><td width="20%">

{get_userlist}
<!--left column-->
<span class='important'>friendz</span>
<table style="border-bottom:1px solid #333;"><tr><td>
{foreach name=friends from=$active_friends item=active_friend}
<div style=" clear:left; margin-bottom:15px">
<a href='/id/{$active_friend.user_id}/' style="float:left;">
<img width='23' height='23' alt='{$node_visitor.login}' src='{get_image_link id=$active_friend.user_id}' border='0'></a></font>
 {$active_friend.login}
[<a href='/id/{$active_friend.user_action_id}'>{$active_friend.user_action|strip_tags}</a></b>] {$active_friend.idle_time_minutes}m {$active_friend.idle_time_seconds}s
</div>
{/foreach}
</td></tr></table><br><br><br>


<span class='important'>random forumz</span><br><br>
{include file="modules/get_nodes_by_type_small.tpl" type=3 listing_amount=10}
<br><br>
<span class='important'>data</span><br><br>
{include file="modules/get_nodes_by_type_small.tpl" type=12 listing_amount=10}
<br>


<span class='important'>pplz</span>
<table width='100' class='header'><tr><td>
{foreach name=users from=$active_users item=active_user}
<div style=" float:left; margin-bottom:15px">
<a href='/id/{$active_user.user_id}/' style="float:left;">
{$active_user.login}</a></b></font>|
<a href='/id/{$active_user.user_action_id}'>{$active_user.user_action|strip_tags}</a>
{$active_user.idle_time_minutes}m {$active_user.idle_time_seconds}s
</div>
{/foreach}
</td></tr></table>
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
<!--<br />
<form method='post'><br />
<table align='center'><tr><br />
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td><br />
<td><input type='submit' name='get_children_move' value='<'></td><br />
<td><input type='submit' name='get_children_move' value='<<'></td><br />
<td><input name='get_children_move' type='submit' value='>>'></td><br />
<td><input type='submit' name='get_children_move' value='>'></td><br />
</tr></table><br />
</form><br />
-->

<span class='important'>last submissions</span><br>

<form method='post'>
<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>
</form>

{*get_last vector=0 listing_amount=$listing_amount offset=$offset*}
{get_last listing_amount=$listing_amount offset=$offset}

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












