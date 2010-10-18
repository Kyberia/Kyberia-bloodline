{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}

<table><tr><td valign='top' width='23%'>{include file="modules/get_userlist.tpl"}</td>
<td>
<center><span class='important'>k data nodes
{if $action}{get_k vector=$action} in vector {$action}
{else}{get_k}
</span>
{include file="modules/movement.tpl"}
<br>
</center>
{/if}

{foreach from=$get_k item=k}
{if $fook[$k.node_parent] neq true and $fook[$k.node_id] neq true}
<table class='bordered'>
<tr>
<td align='center' rowspan='2' valign='top'>
<img border='0' hspace='5' width='50' src={get_image_link id=$k.node_creator}>
<span class='most_important'>{$k.k} k</span>
</td><br />
<td class='header' width='100%'><a href='/id/{$k.node_id}/'>{$k.node_name}</a>
 in <a href='/id/{$k.node_parent}'>{$k.parent_name}</a> by <a href='/id/{$k.node_creator}'>{$k.creator}</a></td>

<tr><td valign='top'>{$k.node_content|stripslashes|nl2br|imagestrip}</td></tr>
</tr>
</table>
<br>
{/if}
{/foreach}
</td></tr></table>
{include file="modules/footer.tpl"}