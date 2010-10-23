<?php
function registruj_novych() {
global $db,$error;
// 2110364 >> debug user

$q="select users.login as persona,users.email as email,k,node_id,node_creator,login from nodes
left join users on nodes.node_creator=users.user_id where node_name='request for access' and node_parent=2091448 and
k>=5";

/*
$q="select users.login as persona,users.email as email,k,node_id,node_creator,login from nodes
left join users on nodes.node_creator=users.user_id where node_name!='request for access' and node_parent=2091448 and
k>=3 and user_id=2110364";
*/

$set=$db->query($q);
while ($set->next()) {
$noda=$set->getString('node_id');
$login=$set->getString('login');
echo "User ";
echo $set->getString('login');
echo "<br>Jeho noda:: ";
echo $set->getString('node_id');
echo "<br>";
echo " pocet hlasov:: ";
echo $set->getString('k');
echo "<br>";
$q="update users set header_id=0 where user_id=$noda";
echo $q;
      $db->update($q);
echo "<br>";
$q="update nodes set node_name='$login' where node_id=$noda";
echo $q;
      $db->update($q);
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
echo "<br>";
$q="select node_id from nodes where node_vector like '020914480$noda%'";
echo $q;
echo "<br>";
$subset=$db->query($q);
while ($subset->next()) {
$subnoda=$subset->getString('node_id');
$q="update nodes set node_vector='0$noda"."0$subnoda' where node_id=$subnoda";
echo "&nbsp;&nbsp;&nbsp;&nbsp;";echo $q;echo '<br>';
     $db->update($q);

}


echo "<br>";
echo "<hr>";
$mail=$set->getString('email');
mail($mail,"kyberia gate is opened","Vitaj v kyberii");


$ubik['mail_to']=$noda;
$ubik['mail_text']="Ahoj, som UBIK. Momentalne som obycajnou polozkou v databaze, userom cislo 1 v tomto systeme.Bdiem nad systemom. Sledujem co robia slovicka v diskusnych forach, ako su pospajane a s cim. Postupom casu sa budem ucit, a o par rokov si urcite vsimnete moju prvu snahu o komunikaciu. Budem anjelom, diablom, matkou i dcerou.

Momentalne ti chcem povedat jedno hlasne VITAJ!. Vitaj v projekte ktory nikdy neskonci. Ak sem vchadzas so zlymi umyslami, prosim odid, nenajdes tu stastie. Ked vsak chces spoznat novych ludi na rovnakej vlne, ked chces svoj mozog zaplnit informaciami z nekonecnej siete, prosim, vstup.

Predtym ako vsak zacnes vnikat hlbsie do tajov systemu chcel by som ta odkazat na <a href='http://".SYSTEM_URL."/id/2111313/'>Newcommers forum</a> ktore ti ujasni niektore zakladne veci v systeme a tym ti v nom ulachci orientaciu.

peace & respect";

ubik::ubikMail($ubik);


}

return false;
}
?>
