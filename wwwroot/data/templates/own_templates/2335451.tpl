<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
            <link rel='stylesheet' type='text/css' href='/data/css/main.css'>
                <title>lol</title>
            </head>
<body>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
   {if $user_id eq true}
<a href='/id/{$user_id}/1961033'>nastavenie</a>
<form action='/id/{$node.node_id}/' method='post'>
<input type='text' name='header_id' value='{$header_id}'><br><input type='submit' name='event' value='set_header_template'>

</form>
{/if}
</body>
</html>