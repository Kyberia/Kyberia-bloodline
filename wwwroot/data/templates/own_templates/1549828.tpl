{get_nodes_by_type  orderby='rand()' vector=$vector type=$type listing_amount=$listing_amount offset=$offset}
{section name=list loop=$get_nodes_by_type}
<a href='/id/{$get_nodes_by_type[list].node_id}'>{$get_nodes_by_type[list].node_name}</a> <br><br>
{/section}