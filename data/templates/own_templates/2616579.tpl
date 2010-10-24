{* header *}{include file="1549864.tpl"}

{if $error eq true} <center><font style='error'>{$error}</font></center> {/if}

{if $user_id eq false} <center>{* loginbox *}{include file="1549885.tpl"}</center> {else}
<table width='812' cellspacing=0 cellpadding=10 style='color:#57938f ' align='center'><tr>
<!--left column-->
<td valign='top' align='center' width='130' style='border:1px dashed #57938f ;color:black;background:#1b2e2d'>
{* node_settings *}
<table  style='border:1px dashed #57938f ;color:black'>
<tr><td colspan='2' align='center'>
<img src='{get_image_link id=$node.node_id}'>
</td></tr>
<tr><td>node:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>template:</td><td><a href='/id/{$node.template_id}'>{$node.template_id}</a></td></tr>
<tr><td>parent:</td><td><a href='/id/{$node.node_parent}'>{$node.node_parent_name}</a></td></tr>
<tr><td>owner:</td><td><a href='/id/{$node.node_creator}'>{$node.owner}</a></td></tr>
</table>
<br>
<table  style='border:1px dashed #57938f ;color:black'>
<tr><td colspan='2' align='center' class='important'>permissions</td></tr>
<tr><td>you:</td><td align='center'>
{if $permissions.r}r,{/if}
{if $permissions.w}w,{/if}
{$node.node_permission}
</td></tr>
<tr><td>system:</td><td align='center'>{$node.node_system_access}</td></tr>
<tr><td>net:</td><td align='center'>{$node.node_external_access}</td></tr>
</table>
<br>
<center><a href='/id/{$node.node_id}/1961036'>neurons</a></center>
<br>
<center><a href='/id/{$node.node_id}/1961037'>stats</a><a href='/id/{$node.node_id}/748131'>/sort</a><a href='/id/{$node.node_id}/1908499'>/by K</a></center>
<!-- <center><a href='/id/{$node.node_id}/offtopic'>offtopic</a></center> -->
<center><a href='/id/{$node.node_id}/14'>source</a></center>
<center><a href='/id/{$node.node_id}/30'>tiamat</a></center>
<!-- <center><a href='/id/{$node.node_id}/print'>print</a></center> -->
<center><a href='/id/{$node.node_id}/15'>k</a></center>
<center><a href='/id/{$node.node_id}/2224463'>commanders</a></center>
<table>
<tr>
<td colspan='2' align='center'>
<br><span class='important' style='color:black'>node viewed {$node.node_views} times</span>
<br><span class='important' style='color:black'>total descendants::{$node.node_descendant_count}</span>
<br><span class='important' style='color:black'>total children::{$node.node_children_count}</span>
{if $node.node_user_subchild_count neq false}
<br><span class='most_important' style='color:black'>{$node.node_user_subchild_count} NEW</span>
{/if}
{if $node.k neq false}
<br><span class='most_important' style='color:black'>{$node.k} K</span><br><br>
{/if}

{if $offset neq false}
<br><span class='important' style='color:black'>using offset:: {$offset} </span>
{/if}
</td>
</tr>
<form action='/id/{$node.node_id}/' method='post'>
<tr><td colspan='2' align='center'>
{if $node.node_bookmark neq 'yes'}
<input  style='border:1px solid #57938f ' type='submit' name='event' value='book'>
{else}
<input  style='border:1px solid #57938f ' type='submit' name='event' value='unbook'>
{/if}
&nbsp;
<input  style='border:1px solid #57938f ' type='submit' name='event' value='K'>
</td></tr>
</form>
</table>
{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<center><a href='/id/{$node.node_id}/1961033'>configure</a></center>{/if}
<br>
<a href='/id/{$node.node_id}/1970182'>bookmarks</a><br />
 <a href='/id/{$node.node_id}/1911535'>movement</a><br />
 <br /> <a href='/id/{$node.node_id}/1757900'>nodeshells</a><br />
  <a href='/id/{$node.node_id}/1761254'>forums</a><br />
  <a href='/id/{$node.node_id}/1573668'>submissions</a><br />
  <a href='/id/{$node.node_id}/1773535'>articles</a><br />
  <a href='/id/{$node.node_id}/1757556'>blogs</a><br />
  <a href='/id/{$node.node_id}/1757626'>datas</a><br />
   <a href='/id/{$node.node_id}/1752584'>K</a><br /><br />
   <a href='/id/{$node.node_id}/1769388'>friends</a><br />
<br>



{* showing poll *}{*include file="1549834.tpl"*}
<br> {*showing bookmark_statistics*}{include file="1549386.tpl"} </td>
 <!--end of left column--> <!--main central column-->
 <td valign='top' style='border:1px dashed #57938f ;border-left:0;'>
<table width='666' style='border:1px dashed #57938f ;background:#1b2e2d;'><tr><td>
{$node.node_content|nl2br}
</td></tr></table><br><br>
  {* shows what other friends think about users *}
   {get_children_by_external_link external_link='session://friend' listing_amount=$listing_amount offset=$offset orderby=desc}
   {foreach from=$get_children_by_external_link item=child}
    <br>
	<table style='border:1px solid #a2ccca; padding:0; background:#1a2f2e;' width='666' >
	<tr> <td valign='top' rowspan='2'><img width='50' hspace='5' src='{get_image_link id=$child.node_creator}'>&nbsp;</td>
	<td valign='top' width='100%'> <table width='100%'><tr class='header' valign='top'> <td>

	{if $child.template_id eq 6 }
	 <center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
	  {elseif $child.template_id eq 5 } <center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
	  {else}

	  comment::<a href='/id/{$child.node_id}'>{$child.node_name}</a> by
	  &nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
	   {if $child.user_action neq false}
	    &nbsp;[<a href='/id/{$child.user_action_id}/'>{$child.user_action}</a>] {/if} {/if} <br>
		&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center>
		 <tr><td>{$child.node_content|nl2br}</td></tr> </table> </table>
		  {/foreach} <form method='post' action='/id/{$node.node_id}'> <BR>
		   <textarea  style='border:1px solid #57938f ' name='node_content'>{$post_vars.node_content}</textarea> <br>
		   {if $permissions.w eq true} <!-- pridane input z template_id 8ckou. vid /id/1860668 [pyxel] -->
		   <input type='hidden' name='template_id' value='8'> <input type='hidden' name='node_parent' value='{$node.node_id}'> <input type='hidden' name='external_link' value='session://friend'>
		   <table><tr><td><input type='submit' style='border:1px solid #57938f ' name='event' value='add'> <td> <span style='color: #57938f '>with name:</span></td> <td><input style='border:1px solid #57938f ' type='text' name='node_name'></td> </table> {/if} </form> <form method='post'>
		    <table align='center'><tr> <td><input type='hidden' name='get_children_offset' value='{$offset}'></td> <td><input type='submit' style='border:1px solid #57938f ' name='get_children_move' value='<'></td> <td><input type='submit' style='border:1px solid #57938f ' name='get_children_move' value='<<'></td>
			 <td><input name='get_children_move'  type='submit' style='border:1px solid #57938f ' value='>>'></td> <td><input  type='submit' style='border:1px solid #57938f ' name='get_children_move' value='>'></td> </tr></table> </form> <!--end of central column--> </td></tr></table> {/if}
