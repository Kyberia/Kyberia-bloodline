{* header *}{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center>

{else}

<table width='100%' style='border:0px'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node_settings *}{include file="1549925.tpl"}
<br>
{*showing bookmark_statistics*}{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
<div style="width:666;margin:0px;padding:0px">
<div style="margin:0px;padding:0px" align="center"><h1 style="color:#fff;">Co ak je to vsetko uplne inak ?</h1><a href="http://www.pv2c.sk/~mi/" style="color:#c00;font-weight:bold;padding-bottom:5px;" >homepage</a> | <a href="/id/1959928" style="color:#c00;font-weight:bold;padding-bottom:5px;" >n0t3p4d</a> | <a style="color:#c00;font-weight:bold;padding-bottom:5px;" href="http://hysteria.sk/mifo/foto/">gallery</a></div><div style="margin:0px;padding:2px 20px 2px 2px;border:0px;color:black;background:#9ec83b;font-weight:bold;text-align:right;"><i>Boy, life takes a long time to live -- Steven Wright</i></div>
</div><br><br>
{* shows what other friends think about users *}
{get_children_by_external_link external_link='session://friend'
listing_amount=300 offset=$offset orderby=desc}
{foreach from=$get_children_by_external_link item=child}
<table border='0' style="border-bottom : 1px solid gray;">
<tr>
<td valign='top' rowspan='2'><img width='50'
hspace='5' src='{get_image_link
id=$child.node_creator}'>&nbsp;</td>
<td valign='top' width='100%'>
<table width='100%' style='padding:0px;'>
<tr style="background: black;font-weigth:bold;color:green;" class='header' valign='top'>
<td>
{if $child.template_id eq 6 }
<center><b><a
href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{elseif $child.template_id eq 5 }
<center><b><a
href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{else}
comment::<a href='/id/{$child.node_id}'>{$child.node_name}</a> by
&nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[<a href='/id/{$child.user_action_id}/'>{$child.user_action}</a>]
{/if}
{/if}
<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. -
%H:%M:%S"}</center>
<tr><td>{$child.node_content|nl2br}</td></tr>
</table>
</table>
{/foreach}

<form method='post' action='/id/{$node.node_id}'>
<BR>
<textarea style="background:#e4f3c0; color:black; width:100%;" name='node_content'>{$post_vars.node_content}</textarea>
<br>
{if $permissions.w eq true}
<!--
pridane input z template_id 8ckou.
vid /id/1860668
[pyxel]
-->
<input type='hidden' name='template_id' value='8'>
<input type='hidden' name='node_parent'
value='{$node.node_id}'>
<input type='hidden' name='external_link'
value='session://friend'>
<table><tr><td><input type='submit' name='event'
value='add'>
<td> with name:</td> <td><input type='text'
name='node_name'></td>
</table>
{/if}

</form>

<!--end of central column-->

</td></tr></table>
{/if}