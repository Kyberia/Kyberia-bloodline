{get_nodes_by_parent parent=2284296 listing_amount=1 offset=0}
{section name='node' loop=$get_nodes_by_parent start=0 max=1}
{explode string=$get_nodes_by_parent[node].node_content separator=';'}
{section name='link' loop=$explode start=0}
{$explode[link]}<br>
{/section}
{/section}
{math equation="x - 1" x=$smarty.section.link.loop assign='max'}
{rand min=0 max=$max}
<br><br>
{$rand}
{$explode[$rand]}