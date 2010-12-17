{include file="1549864.tpl"}



<div style='position: absolute; background-color:black;z-index:4'>

<div class='active_users' style='margin-left: 10px; width: 200px'>
<span class='important'><center>friends</center></span>
{if $action}{get_userlist vector=$action} in vector {$action}
{else}{get_userlist}{/if}
{foreach name=friends from=$active_friends item=active_friend}<a href='/id/{$active_friend.user_id}'><img name='{$active_friend.login}' alt='{$active_friend.login}' title='{$active_friend.login}' src='{get_image_link id=$active_friend.user_id}' border='0' height='50' width='50'></a>{/foreach}
</div>

<div style='margin-left: 10px; margin-top: 5px; width: 200px'>
<span class='important'><center>new forums</center></span>
{get_linked_nodes node_id=1058182 listing_amount=10}
{foreach from=$get_linked_nodes item=child}
<a href='/id/{$child.node_id}'>{$child.node_name|strip_tags|stripslashes}</a> {$child.login}
({$child.node_children_count})<br>
{/foreach}
</div>

<div style='margin-left: 10px; margin-top: 5px; width: 200px; text-align: justify'>
<span class='important'><center>users online</center></span>
{foreach name=users from=$active_users item=active_user}
<a href="/id/{$active_user.user_id}">{$active_user.login}</a>
{/foreach}
</div>



</div>



<div style='position: absolute; left: 240px; top: 29px;'>
<form id="form_id" name="myform" method='post' action='/id/{$node.node_id}'>
{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
{* showing bookmark category *}
{if $bookmark_category.node_name neq false}
<a class='important' href='/id/{$bookmark_category.node_id}/' style='border-left: 1px solid; padding-left: 4px;'>{$bookmark_category.node_name}</a>
{if $bookmark_category.sum neq false}
|| <span class='most_important'> {$bookmark_category.sum}NEW</span>
{/if}
{/if}
<br>
<ul style='list-style-type: none; padding-left: 0px; border-left:1px solid; padding-bottom: 0px; margin: 0px; margin-bottom: 20px; '>
{foreach from=$bookmark_category.children item=bookmarks}
{if $bookmarks.node_name}
<li>- <input style='height: 11px; width: 11px;' type='checkbox' name="bookmarks_chosen[]" value='{$bookmarks.node_id}'> <a href='/id/{$bookmarks.node_id}'>{$bookmarks.node_name|strip_tags:false}</a>
{if $bookmarks.node_updated > $bookmarks.last_visit}
- <span class='most_important'>CONT</span>
{/if}

{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
-
{/if}
{if $bookmarks.node_user_subchild_count neq false}
 <span class='most_important'> {$bookmarks.node_user_subchild_count}NEW </span> ||
{/if}
{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
 <span class='most_important'>DESC</span>
{/if}

{/if}
</li>
{/foreach}
</ul>
{/foreach}

<div style="margin-bottom: 4px"><input type='text' name='bookmark_category_id'> <input type='submit' name='event' value='set_bookmark_category'></div>
<div><input type='submit' name='event' value='unbook_multi' onclick="return confirm('You really sure?')" /> <input type='submit' name='event' value='set_as_read' />
<input type='button' value='check_all' onClick="select_all('bookmarks_chosen', '1');" /> <input type='button' value='uncheck_all' onClick="select_all('bookmarks_chosen', '0');" /></div>
</form>
<br /><br /><br /><br /><br /><br />
{include file="modules/footer.tpl"}
</div>