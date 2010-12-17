No of Citizens:
{get_citizen_count}
{$get_citizen_count}
<br /><br />
Needed votes in senat:{$get_citizen_count_need}
<br /><br />

{get_citizen_list}
{foreach from=$get_citizen_list item=citizen}
{$citizen.user_id} :: {$citizen.login} :: {$citizen.last_action} :: {$citizen.user_action}<br />
{/foreach}





