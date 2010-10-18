<?
function spamuj_ubik() {
global $db,$node,$error;
$sprava="Ahoj! tak s radostou ta mozem poinformovat o par zmenach v systeme<br>";

// oznamovanie niektorych ficur z newlistu via ubik vsem userom

if (is_array($_POST['node_chosen'])) {
$srcs=$_POST['node_chosen'];
}else{ global $error;
        $error="EE wisco zlatko. to nepude. mozno si nic nevybral tak nemam co                 rozspamovat. cmuk* Ubik";
        return false;}


foreach ($srcs as $chosen) {  // konstructor of the messages
$kset=$db->query("select node_content from node_content where node_id='$chosen'");$kset->next();
$sprava=$sprava.$kset->getString('node_content').'<br><hr><br>';
}

$pocitadlo=0;
$q="select user_id from users";
$set=$db->query($q);
while ($set->next()) {
 $adresat=$set->getString('user_id');echo '<br>';
 $ubik['mail_to']=$adresat;
 $ubik['mail_text']=$sprava;
 ubik::ubikMail($ubik);
$pocitadlo=$pocitadlo+1;

}


echo "sprava $sprava <br> bola odoslana $pocitadlo userom";
return false;

}?>