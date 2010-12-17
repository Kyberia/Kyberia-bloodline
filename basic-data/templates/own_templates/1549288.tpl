<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
<input type='checkbox' name='no_html' value='yes'>&nbsp;NO HTML &nbsp;&nbsp;
<input type='checkbox' name='code' value='yes'>&nbsp;code &nbsp;&nbsp;
<input type='checkbox' name='wiki' value='yes'>&nbsp;wiki<br>
<textarea class=node_content name='node_content'>
{$node.node_content|escape:"html"}
</textarea><br>
<center><input type='submit' name='event' value='configure_content'></center>
</form>
<br><br>



