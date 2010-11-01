{if $permissions.w eq true}

<div class='add_title' style='margin-bottom:2pt;'>
  title or keywords::
  <input type='text' name='node_name' value='{$post_vars.node_name}'>
  <input type='checkbox' name='no_html' value='yes'>&nbsp;NO HTML<!-- &nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' name='code' value='yes'>&nbsp;code

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional data file::<input type='file' name='data_file'>
  &nbsp;{$user_quota}bytez
-->
</div><!-- class='add_title' end -->

<textarea name='node_content' id='node_content'>{$post_vars.node_content|escape:"html"}</textarea>


<div class='toolbar'>

  <input type='submit' name='event' value='add' />

  <!--
  <select name='template_id'>
  <option value='4'>submission</option>
  <option value='3'>forum</option>
  <option value='2'>nodeshell</option>
  <option value='8'>friend</option>
  </select>
  -->

  <input type='text' name='template_id' size=5 value='4' id='vernamseed' title='[submission: 4 | forum: 3 | nodeshell: 2 | article: 5 | data: 12]' />
  <input type='submit' name='template_event' value='encrypt' onClick='if (document.getElementById("vernamseed").value) { alert("Please seed the Key into the inputbox on the left side of the button You just clicked on");} else { document.getElementById("node_content").innerHTML=rc4Encrypt(document.getElementById("vernamseed").value,document.getElementById("node_content").innerHTML); }'/>
  <input type='submit' name='template_event' value='preview' />

  <select name='sel_help' onchange='document.getElementById("node_content").innerHTML += sel_help.value;'  style='margin-right:4px'>
    <option value='' selected>helpful</option>
    <option value='<a href="" target="_blank"></a>'>link</option>
    <option value='<img src="">'>image</option>
    <option value='<b></b>'>bold</option>
    <option value='<i></i>'>italic</option>
  </select>

  <!--<td>&nbsp;<input type='checkbox' name='between' value='yes'><td valign='middle'>&nbsp;use between</td>-->

  {* movement *}{include file="1549913.tpl"}

  <input type='submit' name='template_event' value='filter_by' />

  <select name='search_type' style=''>
    <option value='user'>user</option>
    <option value='content'>content</option>
  </select>

  <input type='hidden' name='node_parent' value='{$node.node_id}'>
</div>
  {* owner_toolbar *}{include file="1549939.tpl"}

{/if}

<div class='add_put'>
   <input type='submit' name='event' value='delete'>
   <span class='add_k_cmnt'>&nbsp; u have {$user_k} </span><input type='submit' value='K' name='event' style='margin-right:4px'>
   <input type='submit' name='event' value='destroy_synapse'  style='margin-right:1.5em' />
   <input type='submit' name='event' value='put' /> into
   <input type='text' name='nodeshell_id' value='' />
   <select name='nodeshell_id_select'>
   {foreach from=$bookmarks key=id item=name}<option value='{$id}'>{$name|strip_tags|truncate:32:"":true}</option>{/foreach}
   </select>
</div>
<br>
{* get_node_userlist *}{include file="1549803.tpl"}