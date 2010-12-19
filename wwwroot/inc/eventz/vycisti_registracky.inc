<?php
function vycisti_registracky() {
global $db,$error;

$q="select users.login as persona,users.email as email,k,node_id,node_creator,login from nodes
left join users on nodes.node_creator=users.user_id where node_name='request for access' and node_parent=".REGISTRATION_REQUEST_NODE." and k<=".REGISTRATION_VOTES;

$set=$db->query($q);
while ($set->next()) {
$noda=$set->getString('node_id');
echo "Uchadzac ";
echo $set->getString('login');
echo "<br>Jeho noda:: ";
echo $set->getString('node_id');
echo "<br>";
echo " pocet hlasov:: ";
echo $set->getString('k');
echo "<br>";
$q="delete from users where user_id=$noda";
echo $q;
    $db->update($q);
echo "<br>";
// XXX hard coded, fix
$q="delete from nodes where node_vector like '020914480$noda%'";
echo $q;
    $db->update($q);
echo "<br>";
echo "<hr>";
$mail=$set->getString('email');
mail($mail,SYSTEM_URL. " registracia","Lutujem, vasa registracia bola zamietnuta");
// echo $mail;


}

return false;
}
?>
