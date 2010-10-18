<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<br>
{if $permissions.w eq true}
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<table><tr><td><input type='submit' name='event' value='add'>
<td>
	<select name='node_system_access'>
	<option value='public' {if $node.node_system_access eq 'public'}selected{/if}>public</option>
	<option value='moderated' {if $node.node_system_access eq 'moderated'}selected{/if}>moderated</option>
	<option value='private' {if $node.node_system_access eq 'private'}selected{/if}>private</option>
	<option value='crypto' {if $node.node_system_access eq 'crypto'}selected{/if}>crypto</option>
	</select>
</td>
<td>
        <select name='node_type'>
        {foreach from=$children_types item=node_type}
        <option value='{$node_type}'>{$types[$node_type]}</option>
        {/foreach}
        </select>
</td>
<td> with name:</td> <td><input type='text' name='node_name'></td>
</table>
{/if}