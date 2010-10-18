{* header *}{include file="1549864.tpl"}

{if $user_id eq false}
{* loginbox *}{include file="1549885.tpl"}


{/if}


{* node_settings *}
{include file="1549925.tpl"}

{* get_poll_box *}
{include file="1549834.tpl"}


{*get_bookmark_statistics_box*}
{include file="1549386.tpl"}

{*node_content*}
{include file="1549916.tpl"}
{*showing form for adding child node*}

{if $permissions.w eq true}{*addnode*}{include file="2064663.tpl"}{/if}
{*get_threaded_children*}{include file="1549839.tpl" children_type=4}

