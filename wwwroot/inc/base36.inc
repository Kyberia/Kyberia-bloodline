<?php

function addBase36id($node) {
  $node['node_kid']=base_convert($node['node_id'],10,36);
  return $node;
}
