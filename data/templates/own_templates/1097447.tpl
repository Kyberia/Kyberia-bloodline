<body>
{get_waiting_users}
<form method='post' action='/id/32'>
<table align='center'>
{foreach from=$get_waiting_users item=waiting}
        <tr class='bordered'><td><a href='/id/{$waiting.user_id}'>{$waiting.login}</a></td>
        <td width='500'>{$waiting.node_content}</td>
        <td>{$waiting.email}</td>
        <td><input type='checkbox' name='waiting[{$waiting.user_id}]'>
        </td></tr>
{/foreach}
<tr><td colspan='4' align='center'><input type='submit' value='register_users' name='event'>
<input type='submit' value='remove_users' name='event'></td></tr>
</table>
</td></table>
</form>
</body>
</html>
