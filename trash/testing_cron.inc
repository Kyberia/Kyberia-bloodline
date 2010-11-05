<?php

function testing_cron() {
    global $db,$error;

    $q = "select node_vector,node_id,node_parent from nodes where node_name = 'successfully registered' and node_vector like '0087661102091448%'";
    $set = $db->query($q);
    while ($set->next()) {
        $node_id = $set->getString('node_id');
        $node_vector = $set->getString('node_vector');
        $node_parent = $set->getString('node_parent');
        echo $node_id . "<br>" . $node_vector . "<br>" . $node_parent . "<br>";
        $q = "update nodes set node_vector = '0$node_parent"."0$node_id' where node_id = $node_id";
        echo $q. "<br><br>";
        $db->update($q);
    }
    return false;
}
?>