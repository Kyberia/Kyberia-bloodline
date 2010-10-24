{include file="1549864.tpl"}
<link rel='stylesheet' type='text/css' href='http://x86.sk/~marin/css/mrn-k.css'>
{if $error eq true}
<center><span class='error'>{$error}</span></center>
{/if}
{if $user_id eq false}

<center>{include file="1549885.tpl"}</center>

{else}
<br /><!--
<center>
mouth of depleted is nothing caught<br />
the trap concealed in a restless plot<br />
read fix equation no artificial sum<br />
minus addition is nothing</center> 
<br />  -->
<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
<table>
<tr><td colspan='2' align='center'>
<img src='{get_image_link id=$node.node_id}'>
</td></tr>
<tr><td>node:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<!--<tr><td>template:</td><td><a href='/id/{$node.template_id}'>{$node.template_id}</a></td></tr>--> 
<!--<tr><td>parent:</td><td>mamina&ocino zaco im 'dakujem'</td></tr>--> 
<tr><td>owner:</td><td><a href='/id/{$node.node_creator}'>{$node.owner}</a></td></tr>
<tr><td>datetime:</td><td>23.06.1983</td></tr>
</table>
<br><!--
<table class='bordered'>
<tr><td colspan='2' align='center' class='important'>permissions</td></tr>
<tr><td>you:</td><td align='center'>
{if $permissions.r}r,{/if}
{if $permissions.w}w,{/if}
{$node.node_permission}
</a></td>
<tr><td>system:</td><td align='center'>{$node.node_system_access}</a></td>
<tr><td>net:</td><td align='center'>{$node.node_external_access}</a></td>
</table> -->
<br>
<center><a href='/id/{$node.node_id}/1961036'>neurons</a></center>
<br>
<center><a href='/id/{$node.node_id}/1961037'>statistics</a><!-- ||<a href='/id/{$node.node_id}/748131'>sort</a></center> -->
<!-- <center><a href='/id/{$node.node_id}/links'>links</a></center> -->
<!-- <center><a href='/id/{$node.node_id}/30'>tiamat</a> -->

<table>
<tr>
<td colspan='2' align='center'>

{if $node.node_user_subchild_count neq false}
<br><span class='most_important'>{$node.node_user_subchild_count} NEW</span>
{/if}
{if $node.k neq false}
<br><span class='most_important'>{$node.k} K</span><br><br>
{/if}

{if $offset neq false}
<br><span class='important'>using offset:: {$offset} </span>
{/if}
</td></tr><center>
<form action='/id/{$node.node_id}/' method='post'>

{if $node.node_bookmark neq 'yes'}
<input type='submit' name='event' value='book'>
{else}
<input type='submit' name='event' value='unbook'>
{/if}
&nbsp;
<input type='submit' name='event' value='K'>

</form></center>

{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<center><a href='/id/{$node.node_id}/1961033'>configure</a></center>{/if}
<br>

<a href='/id/{$node.node_id}/1757900'>nodeshells</a><br />
<a href='/id/{$node.node_id}/1761254'>forums</a><br />
<a href='/id/{$node.node_id}/1573668'>submissions</a><br />
<a href='/id/{$node.node_id}/1773535'>articles</a><br />
<a href='/id/{$node.node_id}/1757556'>blogs</a><br />
<a href='/id/{$node.node_id}/1757626'>datas</a><br /><br />
<a href='/id/{$node.node_id}/1769388'>friends</a><br />

{* showing poll *}
{*include file="modules/get_poll_box.tpl"*}

<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column  <center>{include file="modules/movement.tpl"}</center><br />
{include file="modules/get_creation_by_template_id.tpl" listing_amount=$listing_amount type=$action} -->
<td valign='top'>

{if $action eq true}


{include file="modules/get_creation_by_template_id.tpl" listing_amount=101 type=$action}

{else}
<table width='666' border=0><tr><td>
{$node.node_content|nl2br}
</td></tr></table><br><br>
{* shows what other friends think about users *}
{get_children_by_external_link external_link='session://friend' listing_amount=1666 offset=$offset orderby=desc}
{foreach from=$get_children_by_external_link item=child}

<table>
<tr>
<td valign='top' rowspan='2'><img width='50' hspace='5' src='{get_image_link id=$child.node_creator}'>&nbsp;</td>
<td valign='top' width='100%'>
<div class='com'><div class='header'>
{if $child.template_id eq 6 }
<center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{elseif $child.template_id eq 5 }
<center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{else}
|||<a href='/id/{$child.node_id}'>{$child.node_name}</a>|||<a href='/id/{$child.node_creator}'>{$child.login}</a>

{/if}
<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center></div>
{$child.node_content}</div></td></tr>
</table>
{/foreach}


<form method='post' action='/id/{$node.node_id}'>
<BR>
<textarea name='node_content'>{$post_vars.node_content}</textarea>
<br>
{if $permissions.w eq true}
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='hidden' name='external_link' value='session://friend'>
<table><tr><td><input type='submit' name='event' value='add'>
<td> with name:</td> <td><input type='text' name='node_name'></td>
</table>
{/if}


</form>
{/if}
<!--end of central column-->

{/if}
<!--
<center>|chjaj|</center>

obcane.. rozejdete se... tahle manifestace neni povolena

<br /><br /><br /><br /><br /><br /><br /><br /><br />
aj slepý si aspoò predstavuje;<br /><br /><br />


vlastne nezáleží asi na tom, že ste hluchí
<br />
keï ja, som aj tak nemý -->