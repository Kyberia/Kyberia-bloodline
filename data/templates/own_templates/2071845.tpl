<!--showing bookmark statistic table updateed by tux -->
<table class='bordered'>
{get_bookmark_statistics}
{foreach from=$get_bookmark_statistics item=bookmark_statistic}
<tr><td>{if $get_bookmark_statistics.user_action_id && $get_bookmark_statistics.user_action_id!=""}@{/if}<a href='/id/{$bookmark_statistic.user_id}'>{$bookmark_statistic.login}</a></td>
<td>{$bookmark_statistic.node_user_subchild_count}</td></tr>
{/foreach}
</table>
<!--end of bookmark statistic table -->