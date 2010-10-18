<form method='post' action='/id/{$node.node_id}'>
{get_bookmarks node_id=$node.node_id}
{foreach from=$get_bookmarks item=bookmark}
<input type='checkbox' name='bookmark[{$bookmark.node_id}]'
{if $bookmark.bookmark_category eq true}checked{/if}>&nbsp;&nbsp;{$bookmark.node_name}<br>
{/foreach}
<br>
<input type='submit' name='event' value='configure_bookmarks'>
</form>
