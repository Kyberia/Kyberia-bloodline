<!--showing poll-->
{if $poll_id eq true}{get_poll poll_id=$poll_id}
{else}{get_poll}{/if}

{if $get_poll.question eq true}
<table width='66%' align='center' class='bordered'>
<tr><td colspan='3' align='center'><b>{$get_poll.question}</b></td></tr>
{foreach from=$get_poll.options item=option name=poll_option}
<tr><td>{if $get_poll.voted eq 'yes'}{$option.text}{else}
<form method='post' action='/id/{$get_poll.node_id}'>{$option.text}&nbsp;<input type='submit' name='event' value='vote'><input type='hidden' name='poll_option' value='{$smarty.foreach.poll_option.iteration}'></form>{/if}</td><td>
<table style='background-color:#6dae42;width: {math equation="(x/y)*100" format="%d" x=$option.number y=$get_poll.total} pt;'><tr height=5><td height=5></td></tr></table></td><td>{math equation="(x/y)*100" format="%.1f" x=$option.number y=$get_poll.total}%</td></tr>
{/foreach}
<tr><td colspan='3' align='center'><i>{$get_poll.total} voted</i></td></tr>
</table>
{/if}
<!--end of showing poll-->

