<?php
function smarty_function_get_matrix_from_tree($params,&$smarty) {
global $db , $node;

if (!is_numeric($params['dimensions'])) return false;

//in the very moment IM2tired4going meta-dimensional
for ($i=0; $i<$params['dimensions']; $i++ ) {}

$q="select node_content.node_content,nodes.*
 from nodes left join node_content
on nodes.node_id=node_content.node_id
where node_vector like '".$node['node_vector']."%' and
nodes.node_id!='".$node['node_id']."' and
node_system_access !='private'
order by rand() ";
$set=$db->query($q);

$size = floor(sqrt($set->getNumRows()));

$x=0;
$y=0;

while ($set->next()) {
  if ($x<$size) {
    $x++;
  }
  else {
    $y++;
    $x=0;
  }

  $matrix[$x][$y] = $set->getRecord();

}

$smarty->assign('get_matrix_from_tree',$matrix);
}
?>