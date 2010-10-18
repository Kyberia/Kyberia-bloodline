<?php

// registration 2.3 rc3
// dedicated to Sylvia S. Always in my memory...
// PLLLZ dont delete this line. anyone who touches this file...and dont ask why

function cron_test() {
    global $db,$error;

    // potrebne K na reg z paralelneho senatu
    $regk_node = '1870247';
    $fajl = OWN_TEMPLATE_DIR . $regk_node . ".tpl";
    $fp = fopen($fajl, "r");
    $regk = fread($fp, filesize($fajl));
    fclose($fp);

    // >>>> registracia
    $q = "select users.login as persona,users.email as email,k,node_id,node_creator,node_created,login from nodes
 left join users on nodes.node_creator = users.user_id where node_name = 'request for access' and node_parent = '2091448' and
 k >= $regk";

    $set = $db->query($q);
    while ($set->next()) {
        $noda = $set->getString('node_id');
        $login = $set->getString('login');
        $created = $set->getString('node_created');
        echo "Noda vytvorena:: " . $created . "<br>";
        echo "User:: " . $set->getString('login') . "<br>";
        echo "Jeho noda:: " . $set->getString('node_id') . "<br>";
        echo "pocet hlasov:: " . $set->getString('k') . "<br>";

        $q = "update users set header_id = '0', user_mail = '0' where user_id = $noda";
        echo $q . "<br>";
        $db->update($q);

        $q = "update nodes set node_name = '$login', external_link = 'db://user', template_id = '7',
 node_parent = '0', node_vector = '0$noda' where node_id = $noda";
        echo $q . "<br>";
        $db->update($q);


        // REGISTRATORI USERA
        $registrators = $db->query($q = "select node_access.user_id, users.login from node_access
 join users on node_access.user_id = users.user_id where node_id = '$noda' and given_k = 'yes' order by login");
        $ubiknode['node_content'] = "Registered by::<br>";
        while($registrators->next()){
            $ubiknode['node_content'] .= "<a href='/id/" . $registrators->getString('user_id') . "'>" .
$registrators->getString('login') . "</a><br>";
        }
        $ubiknode['node_content'] .= "with " . $set->getString('k') . "K";
        $ubiknode['node_content'] = addslashes($ubiknode['node_content']);
        $ubiknode['node_name'] = "successfully registered";
        $ubiknode['node_creator'] = 332;
        $ubiknode['node_parent'] = $noda;
        $ubiknode['template_id'] = 4;
        $ubiknode_id = nodes::addNode($ubiknode);
        $db->update("update nodes set node_system_access = 'public', node_vector = '0$noda"."0$ubiknode_id' where node_id = '$ubiknode_id'");
        echo $ubiknode['node_content'] . "<br>";

        $q = "update nodes set k = 0 where node_id = '$noda'";
        echo $q . "<br>";
        $db->update($q);

        $q = "update node_access set given_k='no' where node_id = '$noda'";
        echo $q . "<br>";
        $db->update($q);

        // PRESUN KOMENTAROV K REGISTRACII DO USERNODY
        $q = "select node_id,node_vector from nodes where node_vector like '00876611020914480$noda%'
 and node_vector != '00876611020914480$noda' and node_vector != '0$noda'";
        echo $q . "<br>";
        $subset = $db->query($q);
        while ($subset->next()) {
            $subnoda = $subset->getString('node_id');
            $subnoda_vector = $subset->getString('node_vector');
            $subnoda_vector = str_replace("00876611020914480$noda", "0$noda", $subnoda_vector);
            $q = "update nodes set node_vector = '$subnoda_vector' where node_id = $subnoda";
            echo "&nbsp;&nbsp;&nbsp;&nbsp;" . $q . "<br>";
        $db->update($q);
        }

        echo "<br><hr>";

        $mailto = $set->getString('email');
        $headers =  'From: admin@kyberia.sk' . "\r\n" .
                    'Reply-To: darkaural@kyberia.sk, freezy@kyberia.sk' . "\r\n" .
                    'X-Mailer: PHP/' . phpversion();
        $emailtext = " Vitaj v Kyberii. \n S radostou ti oznamujem, ze registracia, ktoru si napisal(a) dna $created bola
 uspesne schvalena s poctom hlasov $set->getString('k'). Odteraz je tvoje konto povolene a mozes sa volne prihlasovat,
 prispievat...no proste 'bavit sa':-)) \n Uzivaj si kyberpriestoru:-)))
 \n\n DarkAural & freezy \n DarkAural@kyberia.sk & freezy@kyberia.sk";
        mail($mailto,"kyberia gate opened",$emailtext,$headers );


        $ubik['mail_to'] = $noda;
        $ubik['mail_text'] = "Ahoj, som UBIK. Momentalne som obycajnou polozkou v databaze, userom cislo 1 v tomto
 systeme.Bdiem nad systemom. Sledujem co robia slovicka v diskusnych forach, ako su pospajane a s cim. Postupom casu sa budem
 ucit, a o par rokov si urcite vsimnete moju prvu snahu o komunikaciu. Budem anjelom, diablom, matkou i dcerou.

Momentalne ti chcem povedat jedno hlasne VITAJ!. Vitaj v projekte ktory nikdy neskonci. Ak sem vchadzas so zlymi umyslami, prosim
 odid, nenajdes tu stastie. Ked vsak chces spoznat novych ludi na rovnakej vlne, ked chces svoj mozog zaplnit informaciami z
 nekonecnej siete, prosim, vstup.

Predtym ako vsak zacnes vnikat hlbsie do tajov systemu chcel by som ta odkazat na
 <a href='http://kyberia.sk/id/2111313/'>Newcommers forum</a> ktore ti ujasni niektore zakladne veci v systeme a
 tym ti v nom ulachci orientaciu.

peace & respect";
        ubik::ubikMail($ubik);
    }

// ---------------------------------------------------------------------

    echo "<hr>Mazanie userov<hr>";
    // >>>>> Mazanie

    $q = "select users.login as persona,users.email as email,k,node_id,node_creator,node_created,login from nodes
 left join users on nodes.node_creator = users.user_id where node_name = 'request for access' and node_parent = '2091448' and
 k < $regk and DATE_SUB(CURDATE(),INTERVAL 7 DAY) >= node_created";

    $set = $db->query($q);
    while ($set->next()) {
        $noda=$set->getString('node_id');
        $created=$set->getString('node_created');
        echo "Noda vytvorena:: " . $created . "<br>";
        echo "Uchadzac:: " . $set->getString('login') . "<br>";
        echo "Jeho noda:: " . $set->getString('node_id') . "<br>";
        echo "pocet hlasov:: " . $set->getString('k') . "<br>";

        $q = "delete from users where user_id = $noda";
        echo $q . "<br>";
        $db->update($q);

        $q = "delete from nodes where node_vector like '00876611020914480$noda%'";
        echo $q . "<br>";
        $db->update($q);

        echo "<br><hr>";

        $mailto =   $set->getString('email');
        $headers =  'From: admin@kyberia.sk' . "\r\n" .
                    'Reply-To: darkaural@kyberia.sk, freezy@kyberia.sk' . "\r\n" .
                    'X-Mailer: PHP/' . phpversion();
        $emailtext = " Tak mam pre teba smutnu spravu. \n Registracia ktoru si napisal(a) dna $created bola zamietnuta
 z dovodu nedostatocneho poctu hlasov ($set->getString('k')) ktore tvoja osoba dostala. Je celkom mozne,
 ze to, co si o sebe napisal(a) dostatocne nezaujalo ludi co su dnu ale to neni dovod na to aby si to vzdal(a)!
 \n Registrovat sa mozes hocikedy znovu a snad sa to nabuduce vydari.
 \n\n DarkAural & freezy \n DarkAural@kyberia.sk & freezy@kyberia.sk";
        mail($mailto,"kyberia: registracia zamietnuta",$emailtext,$headers );
    }

// -------------------------------------------------------------------

    echo "<hr>Mazanie nonverified<hr>";
    // >> mazanie neverifikovanych

    $q = "select users.login as persona,users.email as email,k,node_id,node_creator,node_created,login from nodes
 left join users on nodes.node_creator = users.user_id where node_name = 'request for access' and
 node_parent=1836516 and DATE_SUB(CURDATE(),INTERVAL 7 DAY) >= node_created";

    $set = $db->query($q);
    while ($set->next()) {
        $noda = $set->getString('node_id');
        $created = $set->getString('node_created');
        echo "Noda vytvorena:: " . $created . "<br>";
        echo "Uchadzac:: " . $set->getString('login') . "<br>";
        echo "Jeho noda:: " . $set->getString('node_id') . "<br>";
        echo "pocet hlasov:: " . $set->getString('k') . "<br>";

        $q = "delete from users where user_id = $noda";
        echo $q . "<br>";
        $db->update($q);

        $q="delete from nodes where node_vector like '018365160$noda%'";
        echo $q . "<br>";
        $db->update($q);

        echo "<br><hr>";

        $mailto = $set->getString('email');
        $headers =  'From: admin@kyberia.sk' . "\r\n" .
                    'Reply-To: darkaural@kyberia.sk, freezy@kyberia.sk' . "\r\n" .
                    'X-Mailer: PHP/' . phpversion();
        $emailtext = " Registracia, ktoru si napisal(a) dna $created si neverifikoval(a) a tak po tyzdni stratila svoju platnost
 a bola zmazana. Ak ti nedosiel ziaden verifikacny kod prosim kontaktuj ma, je to mozne ze je to chyba niekde
 na ceste medzi kyberiou a tebou, ak to bol zamer neverifikovat sa tak tuto spravu ber cisto informacne:-)).
 \n Ak sa naozaj stala chyba a mas stale chut a volu vstupit do autonomnej zony mozes hocikedy znovu vyplnit
 registracny formular a pokusit sa o to znovu.
 \n\n DarkAural & freezy \n DarkAural@kyberia.sk & freezy@kyberia.sk";
        mail($mailto,"kyberia: neverifikovana ziadost zmazana",$emailtext,$headers );
    }

    return false;
}
?>