{include file="modules/header.tpl"}


{get_userlist}
{get_children_by_external_link external_link='session://friend' listing_amount=$listing_amount offset=$offset orderby=desc}
{foreach from=$get_children_by_external_link item=child}
a
{/foreach}



