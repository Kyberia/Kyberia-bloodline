{* header *}{include file="1549864.tpl"}
<style>
{literal}
.ah {display:none}
a:hover .ah {display:block; position:absolute; top:23px;left:10px;}
{/literal}
</style>
<br><br><br><br><br><br><br><br><br>

<form method='post'>
<input tabindex=1 type='text' value='{$smarty.post.query}' name='query' id='query'><script language="Javascript">document.getElementById('query').focus();</script>
  <input type='submit' name='template_event' tabindex=2 value='search'><br><br>
  order by matches count:
  <input type='radio' name='orderby' value='probability'> &nbsp; K<input type='radio' name='orderby' value='k'>&nbsp;
  node views:
  <input type='radio' name='orderby' value='node_views'>&nbsp;node created: <input type='radio' name='orderby' value='node_created'>
</form>
<br><br>
{if $smarty.post.query}
{get_search query=$smarty.post.query listing_amount=$listing_amount offset=$offset}
{foreach from=$get_search_short item=found}
<a href='/id/{$found.node_id}'>{$found.node_id}<span class='ah'>{$found.node_name}<br>---<br>{$found.node_content|strip_tags}</span></a>,
{/foreach}
<br><br>

{foreach from=$get_search item=child}
<a href='/id/{$child.node_id}'>{$child.node_id}<span class='ah'>{$child.node_name}<br>---<br>{$child.node_content|strip_tags}</span></a>,
{/foreach}
{/if}
<br><br>
