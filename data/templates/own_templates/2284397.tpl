{if $header_id neq true}
{include file="1549864.tpl"}
{/if}
<table width=100%><tr><td valign='top' width=23%>
</td>
<td valign='top'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular' id="formular">
<script language='javascript'>
<!--
{literal}
var checked = false;
function check_all() {
    if (checked == false) {
		checked = true;
	} else {
		checked = false;
	}
	for (var i = 0; i < document.getElementById('formular').elements.length; i++) {
	  document.getElementById('formular').elements[i].checked = checked;
	}
	alert(document.getElementById('formular').elements[4].className);
    if (checked == false) {
		return "check_all";
	} else {
		return "uncheck_all";
	}
}
{/literal}
-->
</script>
<input type='button' value='check_all' onclick="this.value=check_all()">
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

{section name=message loop=$get_mail}
<div class='message' style=' margin-bottom:0.5em; position:relative;'>
  <img width='50' src='{get_image_link id=$get_mail[message].mail_from}' style='float:left; margin-left:5px;' alt='{$get_mail[message].mail_from_name}'>
  <div class='header' style='height:auto; margin-left:61px; padding-left:0.1em'>
    <a href="javascript:chngto('{$get_mail[message].mail_from_name}','{$get_mail[message].mail_from}')">{$get_mail[message].mail_from_name}</a>
    {if $get_mail[message].mail_from neq $user_id and $get_mail[message].locationfrom_action_id}[location:: <a href='/id/{$get_mail[message].locationfrom_action_id}'>{$get_mail[message].locationfrom_action|strip_tags}</a>]{/if}
    &nbsp;&nbsp;-->&nbsp;&nbsp;
    <a href="javascript:chngto('{$get_mail[message].mail_to_name}','{$get_mail[message].mail_to}')">{$get_mail[message].mail_to_name}</a>
    {if $get_mail[message].mail_to neq $user_id and $get_mail[message].locationto_action_id}[location:: <a href='/id/{$get_mail[message].locationto_action_id}'>{$get_mail[message].locationto_action|strip_tags}</a>]{/if}
    &nbsp;&nbsp;--&nbsp;&nbsp;<input type='checkbox' name='message[{$get_mail[message].mail_id}]' id='message_{$smarty.section.message.index}' class="mail_checkbox">
    <br>
    {$get_mail[message].mail_timestamp|date_format:"%H:%M:%S - %d.%m.%Y"}
    {if $get_mail[message].mail_to==$user_id  AND $get_mail[message].mail_timestamp > $node.last_visit}&nbsp;&nbsp;<span class='most_important'>NEW</span>
    {elseif $get_mail[message].mail_read eq 'no' and $get_mail[message].mail_to neq $get_mail[message].mail_user}&nbsp;&nbsp;<span class='most_important'>UNREAD</span>{/if}
  </div>
  <div class='content' style='margin:0; margin-left:61px;'>
    {$get_mail[message].mail_text|nl2br}
  </div>
  <hr style='clear:left; height: 1px; border: none;  margin:0; visibility: hidden;'>
</div>
{/section}

</form>
</td></tr></table>
{include file="1549377.tpl"}
