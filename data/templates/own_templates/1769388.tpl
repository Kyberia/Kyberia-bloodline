{* header *}{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node_settings *}{include file="1549925.tpl"}

{* showing poll *}
{*include file="1549834.tpl"*}
<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
{getCreationByExternalLink external_link='session://friend' listing_amount=200 offset=$offset}
{foreach from=$getCreationByExternalLink item=child}
<table>
<tr>
<td width='100' valign='top' rowspan='2'><a href='/id/{$child.node_parent}'><img border=0 hspace='5' src='{get_image_link id=$child.node_parent}'></a>&nbsp;</td>
<td style='width: 100%' valign='top'>
<table width=100%><tr class='header' width=100%>
<td>
friend:: <a href='/id/{$child.node_parent}'>{$child.parent_name}</a> &nbsp;comment:: <a href='/id/{$child.node_id}'>{if $child.node_name eq ''}&nbsp;&nbsp;{else}{$child.node_name}{/if}</a><br>
{$child.node_created|date_format:"%H:%M:%S - %d.%m.%Y"}&nbsp; {if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'} |<a href='/id/{$child.node_id}'>enter</a>|<a href='/id/{$child.node_id}/1961033'>conf</a>{/if}
<tr><td>{$child.node_content|stripslashes|nl2br|imagestrip}</td></tr>
</table>
</table>
{/foreach}
{* movement *}{include file="1549913.tpl"}
<!--end of central column-->


</td></tr></table>
{/if}