<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<meta http-equiv="content-type" content="text/html; charset=windows-1250" />
<meta name="author" content="marek mahut" />
<meta name="keywords" content="konexia" />
<meta name="description" content="kyberia template contest" />
<meta name="robots" content="all" />
<title>[K]onexia world</title>
</head>
aaaaaaaaaaaaaaaaaaaaaaaaaaaa
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
{* node_settings *} {include file="1549925.tpl"}
{* get_poll_box *} {include file="1549834.tpl"} <br>
{*get_bookmark_statistics_box*} {include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=66% valign='top'>
{*node_content*} {include file="1549916.tpl"}
{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/
{if $action neq false}{$action}{/if}' method='post' name='formular'>

{if $permissions.w eq true}{include file="1548927.tpl"}{else}{* read-only *}{include
file="2264143.tpl"}{/if}
{include file="1549839.tpl"}
</form>
<!--end of central column-->

</td></tr></table>

{*footer*}{include file="1549377.tpl"}
</body>
</html>