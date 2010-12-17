{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="loginbox.tpl"}</center>

{else}

<table width='100%' style='BORDER: solid 1px;BORDER-BOTTOM: 3px;BORDER-TOP: 3px; BORDER-LEFT: 0px; BORDER-RIGHT: 0px;'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
<img width='50' hspace='5' src='{get_image_link id=$node.node_creator}'><br>
<font size=5>{$node.node_name}</font>


{include file="userinfo.tpl"}
{* showing poll *}
{*include file="get_poll_box.tpl"*}
<br>
{*showing bookmark_statistics*}
bookli ma
{include file="1549386.tpl"}
<br>
<input type="button" value="show node info"
onClick="document.getElementById('ns').style.visibility =
'visible';"><br>
<div style="visibility:hidden" id="ns" name="ns">
<table border=0 style="border-left: solid 1pt #6dae42; border-right: solid 2pt #6dae42; border-bottom: solid 2pt #6dae42; border-top: solid 1pt #6dae42;"><tr><td>
<center><input type="button" value="HIDE node info"
onClick="document.getElementById('ns').style.visibility =
'hidden';"></center>
<br>
<center>
{include file="1549925.tpl"}
</center>
<br>
</td></tr></table>
</div>
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
<center>
<a href="http://my.opera.com/pyxel/affiliate/" title="Download Opera" ><img src="http://promote.opera.com/small/opera88x31.gif" border=0 width="88" height="31" alt="Download Opera" /></a>
&nbsp;
<!-- <a href="http://www.xfce.org/" target=__><img src="http://hysteria.sk/pyxel/kyberia/buttons/xfce4.gif" border=0></a>&nbsp; -->
<a href="http://www.gentoo.org/" target=_dzentuu><img src="http://agilo.acjs.net/banner_gentoo.png" border=0></a>&nbsp;
<!-- <a href="http://www.debian.org/" target=_new><img src="http://hysteria.sk/pyxel/kyberia/forums/debian/debianlogo.gif" border=0></a> -->
</center>

<form method='post' action='/id/{$node.node_id}'>

</form>

{if $action eq true}

<center>{include file="movement.tpl"}</center>
{include file="get_creation_by_template_id.tpl" listing_amount=$listing_amount type=$action}


{else}

<div height=600 class='bordered' id='topic' style="background-image: url(http://img242.imageshack.us/img242/5890/marekmahutkyberiapc0.gif); background-position: bottom right; background-repeat: no-repeat;">
   {$node.node_content|nl2br|replace:'...':'&hellip;'}
</div><br /><br />

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
&nbsp;[<a href='/{$child.user_action}/'>{$child.user_action}</a>]
{/if}
{/if}
<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center>
<tr><td>{$child.node_content}</td></tr>
</table>
</table>
{/foreach}

<form method='post' action='/id/{$node.node_id}'>
<BR>
<textarea name='node_content' style='background-image: background-image: url(http://kyberia.sk/images/nodes/1/7/1749237.gif); background-position: top right; background-repeat: no-repeat;'>{$post_vars.node_content}</textarea>
<center>{include file="modules/movement.tpl"}</center>
<br>
{if $permissions.w eq true}
<input type='hidden' name='template_id' value='8'>
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='hidden' name='external_link' value='session://friend'>
<table><tr><td><input type='submit' name='event' value='add'>
<td> ako </td> <td><input type='text' name='node_name'></td>
</table>
{/if}

</form>
{/if}
<!--end of central column-->

</td></tr></table>
{/if}