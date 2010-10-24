{if $template_event eq 'preview'}
<table>
  <tr>
    <td valign='top' rowspan='2' >
      <img hspace='5' src='{get_image_link id=$user_id}'>
    </td>
    <td width='100%' valign='top'>
      <table width='100%'>
        <tr class='header'>
          <td align='center'>PREVIEW</td>
        </tr>
        <tr>
          <td>{$post_vars.mail_text|preview}</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
{* end of preview *}

{elseif $template_event eq 'filter_by'}
  {if $post_vars.mail_text neq ''}
    {get_mail listing_amount=232323 offset=$offset search_type=$post_vars.search_type search=$post_vars.mail_text}
  {else}
    {get_mail listing_amount=232323 offset=$offset search_type=$post_vars.search_type search=$post_vars.mail_to}
  {/if}
{else}{get_mail listing_amount=$listing_amount offset=$offset}
{/if}

{foreach from=$get_mail item=message}
<div class='message' style='clear:left; margin-bottom:0.5em; position:relative;'>
  <img width='50' src='{get_image_link id=$message.mail_from}' style='float:left; margin-left:5px;' alt='{$message.mail_from_name|addslashes}'>
  <div class='header' style='height:auto; margin-left:61px; padding-left:0.1em'>
    <a href="javascript:chngto('{$message.mail_from_name|addslashes}','{$message.mail_from}')">{$message.mail_from_name}</a>
    {if $message.mail_from neq $user_id and $message.locationfrom_action_id}[location:: <a href='/id/{$message.locationfrom_action_id}'>{$message.locationfro
m_action|strip_tags}</a>]{/if}
    &nbsp;&nbsp;-->&nbsp;&nbsp;
    <a href="javascript:chngto('{$message.mail_to_name|addslashes}','{$message.mail_to}')">{$message.mail_to_name}</a>
    {if $message.mail_to neq $user_id and $message.locationto_action_id}[location:: <a href='/id/{$message.locationto_action_id}'>{$message.locationto_action
|strip_tags}</a>]{/if}
    &nbsp;&nbsp;--&nbsp;&nbsp;<input type='checkbox' name='message[{$message.mail_id}]'>
    <br>
    {$message.mail_timestamp|date_format:"%H:%M:%S - %d.%m.%Y"}
    {if $message.mail_to==$user_id  AND $message.mail_timestamp > $node.last_visit}&nbsp;&nbsp;<span class='most_important'>NEW</span>
    {elseif $message.mail_read eq 'no' and $message.mail_to neq $message.mail_user}&nbsp;&nbsp;<span class='most_important'>UNREAD</span>{/if}
  </div>
  <div class='content' style='margin:0; margin-left:61px;'>
    {$message.mail_text|nl2br}
  </div>
  <hr style='clear:left; height: 1px; border: none;  margin:0; visibility: hidden;'>
</div>
{/foreach}