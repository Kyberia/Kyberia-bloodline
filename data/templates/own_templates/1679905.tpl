{include file="modules/header.tpl"}

<div style='position: absolute;height: 100%;background-color:black;z-index: 2'>
<div class='active_users' style='margin-left: 10px; width: 200px'>
<span class='important'><center>friends</center></span>
{if $action}{get_userlist vector=$action} in vector {$action}
{else}{get_userlist}
{/if}
{foreach name=friends from=$active_friends item=active_friend}<a href="javascript:chngto('{$active_friend.login}','{$active_friend.user_id}')"><img name='{$active_friend.login}' alt='{$active_friend.login}' title='{$active_friend.login}' src='{get_image_link id=$active_friend.user_id}' border='0' height='50' width='50'></a>{/foreach}
</div>


<div style='margin-left: 10px; margin-top: 5px; width: 200px'>
<span class='important'><center>new forums</center></span>
{get_linked_nodes node_id=1058182 listing_amount=10}
{foreach from=$get_linked_nodes item=child}
<a href='/id/{$child.node_id}'>{$child.node_name|strip_tags|stripslashes}</a> {$child.login}
({$child.node_children_count})<br>
{/foreach}
</div>


<div style='margin-left: 10px; margin-top: 5px; width: 200px; text-align: justify'>
<span class='important'><center>users online</center></span>
{foreach name=users from=$active_users item=active_user}
<a href="javascript:chngto('{$active_user.login}','{$active_user.user_id}')">{$active_user.login}</a>
{/foreach}
</div>
</div>




<div style='position: absolute; left: 240px; top: 29px;'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'> {include file="1549897.tpl"} {include file="1549888.tpl" listing_amount=$listing_amount offset=$offset} </form>
<br /><br /><br /><br /><br /><br />
{include file="modules/footer.tpl"}
</div>





