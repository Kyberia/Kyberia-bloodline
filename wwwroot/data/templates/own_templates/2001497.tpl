{get_movement_params children_count=$node.node_children_count}
{include file="1549864.tpl"}

{if $error eq true}
{$error}

{/if}

{if $user_id eq false}
{include file="1549885.tpl"}



{/if}









{* show node info *}
{include file="1549925.tpl"}

{* showing poll *}
{include file="1549834.tpl"}



{*showing node_content*}
{include file="1549916.tpl"}
{*showing form for adding child node*}


{if $permissions.w eq true}{include file="1548927.tpl"}{/if}
{include file="1549839.tpl"}





{include file="1549377.tpl"}








