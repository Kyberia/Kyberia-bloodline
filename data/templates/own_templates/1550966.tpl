<!--showing bookmark statistic table -->
<table class='b_stat'>
{get_bookmark_statistics}
{foreach from=$get_bookmark_statistics item=bookmark_statistic}
	<tr><td><a href='/id/{$bookmark_statistic.user_id}'>{$bookmark_statistic.login}</a><td>{$bookmark_statistic.node_user_subchild_count}</td></tr>
{/foreach}
</table>
<!--end of bookmark statistic table -->
