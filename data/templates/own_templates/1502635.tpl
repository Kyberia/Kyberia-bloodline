{* header *}{include file="1549864.tpl"}
<!--<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/645341.tpl' media='screen'>-->
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/2284394.tpl' media='screen'>
<script type='text/javascript' src='/data/templates/own_templates/2257341.tpl'></script>

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center>

{/if}

<div style='margin: 0 auto 0 auto; width: 666px;'>

<div class='bordered' id='topic'>
{$node.node_content|nl2br}
</div>
<br /><br />

{* shows what other friends think about users *}
{get_children_by_external_link external_link='session://friend' listing_amount='2323' offset=$offset orderby='desc' orderby_type='nodes.node_id'}

{section name=friend loop=$get_children_by_external_link}
<div id='fr_node_{$smarty.section.friend.index}' class='fr_node_off' onclick='return showcontent({$smarty.section.friend.index})'>
    <img id='fr_img_{$smarty.section.friend.index}' class='fr_img' src='{get_image_link id=$get_children_by_external_link[friend].node_creator}' onclick='return showcontent({$smarty.section.friend.index})'>
    <div id='fr_nodecn_{$smarty.section.friend.index}' class='fr_nodecn_off'>
        <div id='fr_title_{$smarty.section.friend.index}' class='fr_title_off'>
            comment::<a href='/id/{$get_children_by_external_link[friend].node_id}'>{$get_children_by_external_link[friend].node_name}</a> by
            &nbsp;<a href='/id/{$get_children_by_external_link[friend].node_creator}'>{$get_children_by_external_link[friend].login}</a>
            {if $get_children_by_external_link[friend].user_action neq false}
                &nbsp;[<a href='/id/{$get_children_by_external_link[friend].user_action_id}/'>{$get_children_by_external_link[friend].user_action}</a>]
            {/if}
            <br />
            &nbsp;&nbsp;{$get_children_by_external_link[friend].node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
        </div>
        <div id='fr_cn_{$smarty.section.friend.index}' class='fr_cn_off'>
            {$get_children_by_external_link[friend].node_content|nl2br}
        </div>
    </div>
</div>
{/section}
</div>

<div style='margin: 0 auto 0 auto; width: 666px;'>
<form method='post' action='/id/{$node.node_id}'>
<br />
<textarea name='node_content'>{$post_vars.node_content}</textarea>
<br />
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
<br style='clear: both;' />