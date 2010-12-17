{*header*}{include file="1549864.tpl"}
<!--<link rel="stylesheet" type="text/css" href="/data/templates/own_templates/1012901.tpl"> lm23 -->
<link rel="stylesheet" type="text/css" href="/data/templates/own_templates/1500395.tpl"><!-- re:cloned -->

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center>

{else}

<script language="javascript" src="/data/templates/own_templates/1627946.tpl"></script>

<table width="100%" cellpadding="5">
<tr><td valign="top" width="110">
<center>
{*friends*}
<table cellspacing="0" cellpadding="0">
{get_userlist}
{if $active_friends eq true}
<div class="active_friends">
<center><b>friends</b></center>
{foreach from=$active_friends item=active_friend}
<tr><td width="100%" valign="top" align="left"><div class="b_friend">
<a href="/id/{$active_friend.user_id}/" title="{$active_friend.login|strip_tags}">
<img border="0" alt="{$active_friend.login|strip_tags}" width="23" height="23" src="{get_image_link id=$active_friend.user_id}"></a>[<a href="/id/{$active_friend.user_action_id}">{$active_friend.user_action|strip_tags:false|truncate:23}</a>]<br>{$active_friend.idle_time_minutes}min {$active_friend.idle_time_seconds}sec
</div></td></tr>
{/foreach}
</div>
{/if}
<tr><td>
<br>
<div class="active_users">
<b><center>users on.line</center></b>
{foreach from=$active_users item=active_user}
<center><a href="/id/{$active_user.user_id}" title="{$active_user.login|escape:'html'}">{$active_user.login|escape:'html'|truncate:23}</a><br></center>
{/foreach}
</div></td></tr>
</table>

</td>

<td valign="top" width=650>

<form method="post" action="/id/{$node.node_id}" name="bookmarks_form">
<span class="tt">&nbsp</span>
{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
<!-- <h2>X</h2> --><div class="b_cat">
{* showing bookmark category  *}
{if $bookmark_category.node_name neq false}

<a href="javascript:chngbukcat('{$bookmark_category.node_id}')">kategoria</a>:: <a class="important" href="/id/{$bookmark_category.node_id}/">{$bookmark_category.node_name}</a>
        {if $bookmark_category.sum neq false} ::<span class="most_important">{$bookmark_category.sum} NeW</span>
        {/if}
{/if}
{if $bookmark_category.node_name neq true}
~~~ UnSoRTeD ~~~
{/if}

<div class="b_item">
{foreach from=$bookmark_category.children item=bookmarks}
{if $bookmarks.node_name && $bookmarks.node_id}
<div class="b_node">
<input style="height: 11px; width: 11px;" type="checkbox" name="bookmarks_chosen[]" value="{$bookmarks.node_id}" />
<a href="/id/{$bookmarks.node_id}">{$bookmarks.node_name|strip_tags:false|truncate:123}</a>
{if $bookmarks.node_user_subchild_count neq false} ::<span class="most_important">{$bookmarks.node_user_subchild_count} NeW CHiLd</span>
{/if}

{if $bookmarks.lastdescendant_created > $bookmarks.last_visit} ::<span class="important">DeSCdnT</span>
{/if}
{if $bookmarks.node_updated > $bookmarks.last_visit} ::<span class="most_important">ConTNT CHanGD</span>
{/if}
{if $bookmarks.node_creator eq $user_id or $bookmarks.node_permission eq 'master' or $bookmarks.node_permission eq 'op'} ::[<a href="/id/{$bookmarks.node_id}/1961033">configure</a>]
{/if}
 ::[{$bookmarks.node_creator}]
</div>

{/if}
{/foreach}</div></div>

<br>

{/foreach}
<input type="text" name="bookmark_category_id" /><input type="submit" name="event" value="set_bookmark_category" /><br />
<input type="submit" name="event" value="unbook_multi" />
<input type="submit" name="event" value="set_as_read" />
</form>

</td>
</tr></table>
{/if}

{*footer*}{include file="1549377.tpl"}