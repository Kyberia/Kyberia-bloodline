{get_movement_params} {* header *}{include file="1549864.tpl"} {if $error eq true}
<center>
  <font style='error'>    {$error}
  </font>
</center>{/if} {if $user_id eq false}
<center>  {* loginbox *}{include file="1549885.tpl"}
</center>{else}
<table width='100%'>
  <tr>
    <!--left column-->
    <td valign='top' align='center' width='23%'>
      {* node_settings *} {include file="1549925.tpl"} {* get_poll_box *} {include file="1549834.tpl"}
      <br />{*get_bookmark_statistics_box*} {include file="1549386.tpl"}
    </td>
    <!--end of left column-->
    <!--main central column-->
    <td width=66% valign='top'>
    {*showing node_content*} {get_children listing_amount='23232323232323' offset=$offset}
      <table width='100%' align='center'>
        <tr>{foreach name=picz from=$get_children item=child} {if $smarty.foreach.picz.iteration is div by 5}
        </tr>
        <tr>{/if}
          <td width='190'>
            <table>
              <tr>
                <td class='important'> {$child.node_name}
                </td>
              </tr>
              <tr>
                <td>
                  <a href='/id/{$child.node_id}/1041658'>
                    <img src='/id/{$child.node_id}/download' border='0' name='{$child.node_name}' width='100px'/>
                  </a>
                  <div style='font-size:x-small;'>
                    {$child.node_content|truncate:23}
                  </div>
                </td>
              </tr>
            </table>
          </td>          {/foreach}
        </tr>
      </table>      {*showing form for adding child node*}
      <form method='post' action='/id/{$node.node_id}'>        {if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}
      </form>
      <center>        {include file="modules/movement.tpl"}
      </center>
      <!--end of central column-->
    </td>
  </tr>
</table>
{/if}
{*footer*}{include file="1549377.tpl"}