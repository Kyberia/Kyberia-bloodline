{if $node.node_system_access neq 'public'}
<textarea class='small' name='access'>{$access}</textarea>
<br>
<center><input type='submit' name='event' value='accesslist'></center>
<br>
{/if}
{*banlist*}{include file="1548947.tpl"}