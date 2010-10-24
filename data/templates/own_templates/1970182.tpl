{* header *}{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node_settings *}
{include file="1549925.tpl"}

{* get_poll_box *}
{include file="1549834.tpl"}
<br>
{*get_bookmark_statistics_box*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
{*showing node_content*}
{get_bookmarks user_id=$node.node_id}
{foreach from=$get_bookmarks item=bookmark}
<a href='/id/{$bookmark.node_id}'>{$bookmark.node_name}</a>
{if $bookmark.node_user_subchild_count eq true}
<span class='most_important'>({$bookmark.node_user_subchild_count} UNREAD)</span>
{/if}
<br>
{/foreach}
</td>

<!--end of central column-->
</td></tr></table>
{/if}

{*footer*}{include file="1549377.tpl"}