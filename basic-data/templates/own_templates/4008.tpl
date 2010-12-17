{* header *}
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/645341.tpl' media='screen'>
{if $user_id eq false}
<center>{* loginbox *}{include file='1549885.tpl'}</center>
{/if}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

<!--left column-->
<div id='left-panel' style='width: 142px; float: left; padding: 3px;'>
	<center>
	<img src='{get_image_link id=$node.node_id}' style='max-width: 123px;' /></center><br />
	name:: <b>{$node.node_name}</b><br />
	born:: <b>19:45:00 - 04.01.1989</b><br />
	kyber-born:: <b>{$node.node_created|date_format:"%H:%M:%S - %d.%m.%Y"}</b><br />
<br/><br/>
<center>
<a href='/id/{$node.node_id}/1961036'>neurons</a><br />
<a href='/id/{$node.node_id}/1961037'>statistics</a>|<a href='/id/{$node.node_id}/748131'>sort</a><br />
<a href='/id/{$node.node_id}/14'>source</a><br />
<a href='/id/{$node.node_id}/30'>tiamat</a><br />
<a href='/id/{$node.node_id}/15'>k</a><br />
<a href='/id/{$node.node_id}/2224463'>commanders</a><br />
<span class='node_info2'>
<br>node viewed {$node.node_views} times
<br>total descendants::{$node.node_descendant_count}
<br>total children::{$node.node_children_count}
{if $node.node_user_subchild_count neq false}</span>
<br><span class='most_important'>{$node.node_user_subchild_count} NEW</span>
{/if}
{if $node.k neq false}
<br><span class='most_important'>{$node.k} K</span><br><br>
{/if}

{if $offset neq false}
<br><span class='important'>using offset:: {$offset} </span>
{/if}

<form action='/id/{$node.node_id}/' method='post'>
  {if $node.node_bookmark neq 'yes'}
  <input type='submit' name='event' value='book' class='book_b'>
  {else}
  <input type='submit' name='event' value='unbook' class='book_b'>
  {/if}
  &nbsp;<input type='submit' name='event' value='K'>
</form>

<br>
{if $node.external_link eq 'db://user' or $node.external_link eq 'session://user' or $node.template_id eq 7}
<a href='/id/{$node.node_id}/1970182'>bookmarks</a><br />
<a href='/id/{$node.node_id}/1911535'>movement</a><br /><br />
<a href='/id/{$node.node_id}/1757900'>nodeshells</a><br />
<a href='/id/{$node.node_id}/1761254'>forums</a><br />
<a href='/id/{$node.node_id}/1573668'>submissions</a><br />
<a href='/id/{$node.node_id}/1773535'>articles</a><br />
<a href='/id/{$node.node_id}/1757556'>blogs</a><br />
<a href='/id/{$node.node_id}/1757626'>datas</a><br />
<a href='/id/{$node.node_id}/1752584'>K</a><br /><br />
<a href='/id/{$node.node_id}/1769388'>friends</a><br />
{/if}
</center>
</div>

<div style='float: left; width: 680px;'>

<div class='bordered' id='topic'>
{$node.node_content|nl2br}
</div>
<br /><br />

{* shows what other friends think about users *}
{get_children_by_external_link external_link='session://friend' listing_amount='2323' offset=$offset orderby='desc' orderby_type='nodes.node_id'}

{foreach from=$get_children_by_external_link item=child}
<div style='width: 666px;'>
<img src='{get_image_link id=$child.node_creator}' style='width: 50px; margin: 2px; float: left;'>
<div style='width: 600px; float: left;'><div style='background-color: #222; border-bottom: solid 1px #008000; width: 100%; vertical-align: top; align: left; padding: 0pt;'>
{if $child.template_id eq 6 }
<center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{elseif $child.template_id eq 5 }
<center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{else}

comment::<a href='/id/{$child.node_id}'>{$child.node_name}</a> by
&nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[<a href='/id/{$child.user_action_id}/'>{$child.user_action}</a>]
{/if}
{/if}

<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</div>
<div>{$child.node_content|nl2br}</div>
</div>
</div>
<br style='clear: both;' />
{/foreach}

<form method='post' action='/id/{$node.node_id}'>
<BR>
<textarea name='node_content'>{$post_vars.node_content}</textarea>
<br>
{if $permissions.w eq true}
<!--
pridane input z template_id 8ckou.
vid /id/1860668
[pyxel]
-->

<input type='hidden' name='template_id' value='8'>
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='hidden' name='external_link' value='session://friend'>
<table><tr><td><input type='submit' name='event' value='add'>
<td> with name:</td> <td><input type='text' name='node_name'></td>
</table>
{/if}

</form>
<form method='post'> <table align='center'><tr> <td><input type='hidden' name='get_children_offset' value='{$offset}'></td> <td><input type='submit' name='get_children_move' value='<'></td> <td><input type='submit' name='get_children_move' value='<<'></td> <td><input name='get_children_move' type='submit' value='>>'></td> <td><input type='submit' name='get_children_move' value='>'></td> </tr></table> </form>

<!--end of central column-->

</div>
<br style='clear: both;'>