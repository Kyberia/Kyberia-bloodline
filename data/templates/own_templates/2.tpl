{get_movement_params children_count=$node.node_children_count}
{* header *}{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node settings *}
{include file="1549925.tpl"}

{* get_poll_box *}
{include file="1549834.tpl"}
<br>
{*get_bookmark_statistics_box*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
{*node_content*}
{include file="1549916.tpl"}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $permissions.w eq true}{*addnode*}{include file="1548927.tpl"}{/if}
{*get_nodeshell_children*}{include file="1549822.tpl"}
</form>
<!--end of central column-->
</td></tr></table>

{*footer*}{include file="1549377.tpl"}