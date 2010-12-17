{* header *}{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>

{/if}

{if $user_id eq false}
<center>{* loginbox *}{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* node_settings *}{include file="1549925.tpl"}


{* showing poll *}{*include file="1549834.tpl"*}
<br>
{*showing bookmark_statistics*}{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>

<table style='width: 100%; align:center;' id='configure'>
<tr>
  <td align='center'>
      <table align='center'>
        <tr>
          <td><input type='text' name='node_name' value='{$node.node_name}'></td>
          <td><input type='submit' name='event' value='configure_node_name'>
        </tr><tr>
          <td>
            <select name='node_system_access'>
              <option value='public' {if $node.node_system_access eq 'public'}selected{/if}>public</option>
              <option value='moderated' {if $node.node_system_access eq 'moderated'}selected{/if}>moderated</option>
              <option value='private' {if $node.node_system_access eq 'private'}selected{/if}>private</option>
              <option value='cube' {if $node.node_system_access eq 'cube'}selected{/if}>cube</option>
              <option value='crypto' {if $node.node_system_access eq 'crypto'}selected{/if}>crypto</option>
            </select>
          </td>
          <td><input type='submit' name='event' value='configure_system_access'></td>
        </tr><tr>
          <td><input name='node_external_access' type='checkbox' value='yes' {if $node.node_external_access eq 'yes'}checked{/if}></td>
          <td><input type='submit' name='event' value='configure_external_access'></td>
        </tr>
        <tr>
          <td><input type='file' name='description_image'></td>
          <td><input type='submit' name='event' value='configure_image'></td>
        </tr>
        <tr>
          <td><input type='text' name='template_id' value='{$node.template_id}' title='[submission: 4 | forum: 3 | nodeshell: 2 | article: 5 | data: 12 | user: 7]'></td>
          <td><input type='submit' name='event' value='configure_template_id'></td>
        </tr>
      </table>
      <table>
        <tr>
          <td>apply on vector ??? <input type='checkbox' name='apply_on_vector'> </td>
        </tr>
      </table>
    </form>

    <form action='/id/{$node.node_id}/' method='post'>
      <table>
        <tr>
          <td colspan='2'>vector: {$node.node_vector} </td>
        </tr><tr>
          <td><input type='text' name='new_parent' value='{$node.node_parent}'></td>
          <td><input type='submit' name='event' value='set_parent'></td>
        </tr>
        <tr>
          <td><input type='text' name='external_link' value='{$node.external_link}'></td>
          <td><input type='submit' name='event' value='set_external_link'></td>
        </tr>
      </table>
    </form>

    <form action='/id/{$node.node_id}/' method='post'>
      <input type='text' name='owner' value='{$node.owner}'><input type='submit' name='event' value='set_creator'>
    </form>

    <form action='/id/{$node.node_id}/' method='post'>
      <table align='center'>
        <tr>
          <td><input type='text' name='k_wallet' value='{$k_wallet}'></td>
          <td><input type='submit' name='event' value='k_wallet'></td>
        </tr><tr>
          <td><input type='text' name='header_id' value='{$header_id}'></td>
          <td><input type='submit' name='event' value='set_header_template'></td>
        </tr><tr>
          <td><input type='text' name='listing_amount' value='{$listing_amount}'></td>
          <td><input type='submit' name='event' value='set_listing_amount'></td>
        </tr><tr>
          <td>
            <select name='listing_order'>
              <option value='desc'  {if $smarty.session.listing_order eq 'desc'}selected{/if}>najnovsie hore</option>
              <option value='asc' {if $smarty.session.listing_order eq 'asc'}selected{/if}>najstarsie hore</option>
            </select>
          </td>
          <td><input type='submit' name='event' value='set_listing_order'></td>
        </tr>
      </table>
    </form> <br />

    {get_user_email_icq_www user_id=$node.node_id}
    <form action='/id/{$node.node_id}/' method='post'>
      <table>
        <tr>
          <td><input type='text' name='user_email' value='{$get_user_email}' /></td>
          <td><input type='submit' name='event' value='configure_email' /></td>
        </tr>
      </table>
    </form>

    <form method='post'>
      template_id: <input type='text' value='{$node.node_id}' name='add_template_id'> <br>
      <input type='submit' name='event' value='addTemplate'>
    </form>

    <form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
      <textarea class=node_content name='node_content'>{$node.node_content|escape:"html"}</textarea><br>
      <center>
      <input type='submit' name='event' value='configure_content'> &nbsp;&nbsp;<input type='checkbox' name='no_html' value='yes'>&nbsp;NO HTML &nbsp;&nbsp;
      <input type='checkbox' name='code' value='yes'>&nbsp;code &nbsp;&nbsp;
      <input type='checkbox' name='wiki' value='yes'>&nbsp;wiki
      </center>
    </form>
  </td>
</tr>
</table>

<!--end of central column-->

</td></tr></table>
{/if}