<?php
function register() {
    global $db, $error;

    $guild_id = db_escape_string(strip_tags(trim($_POST['guild_id'])));
    $content = db_escape_string(strip_tags(trim($_POST['reg_content'])));
    $email   = db_escape_string(strip_tags(trim($_POST['reg_email'])));
    $login   = db_escape_string(strip_tags(trim($_POST['reg_login'])));
    $xmpp    = db_escape_string(strtolower(strip_tags(trim($_POST['reg_login']))));
    $pass    = db_escape_string($_POST['reg_pass']);
    $pass2   = db_escape_string($_POST['reg_pass2']);
    
    if (empty($login)) {
        $error = 'please enter your nick name';
        return false;
    }
    elseif (empty($email)) {
        $error = 'please enter your email address';
        return false;
    }
    elseif (preg_match('/^(.+?)@(.+?)\.([a-z]{2,4})$/', $email) == false) {
        $error = 'please enter correct mail';
        return false;
    }
    elseif (empty($content)) {
        $error = 'please write something about you';
        return false;
    }
    elseif (strlen($pass) < 5) {
        $error = 'password toooooooo short, (<5)';
        return false;
    }
    elseif ($pass != $pass2) {
        $error = 'passwords do not match';
        return false;
    }

    $set = $db->query(sprintf('select login from users where 
				login = "%s" or email = "%s" or xmpp = "%s"', $login, $email, $xmpp));
    if ($set->getNumRows() > 0) {
        $error = sprintf('No-no, user with this nick/email is already registered');
        return false;
    }

    // registration clause  // XXX hard coded, registration text
    $qr_rc = $db->query('select node_content from nodes where node_id = '.REGISTRATION_TEXT_NODE);
    $qr_rc->next();

    $params['node_content'] = sprintf('<i>%s</i><br />%s<br />
                                       E-mail address:: %s',
                                      $qr_rc->getString('node_content'),
                                      $content,
                                      $email);
    // XXX hard-coded
    $params['node_parent']  = UNVERIFIED_REGISTRATIONS_NODE; // registrations_noverified forum
    $params['node_name'] = 'request for access';
	$params['node_creator']=UBIK_ID;
    $params['flag'] = 'registration';
    $user_id = nodes::addNode($params);

	
	//puttin in the guild node is realized only after email verification
	//nodes::putNode($user_id,$guild_id);

    $q = sprintf('update nodes set node_system_access = "private",node_creator=%d where node_id = %d', $user_id,$user_id);
    $db->update($q);

	$pass = md5($pass);
	$vercode = substr( md5( uniqid( rand() ) ), rand(0, 7), 23);
	$q = sprintf('insert into users set password = "%s", user_id = %d,
		header_id = 2091520, login = "%s", email = "%s",
		hash = "%s", xmpp="%s", guild_id="%s"',
		$pass, $user_id, $login, $email, $vercode, $xmpp, $guild_id);
	$db->query($q); // XXX rewrite
	$emailtext = sprintf(
'Vitaj %s! Prave som sa s radostou dozvedel, ze si vyplnil(a)
registracny formular na stranke '.SYSTEM_URL.' a chces sa stat
clenom tejto komunity.
Budem sa snazit urobit tento pokec trosku dlhsi,
lebo v povodnej kratkej forme ho pohlcuju spamfiltre, takze
ospravedln nasledujuce blabla a moj typicky atypicky zmysel
pre cierny humor, kedze sluzi ku dobrej veci :)
Pri registracii ti bol prideleny verifikacny kod.
Ten kod znie "%s" [bez uvodzoviek].
Ten musis zadat na adresu '.SYSTEM_URL.'/id/1976899/, kde 
vyplnis formular s tvojim nickom a verifkacnym kodom.
Od tej chvile bude tvoja ziadost volne pristupna
uz zaregistrovanym clenom, ktori o nej budu hlasovat.
Pocet hlasov aby sa ziadosti vyhovelo je x.
Deadline na nazbieranie je 1 tyzden.
Takze fakticky dufam ze si o sebe napisal(a) nieco inteligentne :)

Prajem pekny zvysok dna',
                         $login, $vercode);
    // edit by br
    $headers = 'From: kyberia@'. SYSTEM_URL . "\r\n" . 'X-Mailer: PHP';
    mail($email, SYSTEM_URL.' verification code', $emailtext, $headers);
    $error = '<h2>Request saved, verification code sent, please check your e-mail.<h2>';

    return false;
}
?>
