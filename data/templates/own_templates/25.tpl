{* header *}{include file="1549864.tpl"}

<br><br><br>
<center>
<form method='post'>
<div style='color:red;'>UPOZORNENIE!!: fulltext search sa updatuje kazdy den. cize ak nieco neviete najst dnes skuste zajtra. prajem pekny den</div>
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
<a href='/id/{$found.node_id}'>{$found.node_name}</a><br>
{/foreach}
<br><br>

{foreach from=$get_search item=child}
<table class='bordered' cellspacing='0' cellpadding='0'>
  <tr>
    <td align='center' valign='top' rowspan='2'>
      <img vspace='5' hspace='5' width='50' src='{get_image_link id=$child.node_creator}'>
      {if $child.k eq true}
      <span class='most_important'>{$child.k} k</span>
      {/if}
    </td>
    <td valign='top' style='width: 100%'>
      <table width=100%>
        <tr class='header' width=100% valign='top'>
          <td>
            &nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
            {if $child.user_action neq false}
            &nbsp;[lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]
            {/if}
            &nbsp;&nbsp;{$child.node_created|date_format:"%H:%M:%S - %d.%m.%Y"}&nbsp;
            &nbsp;&nbsp;<a href='/id/{$child.node_id}'>{$child.node_name}</a>&nbsp;&nbsp;
            {if $child.node_created > $node.last_visit}
            <span class='most_important'>&nbsp;&nbsp;NEW</span>
            {/if}
            {if $child.node_children_count}
            <span class='most_important'>{$child.node_children_count}&nbsp;&nbsp;CHILDREN</span>
            {/if}
          </td>
        </tr>
        <tr>
          <td>{$child.node_content|truncate:320|stripslashes}</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br>

{/foreach}
{/if}
</center><br><br>
{*footer*}{include file="1549377.tpl"}