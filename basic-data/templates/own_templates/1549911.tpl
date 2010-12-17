{if $node.node_creator eq $user_id or $node.node_permission eq 'master'}
{*masterlist*}<textarea class='small' name='masterlist'>{$masters}</textarea>
<br>
<center><input type='submit' name='event' value='masterlist'></center>
<br>
{*oplist*}{include file="1549929.tpl"}
{*executelist*}{include file="1961111.tpl"}
{/if}
{*accesslist*}{include file="1548920.tpl"}