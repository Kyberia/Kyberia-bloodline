{get_movement_params children_count=$node.node_children_count}
{* header *}{include file="1549864.tpl"}
<table><tr><td valign='top' width='23%'>{* get_userlist *}{include file="1549848.tpl"}</td></td>
<td>
<center><span class='important'>
</span>
<table><tr><td valign='top' width='23%'>
</td>
<td>
<center><span class='important'>nodes valued by K
{get_temp_k}
<form method='post'>Interval: <input type='text' name='interval'><input type='submit' value='Hour'></form>
</span>
<br/>
</center>


{foreach from=$get_temp_k item=k}
{if $fook[$k.node_parent] neq true and $fook[$k.node_id] neq true and $ignore[$k.node_creator] neq true}
<table class='bordered'>
<tr>
<td align='center' rowspan='2' valign='top'>
<img border='0' hspace='5' width='50' src={get_image_link id=$k.node_id}>
<span class='most_important'>{$k.count} k</span>
</td>
<td class='header' width='100%'><a href='/id/{$k.node_id}/'>{$k.node_name}</a>
 in <a href='/id/{$k.node_parent}'>{$k.parent_name}</a></td>
<tr><td valign='top'>{$k.node_content|stripslashes|nl2br}</td></tr>
</tr>
</table>
<br>
{/if}
{/foreach}
</td></tr></table>
</body></html>