<form enctype="multipart/form-data" action='https://kyberia.sk/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
{$error}
{if $permissions.r neq true} you don't have permissions for viewing this data node{/if}
{if $user_id eq false || $user_id eq 980161}

<fieldset>
		login::<input tabindex=1 accesskey=l type='text' name='login' />
		password::<input tabindex=2 accesskey=p type='password' name='password' />
		<input tabindex=3 type='submit' name='event' value='login' />
</fieldset>
<script language="JavaScript" type="text/javascript">
<!--
document.write("<input type='hidden' name='screen_width' value='" + screen.width +
"'><input type='hidden' name='screen_height' value='" +
screen.height + "'>");
// -->
</script>

{/if}
</form>