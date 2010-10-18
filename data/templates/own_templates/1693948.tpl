{if $user_id eq '2334'}
kokot
{else}
picka
{/if}
<form action='/id/{$node.node_id}' method='post'>
<input type='submit' name='event' value='testing_cron'>
</form>