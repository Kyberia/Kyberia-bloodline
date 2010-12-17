{if $permissions.h eq true or $node.node_creator eq $user_id or $node.node_permission eq 'master'}
<div id='own_toolbar'>
<!--<input type='submit' name='event' value='offtopic'>-->
<input type='submit' name='event' value='set_parent'>::<input type='text' name='new_parent'>
</div>
{/if}