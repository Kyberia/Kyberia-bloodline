<!--showing bookmark statistic table -->
<table class='bordered' id='bookstat'>
{get_bookmark_statistics}
{foreach from=$get_bookmark_statistics item=bookmark_statistic}
	<tr><td><a href='/id/{$bookmark_statistic.user_id}'>{$bookmark_statistic.login}</a></td><td>{$bookmark_statistic.node_user_subchild_count}</td></tr>
{/foreach}
</table>
<!--end of bookmark statistic table -->
