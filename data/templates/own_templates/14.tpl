{* header *}{include file="1549864.tpl"}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node_settings *}
{include file="1549925.tpl"}

{* get_poll_box *}
{include file="1549834.tpl"}
<br>
{*get_bookmark_statistics_box*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=66% valign='top'>
{*showing node_content*}

<div class='bordered' style='width:666px; white-space:pre;'>
{$node.node_content|escape:"html"|wordwrap:130}
</div><br /><br />

{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
{if $permissions.w eq true}{*addnode*}{include file="1548927.tpl"}{/if}
{*get_threaded_children*}{include file="1549839.tpl" children_type=4}
</form>
<!--end of central column-->

</td></tr></table>

{*footer*}{include file="1549377.tpl"}