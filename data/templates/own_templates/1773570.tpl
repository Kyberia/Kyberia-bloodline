{* header *}{include file="1549864.tpl"}
{if $action}{get_userlist vector=$action} in vector {$action}  {else}{get_userlist}  {/if}
<div id="pplz" style="width:100%;">
{literal}
<style>

.active_friends {margin: 0 2%}
h2 {margin-top:0;padding-top:0; font-size:8pt;}
.activ {width-min:15%}

</style>
{/literal}
	<div class="active_friends">

		<h1 style='color:white'>friends</h1>
		{foreach name=friends from=$active_friends item=active_friend}
		{if $smarty.foreach.friends.iteration is div by 5}<br style="clear:left" />{/if}
		<div class="activ" style="float:left; border:1px solid black; height:100px; background:white;">

<a href='/id/{$active_friend.user_action_id}' style="color:white;">{$active_friend.user_action}</a>  <br />
			<span style='color:black;'>{$active_friend.idle_time_minutes}min {$active_friend.idle_time_seconds}sec</span>
		</div>

		{/foreach}
		<br style="clear:left" />

	</div>

	<div class="active_users">


	</div>
	<
</div>
