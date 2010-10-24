{get_user_email_icq_www user_id=$node.node_id}
<form action='/id/{$node.node_id}/' method='post'>
    <table class='bordered'>
        <tr>
            <td><input type='text' name='user_email' value='{$get_user_email}' /></td>
            <td><input type='submit' name='event' value='configure_email' /></td>
        </tr>
        <tr>
            <td><input type='text' name='user_www' value='{$get_user_www}' /></td>
            <td><input type='submit' name='event' value='configure_www' /></td>
        </tr>
        <tr>
            <td><input type='text' name='user_icq' value='{$get_user_icq}' /></td>
            <td><input type='submit' name='event' value='configure_icq' /></td>
        </tr>
    </table>
</form>