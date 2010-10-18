{get_threaded_children link='yes' listing_amount=23232323 offset=$offset ordearby=$listing_order}


{foreach from=$get_threaded_children item=child}
{if $child.node_creator eq $user_id}
<div class='bordered' style='height:auto;'>
<div class='header' style='height:auto;'>
&nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
&nbsp;&nbsp;<input type='checkbox' value='{$child.node_id}' name='node_chosen[]'>
&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
{if $child.node_updated} (modif: {$child.node_updated|date_format:"%d.%m.%Y. - %H:%M:%S"}){/if}
{if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
{if $child.node_updated > $node.last_visit}<span class='most_important'>!!CONTENT CHANGED!!</span>{/if}
{if $bookmarks.last_visit eq true and $child.lastdescendant_created > $bookmarks.last_visit}<span class='most_important'>!!NEW DESCENDANT!!</span>{/if}
<div style='text-align:center;'>
{if $child.node_name eq ''}
<a href='/id/{$child.node_id}'>enter node {$child.node_id}</a>
{else}
<a href='/id/{$child.node_id}'>{$child.node_name}</a>
{/if}
{if $child.node_creator eq $user_id}| <a href='/id/{$child.node_id}/1961033'>conf</a>{/if}
</div></div>
<div>{$child.node_content|stripslashes|nl2br}</div>
</div>

<br>{/if}
{/foreach}

<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>