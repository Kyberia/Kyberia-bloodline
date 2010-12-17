{math equation="x/8" x=$node.vector_depth assign="crd"}
{get_threaded_children link='yes' listing_amount=$listing_amount offset=$offset ordearby=$listing_order}
<ul style='width:666px'>
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

{*obsah childu*}
{capture name=child_container}
{$hierarch}
{/capture}

{*stromcek prestri sa*}
{if $smarty.section.child.first && $sterter < $hierarch}
{section name=sta loop=$ph_depth}
<li><ul>
{/section}
{/if}
{if $get_threaded_children[child].node_parent neq $node.node_id && $get_threaded_children[child].node_status neq 'linked' && $get_threaded_children[child].node_parent neq $get_threaded_children[child.index_prev].node_id && $prev_depth < $hierarch}
{section name=sta loop=$p_depth}
<li><ul>
{/section}
{elseif $get_threaded_children[child].node_parent neq $node.node_id && $get_threaded_children[child.index_prev].node_status neq 'linked' && $get_threaded_children[child].node_parent neq $get_threaded_children[child.index_prev].node_id && $prev_depth < $hierarch}
{section name=sta loop=$p_depth}
<li><ul>
{/section}
{elseif $h_root neq $p_root && $get_threaded_children[child].node_parent neq $node.node_id && $get_threaded_children[child].node_status neq 'linked'}
{section name=sta loop=$ph_depth}
<li><ul>
{/section}
{elseif $h_root neq $p_root && $get_threaded_children[child].node_parent neq $node.node_id && $get_threaded_children[child.index_prev].node_status neq 'linked'}
{section name=sta loop=$hp_depth}
<li><ul>
{/section}
{/if}
  <li id='sub{$get_threaded_children[child].node_creator}'>
    <a href='/id/{$get_threaded_children[child].node_parent}' class='vector'>{$get_threaded_children[child].node_vector}</a>
    <div class='th_cnt'>
      {$smarty.capture.child_container}
    </div>
{if $next_depth > $hierarch && $h_root neq $p_root && $get_threaded_children[child].node_parent neq $node.node_id}
{section name=con loop=$c_depth}
  <ul>
    <li>
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