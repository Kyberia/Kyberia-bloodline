<div class='node_userlist'>
      {get_node_userlist}
      {foreach from=$userlist item=node_visitor}<a href='/id/{$node_visitor.user_id}/'><img src='{get_image_link id=$node_visitor.user_id}' name='{$node_visitor.login}' alt='{$node_visitor.login}' title='{$node_visitor.login}' width='50' /></a>{/foreach}
</div>