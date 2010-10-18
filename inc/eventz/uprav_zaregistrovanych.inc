<?php
function uprav_zaregistrovanych() {
global $db,$error;
// 2110364 >> debug user

$q="select users.login as persona,users.email as email,k,node_id,node_creator,login from nodes
left join users on nodes.node_creator=users.user_id where node_name!='request for access' and node_parent=2091448 and
k>=3";

/*
$q="select users.login as persona,users.email as email,k,node_id,node_creator,login from nodes
left join users on nodes.node_creator=users.user_id where node_name!='request for access' and node_parent=2091448 and
k>=3 and user_id=2110364";
*/

$set=$db->query($q);
while ($set->next()) {
$noda=$set->getString('node_id');
echo "User ";
echo $set->getString('login');
echo "<br>Jeho noda:: ";
echo $set->getString('node_id');
echo "<br>";
echo " pocet hlasov:: ";
echo $set->getString('k');
echo "<br>";
$q="update nodes set external_link='db://user' where node_id=$noda";
echo $q;
      $db->update($q);
echo "<br>";
$q="update nodes set template_id=7 where node_id=$noda";
echo $q;
      $db->update($q);
echo "<br>";
$q="update nodes set node_parent=0 where node_id=$noda";
echo $q;
      $db->update($q);
echo "<br>";
$q="update nodes set node_vector='0$noda' where node_id=$noda";
echo $q;
      $db->update($q);

$q="update users set user_mail=0 where user_id=$noda";
echo $q;
      $db->update($q);

echo "<br>";
echo "<hr>";




}

return false;
}
?>