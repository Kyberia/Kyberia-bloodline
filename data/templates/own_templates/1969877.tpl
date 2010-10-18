{get_movement_params children_count=$node.node_children_count}
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='/data/css/main.css'>
<title>prava sa nerozdavaju ale beru</title>
</head>

<body>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $user_id eq true}{if $header_id neq true}{include file="1549959.tpl"}{/if}{/if}
{if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
{if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}


<table align='center' valign='top' class='bordered' width='865'>
<tr><td colspan='3' align='center' valign='top'>
</td></tr>
<tr>
<td align='left' valign='top' width='230'>
{include file="1549925.tpl"}
</td>
<td valign='top' width='468'>
<center>Ustava: Senat nemoze odhlasovat svoje zrusenie.</center>
<form method='post'>
<table class='bordered'>
<tr><td colspan='2' align='center' class='important'>Nova ziadost do senatu</td></tr>
<tr><td  class='important'>Nazov ziadosti::</td><td><input type='text' style='width: 230px;' name='node_name'></td>
</tr>
<tr><td  class='important'>Obsah ziadosti::</td>
<td><textarea name='request_content'></textarea>
</tr>
</td></tr>
<tr>
<td  class='important'>Moznosti::</td>
<td><textarea name='options'></textarea><br><i>do ramceka zadaj lubovolne mnozstvo moznosti oddelene bodkociarkou (napr. ano;nie;mozno)</i>
</tr>
<tr><td align='center' colspan='2'><input type='submit' name='event' value='addSenateRequest'> </td></tr>
</table>

{if $template_event eq 'filter_by'}
{get_threaded_children listing_amount=23232322323 offset=$offset types=$children_types search_type=$post_vars.search_type search=$post_vars.node_content}

{else}

<br>
{get_nodes_by_parent parent=876611 listing_amount=666 offset=$offset}
<span class="important"> senate requests::</span><br>
{foreach from=$get_nodes_by_parent item=child}

{if $child.node_name neq 'approved citizenship request' || $child.node_name neq 'request for citizenship' }
<table width='666'>
<tr>

<td colspan='3'><a href='/id/{$child.node_parent}'>{$child.node_vector}</a></td>
</tr>

<td width='{math equation="(x-y)-8" x=$child.depth y=$node.vector_depth}%'></td>
<td valign='top' rowspan='2'><img src='{get_image_link id=$child.node_creator}' width='50' hspace='5' alt='' /></td>
<td width='{math equation="100-(x-y)" x=$child.depth y=$node.vector_depth}%'>
<table class='bordered' width='100%'><tr class='header'>
<td>
&nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[lokacia :: <a href='/{$child.user_actions}/'>{$child.user_action}</a>]
{/if}
&nbsp;&nbsp;<input type='checkbox' value='{$child.node_id}' name='node_chosen[]'>
&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
{if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
{if $child.node_status eq 'linked'}<span class='most_important'>HARDLINK</span>{/if}
{if $child.node_updated > $bookmarks.last_visit}<span class='most_important'>!!CONTENT CHANGED!!</span>{/if}
{if $bookmarks.last_visit eq true and $child.lastdescendant_created > $bookmarks.last_visit}<span class='most_important'>!!NEW DESCENDANT!!</span>{/if}


<div style='text-align:center;'>
{if $child.node_name eq ''}
<a href='/id/{$child.node_id}'>enter node {$child.node_id}</a>
{else}
<a href='/id/{$child.node_id}'>{$child.node_name}</a>
{/if}
{if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}| <a href='/id/{$child.node_id}/1961033'>conf</a>{/if}
</div>
<tr><td>{$child.node_content|stripslashes|nl2br}</td></tr>
</table>
</table>
{/if}
{/foreach}
<br><br>

<span class="important"> reuests for citizenship::</span><br>
{foreach from=$get_nodes_by_parent item=child}
{if $child.node_name eq 'request for citizenship' }

{/if}
{/foreach}
<br><br>
<span class="important"> approved citizen requests::</span><br>
{foreach from=$get_nodes_by_parent item=child}

{if $child.node_name eq 'approved citizenship request' }

{/if}
{/foreach}

</form>

</td>
<td valign='top' width='165'>
	<center><br><a href='/id/1058820'>become citizen</a>
	<br><br>
<form action='/id/25/' method='post'>
<input type='text' value='{$smarty.post.query}' name='query'>
<input type='submit' name='template_event'  value='search'><br>
</form><br><br>
</center>
	{include file="1549803.tpl"}

<a href='/id/876611/15'>Najuspesnejsie hlasovania</a>
<br><br>
<a href='/id/876611/788016'>Najzhavejsie hlasovania</a>

</td>

</tr>
</table>
{include file="1549377.tpl"}



<center>

</center>











