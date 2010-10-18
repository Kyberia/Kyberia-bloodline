{include file="1549864.tpl"}
{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
 {if $permissions.w eq true}{*addnode*}{include file="1548927.tpl"}{/if}

{math equation="x/8" x=$node.vector_depth assign="crd"}
{if $template_event eq 'preview'}
<table width=666>
  <tr>
    <td valign='top' rowspan='2' ><img hspace='5' src='{get_image_link id=$user_id}'></td>
    <td width='100%' valign='top'>
      <table width='100%'>
        <tr class='header'><td align='center'>PREVIEW</td></tr>
        <tr><td>{$post_vars.node_content|preview}</td></tr>
      </table>
</table>
{* end of preview *}
{elseif $template_event eq 'filter_by'}
{get_threaded_children listing_amount=23232322323 offset=$offset types=$children_types search_type=$post_vars.search_type search=$post_vars.node_content}
{elseif $node.node_user_subchild_count eq true}
{get_threaded_children offset=0 link='yes' listing_amount=23232323232 time=$node.last_visit time=$node.last_visit orderby=$listing_order }
<!--<center><span class='most_important'>pozor doslo k zmene funkcnosti systemu, NEW prispevky (vsetky) sa zobrazuju od najstarsieho k najnovsiemu zhora dolu</span></center>-->
{else}
{get_threaded_children link='yes' listing_amount=$listing_amount offset=$offset ordearby=$listing_order}
{/if}

<ul style='width:611px; margin:0; padding-right:55px;' id='th_root'>
{section name=child loop=$get_threaded_children}{if $get_threaded_children[child].template_id neq 1549834}
{*position in tree*}
{math equation="(x/8)-y" x=$get_threaded_children[child].depth y=$crd assign="hierarch"}
{math equation="(x/8)-y" x=$get_threaded_children[child.index_prev].depth y=$crd assign="prev_depth"}
{math equation="(x/8)-y" x=$get_threaded_children[child.index_next].depth y=$crd assign="next_depth"}
{*depth in hierarchy*}
{if $smarty.section.child.last}{math equation="x-1" x=$hierarch assign="h_depth"}{else}{math equation="x-y" x=$hierarch y=$next_depth assign="h_depth"}{/if}
{*root_id decka*}
{str_split string=$get_threaded_children[child].node_vector name=hroot length=8}
{eval var=$str_split.hroot.$crd assign="h_root"}
{str_split string=$get_threaded_children[child.index_prev].node_vector name=proot length=8}
{eval var=$str_split.proot.$crd assign="p_root"}
{str_split string=$get_threaded_children[child.index_next].node_vector name=nroot length=8}
{eval var=$str_split.nroot.$crd assign="n_root"}
{*depth in hierarchy*}
{math equation="(x-y)-1" x=$hierarch y=$prev_depth assign="p_depth"}
{math equation="x-1" x=$hierarch assign="ph_depth"}
{math equation="x-y" x=$next_depth y=$hierarch assign="c_depth"}
{if $smarty.section.child.last}
{math equation="x-1" x=$hierarch assign="h_depth"}
{elseif $h_root neq $n_root && $get_threaded_children[child].node_status neq 'linked'}
{math equation="x-1" x=$hierarch assign="h_depth"}
{elseif $h_root neq $n_root && $get_threaded_children[child.index_next].node_status neq 'linked'}
{math equation="x-1" x=$hierarch assign="h_depth"}
{else}
{math equation="x-y" x=$hierarch y=$next_depth assign="h_depth"}
{/if}
{math equation="x+1" x=$crd assign="starter"}
{eval var=$get_threaded_children[child].node_creator assign="h_creator"}

{*child content*}
{capture name=child_container}
{*IGNORE USER CONDITION*}{if $ignore[$h_creator] neq true}
{* put.Ty hack *}{if $get_threaded_children[child].synapse_creator neq ''}
  <img src='{get_image_link id=$get_threaded_children[child].synapse_creator}' width='50' alt='SYNAPSE CREATOR' style='float:left;' />
{else}
  <img src='{get_image_link id=$get_threaded_children[child].node_creator}' width='50' alt='{$get_threaded_children[child].login}' onclick="km();sm('{$get_threaded_children[child].login}','{$get_threaded_children[child].node_creator}','{$node.node_id}')" style='float:left;' />
{/if}{*end of put.Ty hack *}
<div class='bordered' style='margin-left:5px; display:table; overflow:visible; padding:2px; width:100%;'>
	<div class='th_header'>
		<a href='/id/{$get_threaded_children[child].node_creator}'>{$get_threaded_children[child].login}</a>
		<input type='checkbox' value='{$get_threaded_children[child].node_id}' name='node_chosen[]' />
		{$get_threaded_children[child].node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
		{if $get_threaded_children[child].node_updated}
		(modif: {$get_threaded_children[child].node_updated|date_format:"%d.%m.%Y. - %H:%M:%S"})
		{/if}
		{if $get_threaded_children[child].k > 0}
		[<span class='most_important'>{$get_threaded_children[child].k}K</span>]
		{/if}
		{if $get_threaded_children[child].node_created > $node.last_visit}
		<span class='most_important'>&nbsp;&nbsp;NEW</span>
		{/if}
		{if $get_threaded_children[child].node_status eq 'linked'}
		<span class='most_important'>&nbsp;HARDLINK</span>
		{/if}
		{if $get_threaded_children[child].node_updated > $node.last_visit}
		<span class='most_important'>&nbsp;!!CONTENT CHANGED!!</span>
		{/if}
		<div style='text-align:center;'>
			{if $get_threaded_children[child].node_name eq ''}
			<a href='/id/{$get_threaded_children[child].node_id}'>enter node {$get_threaded_children[child].node_id}</a>
			{else}
			<a href='/id/{$get_threaded_children[child].node_id}'>{$get_threaded_children[child].node_name|strip_tags}</a>
			{/if}
			{if $child.node_creator eq $user_id}
			| <a href='/id/{$get_threaded_children[child].node_id}/1961033'>conf</a>
			{/if}
		</div>
	</div>
	<div class='th_content' style='margin-top: 5px; position:relative;'>
	{$get_threaded_children[child].node_content|stripslashes|nl2br}
	</div>
</div>
{/if}{*IGNORE USER CONDITION end*}
{/capture}
{*end of child content*}

{*stromcek prestri sa*}
{if $smarty.section.child.first && $sterter < $hierarch}
{section name=sta loop=$ph_depth}
<li class='empty_thread' ><ul>
{/section}
{/if}
{if $get_threaded_children[child].node_parent neq $node.node_id && $get_threaded_children[child].node_status neq 'linked' && $get_threaded_children[child].node_parent neq $get_threaded_children[child.index_prev].node_id && $prev_depth < $hierarch}
{section name=sta loop=$p_depth}
<li class='empty_thread'><ul>
{/section}
{elseif $get_threaded_children[child].node_parent neq $node.node_id && $get_threaded_children[child.index_prev].node_status neq 'linked' && $get_threaded_children[child].node_parent neq $get_threaded_children[child.index_prev].node_id && $prev_depth < $hierarch}
{section name=sta loop=$p_depth}
<li class='empty_thread'><ul>
{/section}
{elseif $h_root neq $p_root && $get_threaded_children[child].node_parent neq $node.node_id && $get_threaded_children[child].node_status neq 'linked'}
{section name=sta loop=$ph_depth}
<li class='empty_thread'><ul>
{/section}
{elseif $h_root neq $p_root && $get_threaded_children[child].node_parent neq $node.node_id && $get_threaded_children[child.index_prev].node_status neq 'linked'}
{section name=sta loop=$hp_depth}
<li class='empty_thread'><ul>
{/section}
{/if}
  <li class='sub{$get_threaded_children[child].node_creator}' style='list-style-type:none;'>
    <a href='/id/{$get_threaded_children[child].node_parent}' class='vector'>{$get_threaded_children[child].node_vector}</a>
    <div class='th_cnt'>
      {$smarty.capture.child_container}
    </div>
{if $next_depth > $hierarch && $h_root neq $p_root && $get_threaded_children[child].node_parent neq $node.node_id}
{section name=con loop=$c_depth}
  <ul>
    <li class='empty_thread'>
{/section}

{elseif $next_depth > $hierarch && $h_root eq $n_root && $get_threaded_children[child.index_next].node_status neq 'linked'}
    <ul>{elseif $next_depth > $hierarch && $get_threaded_children[child.index_next].node_status eq 'linked'}<ul>{else}
  </li>
{/if}{if $next_depth < $hierarch || $h_root neq $n_root || $smarty.section.child.last}
{section name=fin loop=$h_depth}
  </ul>
</li>
{/section}{/if}
{/if}{/section}
</ul>

<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>
</form>
