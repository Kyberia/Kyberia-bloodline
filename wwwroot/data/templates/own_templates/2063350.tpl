{if $header_id neq true}{include file="1549864.tpl"}{/if}
<h1> Send2 testing place </h1>
<table width=100%>
<tr><td valign='top' width=23%>
{include file="1549793.tpl"}
</td>
<td valign='top'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq
false}{$action}{/if}' method='post' name='formular'>

<table>

  <tr>

    <td width=66 valign='top'>
      <img src="/images/users/{$new_mail_name}.gif" name="fricon"
border='0'><br>
      <input style='width: 50px' type='text' name='mail_to'
value='{$new_mail_name}' onmouseout="vymena()">
    </td>

    <td align='left' width=555 valign='top'><textarea
name='mail_text'>{$post_vars.mail_text}</textarea></td>

  </tr>

  <tr>

    <td><td>
      <table>
          <tr>
          <td><input type='submit' name='event'
value='send2'></td>
          <td><input type='submit' name='template_event'
value='preview'></td>
          <td>{include file="modules/movement.tpl"}</td>
          <td><input type='submit' name='event'
value='delete_mail'></td>
          <td align='left'><input type='submit'
name='template_event' value='filter_by'>
          <td align='left'>
              <select name='search_type'>
                <option value='mail_text'>text:</option>
                <option value='mail_from'>from:</option>
                <option value='mail_to'>to:</option>
              </select>
            <td><input type='checkbox' name='no_html'
value='yes'><td valign='middle'>&nbsp;NO HTML</td>
          </tr>

        </table>

    </td>

    </tr>
</table>


{include file="1549888.tpl" listing_amount=$listing_amount offset=$offset}
</form>
</td></tr></table>

{include file="1549377.tpl"}