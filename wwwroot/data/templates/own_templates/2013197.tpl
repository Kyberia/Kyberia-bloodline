{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{include file="1549925.tpl"}

<a href='/id/{$node.node_id}/1970182'>bookmarks</a><br />
<a href='/id/{$node.node_id}/1911535'>movement</a><br /><br />
<a href='/id/{$node.node_id}/1757900'>nodeshells</a><br />
<a href='/id/{$node.node_id}/1761254'>forums</a><br />
<a href='/id/{$node.node_id}/1573668'>submissions</a><br />
<a href='/id/{$node.node_id}/1773535'>articles</a><br />
<a href='/id/{$node.node_id}/1757556'>blogs</a><br />
<a href='/id/{$node.node_id}/1757626'>datas</a><br /><br />
<a href='/id/{$node.node_id}/1769388'>friends</a><br />


{* showing poll *}
{*include file="1549834.tpl"*}
<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>


{get_nodes_by_parent parent=21 listing_amount=23232323232 offset=0}
{foreach from=$get_nodes_by_parent item=child}
{if $child.node_creator eq $node.node_id}
<div class='bordered' style='margin-bottom:13px'>
<div class='header' style='text-align:center; height: 3em'>
<a href='/id/{$child.node_id}'>{$child.node_name}</a> in <a href='/id/{$child.node_parent}'>{$child.parent_name}</a> {if $child.user_action neq false} [lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]{/if}
<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
</div>
<div>
{$child.node_content|strip_tags|truncate:230|stripslashes}
</div>
</div>
{/if}
{/foreach}

<!--end of central column-->

</td></tr></table>
{/if}
(c)DarkAural - mailware:-)




