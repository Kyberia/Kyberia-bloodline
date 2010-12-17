<center>
<link rel='stylesheet' type='text/css' href='http://darkaural.wz.cz/white.css'>

<table width='666' class='bordered'><tr><td>
{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>
<td valign='top'>

{ include file="1549916.tpl" }
{* shows what other friends think about users *}
{get_children_by_external_link external_link='session://friend' listing_amount=$listing_amount offset=$offset orderby=desc}
{foreach from=$get_children_by_external_link item=child}
<table>
<tr>
<td valign='top' rowspan='2'><img width='50' hspace='5' src='{get_image_link id=$child.node_creator}'>&nbsp;</td>
<td valign='top' width='100%'>
<table width='100%'><tr class='header' valign='top'>
<td>
{if $child.template_id eq 6 }
<center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{elseif $child.template_id eq 5 }
<center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{else}
&nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[<a href='/id/{$child.user_action_id}/'>{$child.user_action}</a>]
{/if}
{/if}
&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center>
<tr><td>{$child.node_content|nl2br}</td></tr>
</table>
</table>
{/foreach}

<form method='post' action='/id/{$node.node_id}'>
<BR>
<textarea name='node_content'>{$post_vars.node_content}</textarea>
<br>
{if $permissions.w eq true}
<!--
pridane input z template_id 8ckou.
vid /id/1860668
[pyxel]
-->
<input type='hidden' name='template_id' value='8'>
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='hidden' name='external_link' value='session://friend'>
<table><tr><td><input type='submit' name='event' value='add'>
<td> with name:</td> <td><input type='text' name='node_name'></td>
</table>
{/if}

</form>

<!--end of central column-->

</td>
<td valign='top' align='center' width='23%'>
<br>{ include file="1549925.tpl" }
{* showing poll *}
<br><br>
{include file="1549834.tpl"}
{*showing bookmark_statistics*}
<br><br>
{include file="1549386.tpl"}
</td></tr></table>

{if $user_id eq 1859269}<center><img src='http://hysteria.sk/~darkaural/see.php'></center>{/if}
{/if}


</td></tr></center>





