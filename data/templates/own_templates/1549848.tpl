<div class='active_users'>
<table cellspacing='0' cellpadding='0'>
<tr><td width=100%>
{get_userlist}
{if $active_friends eq true}
<span class='important'><center>friends</center></span>
{foreach from=$active_friends item=node_visitor}
<div class='active_user'><div class='active_user_img'><a href='/id/{$node_visitor.user_id}/'><img border='0' name='{$node_visitor.login}' width='50' height='50' alt='{$node_visitor.login}' title='{$node_visitor.login}' src='{get_image_link id=$node_visitor.user_id}'></a></div></div>
{/foreach}
</td></tr>
<tr><td><table cellspacing='0' cellpadding='1' style='text-align: center; border: 0;' align='center'>
<tr><td><b>K</b></td><td><b>K_wallet</b></td></tr>
<tr><td><span>{$user_k}</td><td>{$k_wallet}</td></tr>
</table></td></tr>
{/if}
<tr><td>
<span class='important'><center>users on.line</center></span>
{foreach from=$active_users item=node_visitor}
<center><a href='/id/{$node_visitor.user_id}'>{$node_visitor.login}</a><br></center>
{/foreach}
</td></tr>
</table>