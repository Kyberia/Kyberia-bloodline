<center>
<form action='/id/{$node.node_id}/' method='post'>
    <table class='bordered'>
        <tr>
            <td><input type='text' name='login' value='' /></td>
            <td><input type='radio' name='login_type' value='name' checked />::name
            <input type='radio' name='login_type' value='id' />::id</td>
        </tr>
        <tr>
            <td><input type='text' name='email' /></td>
            <td>::email</td>
        </tr>
        <tr>
            <td><input type='submit' name='event' value='request_password' /></td>
        </tr>
    </table>
</form>
</center>