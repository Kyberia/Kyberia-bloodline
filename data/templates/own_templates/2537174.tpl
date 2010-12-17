{get_movement_params children_count=$node.node_children_count}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

<table width='100%'><tr>

<!--main central column-->
<td valign='top'>
<table width='100%' class='bordered'><tr><td>

<div style="background-color: #664411; padding-bottom: 3px; padding-left: 14px; padding-top: 3px"><span style=" color: #D4CB50; font-size: larger;">- <strong>Data nodes</strong></span></div><br />

<div style="padding-left: 14px; list-style-type: square;">

{get_nodes_by_type type=12 listing_amount=150 offset=$offset}

{foreach from=$get_nodes_by_type  item=child}
<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:80:"<br>":true}</a><br>
by <a href='/id/{$child.node_creator}'>{$child.login|wordwrap:50:"<br>":true}</a> in <a href='/id/{$child.node_parent}'>{$child.parent_name|wordwrap:80:"<br>":true}</a> on {$child.lastchild_created|wordwrap:80:"<br>":true}<br><br>

{/foreach}

<!--end of central column-->
</td></tr></table>