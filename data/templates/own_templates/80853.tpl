{get_threaded_children link='yes' listing_amount=$listing_amount offset=$offset ordearby=$listing_order}
<ul>
{foreach from=$get_threaded_children item=child}
<li>
{math equation="(x-y)-8" x=$child.depth y=$node.vector_depth assign="dpth"}
<!--
<a href='/id/{$child.node_parent}'>{$child.node_vector}</a>
  <td width='{math equation="(x-y)-8" x=$child.depth y=$node.vector_depth}%'>
<img src='{get_image_link id=$child.node_creator}' width='50' hspace='5' alt='{$child.login}' onclick="km();sm('{$child.login}','{$child.node_creator}','{$node.node_id}')" />
  <td width='{math equation="100-(x-y)" x=$child.depth y=$node.vector_depth}%'>
-->
&nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[lokacia :: <a href='/{$child.user_actions}/'>{$child.user_action}</a>]
{/if}
&nbsp;&nbsp;<input type='checkbox' value='{$child.node_id}' name='node_chosen[]'>
&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
{if $child.node_updated} (modif: {$child.node_updated|date_format:"%d.%m.%Y. - %H:%M:%S"}){/if}
{if $child.k > 0} [<span class='most_important'>{$child.k}K</span>] {/if}
{if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
{if $child.node_status eq 'linked'}
&nbsp;<span class='most_important'>HARDLINK</span>
{/if}
{if $child.node_updated > $node.last_visit}<span class='most_important'>!!CONTENT CHANGED!!</span>{/if}
{if $bookmarks.last_visit eq true and $child.lastdescendant_created > $bookmarks.last_visit}<span class='most_important'>!!NEW DESCENDANT!!</span>{/if}
<div style='text-align:center;'>
{if $child.node_name eq ''}
<a href='/id/{$child.node_id}'>enter node {$child.node_id}</a>
{else}
<a href='/id/{$child.node_id}'>{$child.node_name}</a>
{/if}
{if $child.node_creator eq $user_id}| <a href='/id/{$child.node_id}/1961033'>conf</a>{/if}
</div>
{$child.node_content|stripslashes|nl2br}
</li>
{/foreach}
</ul>