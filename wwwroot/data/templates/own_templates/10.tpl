{get_movement_params children_count=$node.node_children_count}
{include file="1549864.tpl"}

{if $error eq true}
    <center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
    <center>{include file="1549885.tpl"}</center><br><br>

{else}
<script language="javascript" src="/id/1478235/download"></script>
<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="1549925.tpl"}

{* showing poll *}
{include file="1549834.tpl"}

<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=66% valign='top'>

{if $user_id eq $node.node_creator}

<form method='post' action='/id/{$node.node_id}'>
{* showing bookmarks *}
{get_bookmarks}
{foreach from=$get_bookmarks item=bookmarks}
    {if $bookmarks.node_id eq $node.node_id}
        {foreach from=$bookmarks.children item=bookmark}
            {if $bookmark.node_name && $bookmark.node_id}
                <input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]' value='{$bookmark.node_id}'>
                <a href='/id/{$bookmark.node_id}'>{$bookmark.node_name|strip_tags}</a>
                {if $bookmark.node_user_subchild_count neq false}
                    <span class='most_important'>{$bookmark.node_user_subchild_count} NEW CHILDREN</span>
                {/if}
                {if $bookmark.lastdescendant_created > $bookmark.last_visit}
                    ::<b>!!NEW DESCENDANT!!</b>
                {/if}
                {if $bookmark.node_updated > $bookmark.last_visit}
                    ::<span class='most_important'>!!CONTENT CHANGED!!</span>
                {/if}
                {if $bookmark.node_creator eq $user_id or $bookmark.node_permission eq 'master' or $bookmark.node_permission eq 'op'}
                    ::[<a href='/id/{$bookmark.node_id}/1961033'>configure</a>]
                {/if}
                <br>
            {/if}
        {/foreach}
    {/if}
{/foreach}

<br>
<input type='text' name='bookmark_category_id'><input type='submit' name='event' value='set_bookmark_category'>
<br>

{* showing bookcats *}
{get_bookmarks}
{foreach from=$get_bookmarks item=bookcat}
    {if $bookcat.node_name neq false}
        <a href="javascript:chngbukcat('{$bookcat.node_id}')">kategoria</a>
        :: <a href='/id/{$bookcat.node_id}/'><b>{$bookcat.node_name}</b></a>
        ::[<a href='/id/{$bookcat.node_id}/1961033'>configure</a>]
        <br>
    {/if}
{/foreach}
</form>

{else}

{get_linked_nodes orderby=$listing_order}
{foreach from=$get_linked_nodes item=link}
    {if $link.node_name && $link.node_id}
        <a href='/id/{$link.node_id}'>{$link.node_name}</a>
        {if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}
            :: (<a href='/id/{$child.node_id}/1961033'>configure</a>)
        {/if}
        (<a href='/id/{$link.node_creator}'>{$link.login}</a>)
        <br>
    {/if}
{/foreach}

{/if}
</td>
<!--end of central column-->

</tr></table>
{/if}
{include file="1549377.tpl"}