{include file="modules/header.tpl"}
<table align='center' width='100%' cellspacing='0' cellpadding='0'>

{if $action}{get_userlist vector=$action} in vector {$action}
{else}{get_userlist}
{/if}

<tr><td colspan='5' class='important'>friends</td></tr>
<tr>
{foreach name=friends from=$active_friends item=active_friend}
{if $smarty.foreach.friends.iteration is div by 5}</tr><tr>{/if}
<td width='190'>
<table>
<tr><td colspan='2' class='important'>{$active_friend.login}</td></tr>
<tr>
<td><a href='/id/{$active_friend.user_id}/'>
<img border='0' name='{$active_friend.login}' width='50'
height='50' alt='{$node_visitor.login}' src='{get_image_link id=$active_friend.user_id}'></a></td>
<td valign='top'>[<a href='/id/{$active_friend.user_action_id}'>
{$active_friend.user_action}</a>]<br>{$active_friend[3]}min {$active_friend.idle_time_seconds}sec</td>
</tr>
</table>
</td>
{/foreach}
</tr>

<tr><td colspan='5' class='important'>users<br><br></td></tr>
<tr>
{foreach name=users from=$active_users item=active_user}
{if $smarty.foreach.users.iteration is div by 5 }</tr><tr>{/if}
<td width='190'>
<table>
<tr><td colspan='2' align='center' class='important'>{$active_user.login}</td></tr>
<tr>
<td><a href='/id/{$active_user.user_id}/'>
<img border='0' name='{$active_user.login}' width='50' height='50'
alt='{$active_user.login}' src='{get_image_link id=$active_user.user_id}'></a></td>
<td valign='top'>[<a href='/id/{$active_user.user_action_id}'>{$active_user.user_action}</a>]
<br>{$active_user.idle_time_minutes}min {$active_user.idle_time_seconds}sec</td>
</tr>
</table>
</td>
{/foreach}

</td></tr>
</table>
<br><center><img src='http://stats.h-k.sk/kybusers.png' border='0'></center>
{include file="modules/footer.tpl"}


