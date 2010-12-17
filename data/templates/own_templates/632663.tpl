<script type='text/javascript' language='javascript' src='/id/1751967/'></script>
<center>
<form action='/id/{$node.node_id}/' method='post'>
    <table class='bordered'>
        <tr>
            <td><input type='text' name='login' value='' /></td>
            <td><input type='radio' name='login_type' value='name' checked />::name
            <input type='radio' name='login_type' value='id' />::id</td>
        </tr>
        <tr>
            <td><input type='text' name='vercode' /></td>
            <td>::vercode</td>
        </tr>
        <tr>
            <td><input type='password' name='new_password1' id='password1' /></td>
            <td>::new password</td>
        </tr>
        <tr>
            <td><input type='password' name='new_password2' id='password2' /></td>
            <td>::new password [again]</td>
        </tr>
        <tr>
            <td colspan='2'><input type='submit' name='event' value='reset_password' /></td>
        </tr>
    </table>
</form>
</center>