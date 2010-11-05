<?php
function delete_friend() {
if($_POST["delete_id"]) {
$sql = "delete from `nodes` where `node_id` = '{$_POST["delete_id"]}' and `external_link` = 'sessions://friend'";
$sql1 = "delete from `node_content` where `node_id` = '{$_POST["delete_id"]}'";
$db->query($sql);
$db->query($sql1);
return (true);






}
}
?>