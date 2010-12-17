{get_children listing_amount='23232323232323' offset=$offset types=$children_types}

{foreach from=$get_children item=child}
{$child.depth}

{if $child.template_id eq 2}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	nodeshell:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> ::
	(<a href='/id/{$node.node_id}/23'>posledne</a>, <a href='/id/{$node.node_id}/15'>k</a>,
	{if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if})
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;NEW DESCENDANT</span>{/if}
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 1417553}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	node-hell:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> ::
	({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if})
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;NEW DESCENDANT</span>{/if}
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 1683309}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	noudshell:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> ::
	({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if})
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;NEW DESCENDANT</span>{/if}
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 3}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;forum:: [{$child.node_id}] <a href='/id/{$child.node_id}'>{$child.node_name}</a> ::
	{$child.node_children_count} children{if $child.node_user_subchild_count} <span class='most_important'> {$child.node_user_subchild_count} NEW</span>{/if}
	({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;NEW DESCENDANT</span>{/if}
{$child.login}</a>)<br>

{elseif $child.template_id eq 4}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;submission:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>  ::
	({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 5}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;article:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>  :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 10}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;bookcat:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>) :: {$child.node_id}<br>

{elseif $child.template_id eq 12}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;data:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>  :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 14}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;template:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>  :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>) :: {$child.node_id}<br>

{elseif $child.template_id eq 2019721}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;css:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>) :: {$child.node_id}<br>

{else}

<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;node:: [{$child.node_id}] <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> ::
	({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>) <br>
{/if}
{/foreach}


{get_linked_nodes orderby=$listing_order}
{foreach from=$get_linked_nodes item=link}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$link.node_id}' name='node_chosen[]'>&nbsp;
	link:: <a class='important' href='/id/{$link.node_id}'>{$link.node_name}</a> ::
	{if $link.synapse_created > $link.last_visit}<span class='most_important'>&nbsp;NEW LINK</span>{/if}	(({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/1961033'>configure</a>{/if})
	(<a href='/id/{$link.synapse_creator}'>{$link.login}</a>) <br>
{/foreach}