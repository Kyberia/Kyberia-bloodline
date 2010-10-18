{if $header_id neq true}
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
    <link rel='stylesheet' type='text/css' href='/data/css/main.css'>
    <title>
      {* title *}{include file="791948.tpl"}
    </title>
  </head>
  <body>
{/if}
{if $user_id eq true}
{if $header_id neq true} {* toolbar *}{include file="1549959.tpl"}
{/if}
{/if}
{literal}
<style>
.cmnt {font-size:80%;}
.cmnt a {font-size:100%;}

</style>
{/literal}

<div style="text-align:left; position:relative; width: 780px; margin: 0 auto;">
  <img src="/upload/top.gif">
  <div style="border:1px solid #6dae42; border-top:0; width: 778px; _width:780px;">
    <!-- left column -->
    <div style="float: left; width:25%; margin-left:5px;">
      <!-- data nodes -->
      <span class="important">latest data nodes::</span><br><span class='cmnt'><a href="/id/683643/2080947">books</a>&laquo;</span><br><br>
      {get_nodes_by_type type=12 listing_amount=23 offset=$offset}
      {foreach from=$get_nodes_by_type item=child}
		  <a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:40:"<br>":true}</a><br>
		  <span class='cmnt'>by <a href='/id/{$child.node_creator}'>{$child.login|wordwrap:40:"<br>":true}</a>
		  in <a href='/id/{$child.node_parent}'>{$child.parent_name|wordwrap:40:"<br>":true}</a></span><br><br>

      {/foreach}
      <!-- end of datanodes -->
    <br><br><br>
      <!-- blogs -->
      {get_nodes_by_parent parent=21 listing_amount=18 offset=$offset}
      <span class='important'>user blogs::</span><Br><Br>
      {foreach from=$get_nodes_by_parent item=child}
      <img src='{get_image_link id=$child.node_creator}' align='left' hspace='5' vspace='5' border='0'>
      <a href='/id/{$child.node_id}'>{$child.node_name|strip_tags:false|wordwrap:20:"<br>":true}</a><br>{$child.node_content|truncate:66|stripslashes|wordwrap:20:"<br>":true|strip_tags:false}
			<span class='cmnt'><br>by <a href='/id/{$child.node_creator}'>{$child.login}</a> {$child.node_views} views
      </span><br><br style="clear:left;">

      {/foreach}
      <!-- end of blogs -->
      {* node_settings *}{include file="1549925.tpl"}
    </div>
    <!-- end of left column -->
    <!-- central column -->
    <div style="float: left; width:50%;  _width:360px; margin-left:5px;">
      {* loginbox *}{include file="1549885.tpl"}<br>
      <!-- forums -->
      <span class='important'>latest forums::</span><br><br>
      {get_linked_nodes node_id=1058182 listing_amount=23}
      {foreach from=$get_linked_nodes item=child}
      <a href='/id/{$child.node_id}'>{$child.node_name|strip_tags|stripslashes}</a>
      <span class='cmnt'>by <a href='/id/{$child.node_creator}'>{$child.login}</a>
      ({$child.node_children_count} children)</a></span><br>

      {/foreach}<br>
      <!-- end of forums -->
      <!-- articles -->
      {get_linked_nodes node_id=1 listing_amount=23}<br>
      <span class='important'>latest articles::</span><br><br>
      {foreach from=$get_linked_nodes item=child }
      <div style="border:1px solid #6dae42; margin-bottom:8px;">
        <img width=75 src='{get_image_link id=$child.node_id}' hspace='5' vspace='5' style='float:left; border:0;'>
        <a href='/id/{$child.node_id}'>{$child.node_name}</a><br>
        {$child.node_content|truncate:320|stripslashes|strip_tags:false}
        <br><br><span class='cmnt'>node created by <a href='/id/{$child.node_creator}'>{$child.login}</a>,synapse link created by <a href='/id/{$child.synapse_creator}'>{$child.linker}</a></span><br style='clear:left;'>
      </div>

      {/foreach}
      <!-- end of articles -->
      <br>
    </div>
    <!-- end of central column -->
    <!-- right column -->
    <div style="float:right; width: 20%; margin-right:5px; margin-top:23px;">
      <center><a href='/id/31'>register</a><br><a href='/id/17/' title='request password'>request password</a>
      <form action='/id/25/' method='post'>
        <input type='text' value='{$smarty.post.query}' name='query'>
        <input type='submit' name='template_event'  value='search'><br>
      </form><br><br>
      </center>
      {* get_userlist *}{include file="1549848.tpl"}
    </div>
    <!-- end of right column -->
  </div>
<br style="clear:both;">

</div>
{* footer *}{include file="1549377.tpl"}