#!/usr/local/bin/php
<?php
require('../config/config.inc');
//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'/inc/log.inc');
require(SYSTEM_ROOT.'/inc/database.inc');
require(SYSTEM_ROOT.'/inc/nodes.inc');
$db=new CLASS_DATABASE();

$dir=SYSTEM_ROOT.'/inc/eventz/';
$parent_node='1075292';
$creator_id='548';
$external_link='file://inc/eventz/';

function scandir($dir) {
   $dir_open = @ opendir($dir);
   if (! $dir_open)
   return false;

    while (($dir_content = readdir($dir_open)) !== false) {
      if ($dir_content != "." OR $dir_content !=".." ) $files[] = $dir_content;
    }
    return($files);
}

$files=scandir($dir);

$set=$db->query("select node_vector from nodes where node_id='$parent_node'");
$set->next();
$parent_vector=$set->getString('node_vector');



foreach ($files as $file) {
    // nacte obsah souboru do retezce
    $filename = $dir.$file;
    $fd = fopen ($filename, "r");
    $file_content = fread ($fd, filesize ($filename));
    fclose ($fd);
    $node_content=addslashes($file_content);

    $qh="select node_id from nodes where node_parent='$parent_node' and node_name='$file'";
    $seth=$db->query($qh);
    if ($seth->getNumRows()) {
      echo "updatin $file\n";
      $nh=$seth->getString('node_id');
      $db->query("update node_content set node_content='$node_content' where node_id='$nh'");
    }

    else {
    $q="insert into nodes set node_parent='$parent_node',node_name='$file',template_id='2',";
    $q.="node_system_access='private',node_external_access='no',node_creator='$creator_id',external_link='$external_link'";
    echo $q."\n";

    $db->query("start transaction");
    $db->query($q);
    $id=$db->getLastInsertId();
    $db->query("insert into node_content set node_id='$id',node_content='".$node_content."'");
    $new_id=str_pad($id,VECTOR_CHARS,"0",STR_PAD_LEFT);
    $new_vector=$parent_vector.$new_id;

    $db->query("update nodes set node_vector='$new_vector' where node_id='$id'");
    $db->query("update nodes set node_children_count=node_children_count+1 where node_id='$parent_id'");
    }


}

?>
