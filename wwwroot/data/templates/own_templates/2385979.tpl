{get_movement_params children_count=$node.node_children_count}
{if $header_id neq true} {include file="1549864.tpl"} {/if}
{if $node.node_user_subchild_count eq true}
{get_nodes_by_parent time=$node.last_visit parent=63756 time=$node.last_visit listing_amount=$listing_amount offset=$offset}
{else}
{get_nodes_by_parent parent=63756 listing_amount=$listing_amount offset=$offset}
{/if}
{foreach from=$get_nodes_by_parent item=child} <table> <tr> <td valign='top' rowspan='2'></td> <td valign='top' width='100%'> <table width='100%'><tr class='header' valign='top'> <td align='center'> <b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b><br>  (vlozil <a href='/id/{$child.node_creator}'>{$child.login}</a> , viewed {$child.node_views} times, {$child.node_children_count} submissions, {if $child.k > 0}<span class='most_important'>{$child.k}K</span>{/if}) {if $child.node_user_subchild_count eq true} <span class='most_important'>{$child.node_user_subchild_count} NEW</span>{/if} <tr><td>{$child.node_content|truncate:230|stripslashes}</td></tr> </table> </table> {/foreach} <form method='post' action='/id/{$node.node_id}'> <br><br><center>pridaj kokotinu<br><br>{include file="1548927.tpl"}</center> </form> {include file="1549377.tpl"}