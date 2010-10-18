{*header*}{include file="1549864.tpl"}
<table width=100%>
<tr><td valign='top'>
{*friends*}
<table cellspacing="0" cellpadding="0">
{get_userlist}
<b><center><font size=1>friends</font></center></b>
{if $active_friends eq true}
{foreach from=$active_friends item=active_friend}
<tr><td width="100%" valign="top" align="left">
<a href='http://kyberia.sk/id/{$active_friend.user_id}/' title='{$active_friend.login|strip_tags}'>
<img border='0' alt='{$active_friend.login|strip_tags}' width='23' height='23' alt='{$node_visitor.login|strip_tags}' src='{get_image_link id=$active_friend.user_id}'></a>[<a href='http://kyberia.sk/id/{$active_friend.user_action_id}'>{$active_friend.user_action|strip_tags}</a>]<br>[{$active_friend.idle_time_minutes}min {$active_friend.idle_time_seconds}sec]
</td></tr>
{/foreach}
{/if}
<tr><td>
<br>
<b><center>users on.line</center></b>
{foreach from=$active_users item=active_user}
<center><a href='http://kyberia.sk/id/{$active_user.user_id}'>{$active_user.login|strip_tags}</a><br></center>
{/foreach}
</td></tr>
</table></td>

<td valign='top' width=77%>

<form method='post' action='/id/{$node.node_id}'>
{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
{* showing bookmark category *}
{if $bookmark_category.node_name neq false}
kategoria::<a class='important' href='/id/{$bookmark_category.node_id}/'>{$bookmark_category.node_name}</a>

{if $bookmark_category.sum neq false}
:: <span class='most_important'> {$bookmark_category.sum} NEW</span>
{/if}
{/if}
<br>

{foreach from=$bookmark_category.children item=bookmarks}
<input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]'

value='{$bookmarks.node_id}'>
{if $bookmarks.node_name}
<a href='/id/{$bookmarks.node_id}'>{$bookmarks.node_name}</a>
{if $bookmarks.node_user_subchild_count neq false}
::: <span class='most_important'> {$bookmarks.node_user_subchild_count} NEW</span>
{/if}
{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
:: desc
{/if}
{if $bookmarks.node_updated > $bookmarks.last_visit}
:: <span class='most_important'>C</span>
{/if}


{/if}
<br>
{/foreach}

<br>
{/foreach}

<input type='text' name='bookmark_category_id'><input type='submit' name='event' value='set_bookmark_category'>
</form>
</td>

</tr></table>

{include file="modules/footer.tpl"}