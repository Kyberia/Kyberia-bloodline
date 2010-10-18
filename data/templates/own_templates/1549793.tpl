<div class='active_users'>
  {get_userlist}
  <span class='important'><center>friends</center></span>
  {foreach from=$active_friends item=node_visitor}
    <div class='active_user_img'><a href="javascript:chngto('{$node_visitor.login|replace:'	':'&#09;'}','{$node_visitor.user_id}')" title="{$node_visitor.login|replace:'	':'&#09;'}">
      <img src="{get_image_link id=$node_visitor.user_id}" name="{$node_visitor.login|replace:'	':'&#09;'}" alt="{$node_visitor.login|replace:'	':'&#09;'}" />
    </a>
    </div>
  {/foreach}
  <div class='active_user_name'>
  <br style='clear:left;'><span class='important'>users</span><br />
  {foreach from=$active_users item=node_visitor}
    <a href="javascript:chngto('{$node_visitor.login|replace:'	':'&#09;'}','{$node_visitor.user_id}')" title='{$node_visitor.login}'>{$node_visitor.login|replace:'	':'&#09;'}</a><br />
  {/foreach}
</div>
</div>