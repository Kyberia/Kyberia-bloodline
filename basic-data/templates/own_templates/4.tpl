{get_movement_params children_count=$node.node_children_count}
{* header *}{include file="1549864.tpl"}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--main central column-->
<td width=66% valign='top'>
{*node_content*} {include file="1549916.tpl"}
{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/
{if $action neq false}{$action}{/if}' method='post' name='formular'>

{if $permissions.w eq true}{include file="1548927.tpl"}{else}{* read-only *}{include file="2264143.tpl"}{/if}
{include file="1549839.tpl"}
</form>
</td>
<!--end of central column-->

<!--right column-->
<td valign='top' align='center' width='23%'>
{* node_settings *} {include file="1549925.tpl"}
{* get_poll_box *} {include file="1549834.tpl"} <br>
{*get_bookmark_statistics_box*} {include file="1549386.tpl"}
</td>
<!--end of right column-->

</tr></table>

{*footer*}{include file="1549377.tpl"}


