{* header *}{include file="1549864.tpl"}
<form method='post' action='/id/{$node.node_id}'>
<table width=100%>
<tr><td valign='top' width=12%>
{* get_userlist *}{include file="1549848.tpl"}
</td>

<td valign='top' width=50%>

<!-- BANNER PLACE START -->
{* banner editovat na /id/1662468 *}{include file="1662468.tpl"}
<!-- BANNER PLACE END -->

{if $bookstyl eq 0}

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


{/if}
{if $bookstyl eq 1}

{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
{* showing bookmark category  *}
{if $bookmark_category.node_name neq false}
 kategoria::<a class='important' href='/id/{$bookmark_category.node_id}/'>{$bookmark_category.node_name}</a>

{/if}
<br>

{foreach from=$bookmark_category.children item=bookmarks}
{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
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
{/if}
{/foreach}

<br>
{/foreach}


{/if}
{if $bookstyl eq 2}

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
{if $bookmarks.node_user_subchild_count neq false}
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
{/if}
{/foreach}

<br>
{/foreach}

{/if}

{if $bookstyl eq 3}

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
{if $bookmarks.node_user_subchild_count neq false || $bookmarks.lastdescendant_created > $bookmarks.last_visit}
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
{/if}
{/foreach}

<br>
{/foreach}

{/if}

Recycle Bin [<a href='/id/1571388/2086083'>1</a>,<a href='/id/123456/2086083'>2</a>]
<br><br>
<input type='text' name='bookmark_category_id' /><input type='submit' name='event' value='set_bookmark_category' /><br />
<input type='submit' name='event' value='unbook_multi' />
<input type='submit' name='event' value='set_as_read' /><br />
<input type='radio' value='0' name='bookstyl'> Vsechny bookmarty
<input type='radio' value='1' name='bookstyl'> Jen new descendant
<input type='radio' value='2' name='bookstyl'> Jen new children
<input type='radio' value='3' name='bookstyl'> New Children a new descendant
<input type='submit' name='event' value='bookstyl' />
</form>

</td></tr></table>
{*footer*}{include file="1549377.tpl"}
