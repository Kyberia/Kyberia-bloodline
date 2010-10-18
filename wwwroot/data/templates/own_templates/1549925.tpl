<div id='left-panel'>
<table>
  <tr>
    <td colspan='2' align='center'><img src='{get_image_link id=$node.node_id}' style='max-width:123px;' /></td>
  </tr>
  <tr>
    <td>node:</td>
    <td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td>
  </tr>
  <tr>
    <td>template:</td>
    <td><a href='/id/{$node.template_id}'>{$node.template_id}</a></td>
  </tr>
  <tr>
    <td>parent:</td>
    <td><a href='/id/{$node.node_parent}'>{$node.node_parent_name}</a></td>
  </tr>
  <tr>
    <td>owner:</td>
    <td><a href='/id/{$node.node_creator}'>{$node.owner}</a></td>
  </tr>
</table>
<br/><br/>

{* cwbe *}{include file='1555468.tpl'}

<table class='bordered' id='node_perm'>
  <tr>
    <td colspan='2' align='center' class='important'>permissions</td>
  </tr>
  <tr>
    <td>you:</td>
    <td align='center'>
      {if $permissions.r}r,{/if}
      {if $permissions.w}w,{/if}
      {$node.node_permission}
    </td>
  </tr>
  <tr>
    <td>system:</td>
    <td align='center'>{$node.node_system_access}</td>
  </tr>
  <tr>
    <td>net:</td>
    <td align='center'>{$node.node_external_access}</td>
  </tr>
</table>

<br>
<center><a href='/id/{$node.node_id}/1961036'>neurons</a></center>
<br>
<center><a href='/id/{$node.node_id}/1961037'>stats</a>|<a href='/id/{$node.node_id}/748131'>by_visit</a>|<a href='/id/{$node.node_id}/1908499'>by_K</a></center>
<!-- <center><a href='/id/{$node.node_id}/offtopic'>offtopic</a></center> -->
<center><a href='/id/{$node.node_id}/14'>source</a></center>
<center><a href='/id/{$node.node_id}/30'>tiamat</a></center>
<!-- <center><a href='/id/{$node.node_id}/links'>links</a></center> -->
<!-- <center><a href='/id/{$node.node_id}/print'>print</a></center> -->
<center><a href='/id/{$node.node_id}/15'>k</a></center>
<center><a href='/id/{$node.node_id}/2224463'>commanders</a></center>
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
  <input type='submit' name='event' value='K'>
  {if $fook[$node.node_id] neq true}
  <br /><br /><input type='submit' name='event' value='fook' class='book_b'>
  {/if}
</form>

{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<center><a href='/id/{$node.node_id}/1961033'>configure</a><br><a href='/id/{$node.node_id}/1549314'>anketa</a></center>{/if}
<center>show[ <a href='/id/{$node.node_id}/2'>2</a> | <a href='/id/{$node.node_id}/3'>3</a> ] <a href='/id/{$node.node_id}/1549582'>flat</a></center>
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
</div>