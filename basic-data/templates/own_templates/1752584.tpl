{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}

<center>{* loginbox *}{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node settings *}
{include file="1549925.tpl"}

{* showing poll *}
{*include file="1549834.tpl"*}

<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>


{get_creation_by_k listing_amount=$listing_amount offset=$offset}

{foreach from=$get_creation_by_k item=knode}


<div class='bordered' style='margin-bottom:13px'>
   <div class='header' style='text-align:center; height: 3em'>
      <a href='/id/{$knode.node_id}'>{$knode.node_name}</a>  in  <a href='/id/{$knode.node_parent}'>{$knode.parent_name}</a> {if $knode.user_action neq false} [lokacia :: <a href='/{$knode.user_action}/'>{$knode.user_action}</a>]{/if}
   <br>&nbsp;&nbsp;{$knode.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}&nbsp;&nbsp;
[<span class='most_important'>{$knode.k} K</span>]

   </div>
   <div>
     {$knode.node_content|truncate:230|stripslashes|strip_tags}
   </div>
</div>

{/foreach}
<form method='post'>
{* movement *}{include file="1549913.tpl"}
</form>
<!--end of central column-->

</td></tr></table>
<form method='post'> <table align='center'><tr> <td><input type='hidden' name='get_children_offset' value='{$offset}'></td> <td><input type='submit' name='get_children_move' value='<'></td> <td><input type='submit' name='get_children_move' value='<<'></td> <td><input name='get_children_move' type='submit' value='>>'></td> <td><input type='submit' name='get_children_move' value='>'></td> </tr></table> </form>
{/if}
{* footer *}{include file="1549377.tpl"}