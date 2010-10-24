{* header *}
{include file="1549864.tpl"}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>

{* node_settings *}
<table>
<tr><td colspan='2'><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>parent:</td><td><a href='/id/{$node.node_parent}'>{$node.node_parent_name}</a></td></tr> <tr><td>owner:</td><td><a href='/id/{$node.node_creator}'>{$node.owner}</a></td></tr></table>
<br/><br/>

{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<center><a href='/id/{$node.node_id}/1961033'>configure</a></center>{/if}<center>show[ <a href='/id/{$node.node_id}/2'>obsah</a> | <a href='/id/{$node.node_id}/3'>standard</a> ] <a href='/id/{$node.node_id}/1549582'>flat</a></center><br><br>

{* Vystupenia *}
<center>
<a href="http://kyberia.sk/id/2072319/2541148">Ohòovaèky</a><br><br>
<iframe frameborder=0 width="75%" height="300" src="http://kyberia.sk/id/2072319">Smola, zly browser...</iframe>
</center>
<br>

{* get_poll_box *}
{include file="1549834.tpl"}
<br>
{*get_bookmark_statistics_box*}

{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=666 valign='top'>

{*node_content*}
<div class='bordered' id='topic'>
{$node.node_content}
</div>
<br /><br />

{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
{if $permissions.w eq true}{*addnode*}{include file="1548927.tpl"}{/if}
{*get_threaded_children*}{include file="1549839.tpl" children_type=4}

</form>
<!--end of central column-->

</td></tr></table>

{*footer*}{include file="1672111.tpl"}