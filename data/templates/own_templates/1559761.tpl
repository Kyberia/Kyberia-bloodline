{include file="modules/header.tpl"}

<script language="javascript" src="/id/156968/download">
</script>

<table width=100%>
<tr><td valign='top' width=12%>
{include file="modules/get_userlist.tpl"}
</td>

<td valign='top' width=50%>

<form method='post' action='/id/{$node.node_id}'>
<span class='tt'>&nbsp</span>
{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
{* showing bookmark category  *}
{if $bookmark_category.node_name neq false}
<a href="javascript:chngbukcat('{$bookmark_category.node_id}')">#</a>kategoria::<a class='important' href='/id/{$bookmark_category.node_id}/'>{$bookmark_category.node_name}</a>
		{if $bookmark_category.sum neq false}
				:: <span class='most_important'> {$bookmark_category.sum} NEW</span>
		{/if}

{/if}

{foreach from=$bookmark_category.children item=bookmarks}
<input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]' value='{$bookmarks.node_id}'>
{if $bookmarks.node_name}
<a href='/id/{$bookmarks.node_id}'>{$bookmarks.node_name}</a>
{if $bookmarks.node_user_subchild_count neq false}
:: <span class='most_important'> {$bookmarks.node_user_subchild_count} N!</span>

{/if}
{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
:: <span class='most_important'>D!</span>
{/if}

{/if}
<br>
{/foreach}

<br>

{/foreach}<input type='text' name='bookmark_category_id'><input type='submit' name='event' value='set_bookmark_category'>
</form>

</td></tr></table>















