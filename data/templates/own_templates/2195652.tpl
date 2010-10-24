<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'
method='post'>
{$error}
{if $permissions.r neq true} you don't have permissions for viewing this data node{/if}

<table>
   <tr>
      <td>login::</td>
      <td><input tabindex=1 accesskey=l type='text' name='login' /></td>
      <td>&nbsp;password::</td><td><input tabindex=2 accesskey=p type='password'
name='password' /></td>
      <td><input tabindex=3 type='submit' name='event' value='login_test' /></td>
   </tr>
   <tr>
      <td></td>
      <td colspan=3 align='center'>name:: <input type='radio' accesskey=n
name='login_type' value='name' checked />
      id:: <input type='radio' accesskey=i name='login_type' value='id' /></td>
      <td></td>
   </tr>
</table>

<script language="JavaScript" type="text/javascript">
<!--
document.write("<input type='hidden' name='screen_width' value='" + screen.width +
"'><input type='hidden' name='screen_height' value='" +
screen.height + "'>");
// -->
</script>


</form>