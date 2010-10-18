<?php
function set_external_link() {
        global $error,$node,$db;

        $new_exlink = mysql_real_escape_string($_POST['external_link']);
        $node_id = mysql_real_escape_string($node['node_id']);
        $node_permission=$node['node_permission'];
        $find = '://';
        $validation = strpos($new_exlink, $find);

    if ($validation === true) {
        if (($node_permission == 'owner') || ($node_permission == 'master')) {
        $q = "update nodes set external_link='$new_exlink' where node_id='$node_id'";
        $db->query($q);
        return true;
        }
        else {
             $error = "Na to nemas prava!";
             return false;
             }
    }
    else {
           $error = "Nezadal si ://, vole. ";
           return false;
         }
    }

?>