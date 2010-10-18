{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
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
{get_node_commanders}
masters::<br>
{explode separator=';' string=$masters}
{foreach from=$explode item=master}
	{if $master neq ''}{get_id_by_name name=$master}
		<img vspace='5' hspace='5' width='50' src='{get_image_link id=$get_id_by_name}'>
		<a href='/id/{$get_id_by_name}'>{$master}</a> [{$get_id_by_name}]<br>
	{/if}
{/foreach}
<br>
ops::<br>
{explode separator=';' string=$ops}
{foreach from=$explode item=op}
	{if $op neq ''}{get_id_by_name name=$op}
		<img vspace='5' hspace='5' width='50' src='{get_image_link id=$get_id_by_name}'>
		<a href='/id/{$get_id_by_name}'>{$op}</a> [{$get_id_by_name}]<br>
	{/if}
{/foreach}
<br>
execute::<br>
{explode separator=';' string=$execute}
{foreach from=$explode item=executer}
	{if $executer neq ''}{get_id_by_name name=$executer}
		<img vspace='5' hspace='5' width='50' src='{get_image_link id=$get_id_by_name}'>
		<a href='/id/{$get_id_by_name}'>{$executer}</a> [{$get_id_by_name}]<br>
	{/if}
{/foreach}
<br>
access::<br>
{explode separator=';' string=$access}
{foreach from=$explode item=accessed}
	{if $accessed neq ''}{get_id_by_name name=$accessed}
		<img vspace='5' hspace='5' width='50' src='{get_image_link id=$get_id_by_name}'>
		<a href='/id/{$get_id_by_name}'>{$accessed}</a> [{$get_id_by_name}]<br>
	{/if}
{/foreach}
<br>
bans::<br>
{explode separator=';' string=$bans}
{foreach from=$explode item=banned}
	{if $banned neq ''}{get_id_by_name name=$banned}
		<img vspace='5' hspace='5' width='50' src='{get_image_link id=$get_id_by_name}'>
		<a href='/id/{$get_id_by_name}'>{$banned}</a> [{$get_id_by_name}]<br>
	{/if}
{/foreach}
<br>
silence::<br>
{explode separator=';' string=$silence}
{foreach from=$explode item=silenced}
	{if $silenced neq ''}{get_id_by_name name=$silenced}
		<img vspace='5' hspace='5' width='50' src='{get_image_link id=$get_id_by_name}'>
		<a href='/id/{$get_id_by_name}'>{$silenced}</a> [{$get_id_by_name}]<br>
	{/if}
{/foreach}

<!--end of central column-->

</td></tr></table>
{/if}