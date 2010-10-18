{* header *}{include file="1549864.tpl"}

<table width=100%>
<tr><td valign='top' width=12%>
{* get_userlist *}{include file="1549848.tpl"}
</td>

<td valign='top' width=50%>

<!-- BANNER PLACE START -->
<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='468' height='60'><param name='movie' value='http://www.subclub.sk/images/banners/milkshake468x60.swf'><param name='quality' value='high'><embed src='http://www.subclub.sk/images/banners/milkshake468x60.swf' quality=high width='468' height='60' type='application/x-shockwave-flash' pluginspace='http://www.macromedia.com/go/getflashplayer'></embed></object>
<!-- BANNER PLACE END -->
<form method='post' action='/id/{$node.node_id}'>

{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
{* showing bookmark category  *}
{if $bookmark_category.node_name neq false}
 kategoria::<a class='important' href='/id/{$bookmark_category.node_id}/'>{$bookmark_category.node_name}</a>
        {if $bookmark_category.sum neq false}
                :: <span class='most_important'> {$bookmark_category.sum} NEW</span>
        {/if}
{/if}
<br>

{foreach from=$bookmark_category.children item=bookmarks}
<input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]' value='{$bookmarks.node_id}'>
{if $bookmarks.node_name}
<a href='/id/{$bookmarks.node_id}'>{$bookmarks.node_name}</a>
{if $bookmarks.node_user_subchild_count neq false}
:: <span class='most_important'> {$bookmarks.node_user_subchild_count} NEW CHILDREN</span>
{/if}
{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
:: <span class='most_important'>!!NEW DESCENDANT!!</span>
{/if}
{if $bookmarks.node_updated > $bookmarks.last_visit}
:: <span class='most_important'>!!CONTENT CHANGED!!</span>
{/if}


{/if}
<br>
{/foreach}

<br>
{/foreach}
Recycle Bin [<a href='/id/1571388/2086083'>1</a>,<a href='/id/123456/2086083'>2</a>]
<br><br>
<input type='text' name='bookmark_category_id'><input type='submit' name='event' value='set_bookmark_category'>
</form>

</td></tr></table>
{*footer*}{include file="1549377.tpl"}





























































































