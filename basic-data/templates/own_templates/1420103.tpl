{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center>

{else}

<br /><br />
<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
<table>
<tr><td>node:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>owner:</td><td><a href='/id/1538'>MARIN</a></td>
<tr><td>datetime:</td><td>niekedy zaciatkom leta</td></tr>
</table>
<br>
<center><a href='/id/{$node.node_id}/1961036'>neurons</a></center>
<br>
<center><a href='/id/{$node.node_id}/1961037'>statistics</a></center>
<span class='most_important'>666 K</span>
<center><a href='/id/{$node.node_id}/3'>tr33</a></center>
<br>
<center><a href='/id/{$node.node_id}/1573668'>sub missions</a></center>
<center><a href='/id/{$node.node_id}/1757556'>b.logs</a></center>
<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}

</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>


<table width='666' border=0><tr><td>
{$node.node_content|nl2br}
</td></tr></table><br><br>
{* shows what other friends think about users *}
{get_children_by_external_link external_link='session://friend' listing_amount=1666 offset=$offset orderby=desc}
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

{/if}
<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center>
<tr><td>{$child.node_content}</td></tr>
</table>
</table>
{/foreach}

<form method='post' action='/id/{$node.node_id}'>
<BR>
<textarea name='node_content'>{$post_vars.node_content}</textarea>

<br>
{if $permissions.w eq true}<br />
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='hidden' name='external_link' value='session://friend'>
<table><tr><td><input type='submit' name='event' value='add'>
<td> with name:</td> <td><input type='text' name='node_name'></td>
</table>
{/if}

</form>
{/if}

<!--end of central column-->

</td></tr></table>


<!--
I don't need no arms around me
And I dont need no drugs to calm me.
I have seen the writing on the wall.
Don't think I need anything at all.
No! Don't think I'll need anything at all.
All in all it was all just bricks in the wall.
All in all you were all just bricks in the wall.
-->

</body>
</html>