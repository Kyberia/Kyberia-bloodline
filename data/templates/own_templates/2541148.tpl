<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
<textarea class=node_content name='node_content' rows='20' cols='80'>{$node.node_content}</textarea><br>
<input type='submit' name='event' value='configure_content'>
<input type='hidden' name='code' value='yes'>code
</form>