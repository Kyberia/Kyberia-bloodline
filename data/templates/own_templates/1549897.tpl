<div id='mail_form'>
	<div style='float:left; width:50px; margin: 0 6px 0 5px; padding:0;'>
		{if $post_vars.mailto neq false}
			{get_id_by_name name=$post_vars.mailto}
		{elseif $post_vars.mail_to neq false}
			{get_id_by_name name=$post_vars.mail_to}
		{else}
			{get_id_by_name name=$new_mail_name}
		{/if}
		<img src='{get_image_link id=$get_id_by_name}' name="fricon" border='0' style=' float:left; width: 50px; margin:0;'>
		<input style='width: 50px; margin:0;' type='text' name='mail_to' value="{if $post_vars.mailto neq false}{$post_vars.mailto}{elseif $post_vars.mail_to neq false}{$post_vars.mail_to}{else}{$new_mail_name}{/if}" onmouseout="vymena()">

	</div>
	<textarea name='mail_text' id='mail_text'>{$post_vars.mail_text|escape:"html"}</textarea>
<script language="Javascript">document.getElementById('mail_text').focus();</script>
	<div class='controls' style='mardin:0; margin-left:61px; _margin-left:106px;'>
		<input type='submit' name='event' value='send' />
		<input type='submit' name='template_event' value='preview' />
		<select name='sel_help' onchange='document.getElementById("mail_text").innerHTML += sel_help.value;'>
		<option value='' selected>helpful</option>
		<option value='<a href="" target="_blank"></a>'>link</option>
		<option value='<img src="">'>image</option>
		<option value='<b></b>'>bold</option>
		<option value='<i></i>'>italic</option>
	</select>
		{* movement *}{include file="1549913.tpl"}
<script language='javascript'>
{literal}
var checked = false;
var checkboxes = document.getElementById('formular').elements;
function check_all() {
    if (checked == false)
		checked = true;
	else
		checked = false;
	for (var i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i].className == "mail_checkbox")
			checkboxes[i].checked = checked;
	}
    if (checked == false)
		return "check_all";
	else
		return "uncheck_all";
}
{/literal}
</script>
		<input type='submit' name='event' value='delete_mail' />
		<input type='submit' name='template_event' value='filter_by' />
		<select name='search_type'>
			<option value='mail_text'>text:</option>
			<option value='mail_from'>from:</option>
			<option value='mail_to'>to:</option>
			<option value='mail_both'>both:</option>
		</select>
		<input type='checkbox' name='no_html' value='yes' />&nbsp;NO HTML
		<input type='button' value='check_all' onclick="this.value=check_all()" />
	</div>
</div>