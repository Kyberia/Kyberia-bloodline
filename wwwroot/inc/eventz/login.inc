<?php
function login() {

    global $db,$error,$node_id;
    $login = mysql_real_escape_string($_POST['login']);
    $password = $_POST['password']; // Not SQLi but be carefull
    $password_hash_algos=array('sha256','sha1','md5'); //List of supported algos can be obtained using: php -r 'print_r(hash_algos());'

    $hash_query='(';
    foreach($password_hash_algos as $algo) {
      $hash_query.="password='".hash($algo, $password)."' OR ";
    }
    $hash_query.='false )';

    $login_type = $_POST['login_type'];
    $referer = $_SERVER['HTTP_REFERER'];

    if (!session_id()) {
        $error='asi nemas zapnute cookies alebo co';
        return false;
    }

    switch ($login_type) {
        case "name":
            $q = "select * from users where login='$login' and $hash_query";
            $set = $db->query($q);
            $set->next();
            $user_id = $set->getString('user_id');
            $user_name = $set->getString('login');
        break;
        case "base36id":
					$login = base_convert($login, 36, 10);
        case "id":
            // HA! if it is number, escape_string is not enough
	    $login=intval($login);

            $q="select * from users where user_id='$login' and $hash_query";
            $set=$db->query($q);
            $set->next();
            $user_id=$set->getString('user_id');
            $user_name=$set->getString('login');
        break;
    }

    if (!$set) { //XXX test
        $error="Zadal si nespravne uzivatelske meno [alebo id] alebo heslo. Rob so sebou nieco";
        return false;
    }
    elseif ($set->getString('header_id') == 2091520) {
        $error='Tvoja registracia este nebola schvalena.';
        return false;
    }
    else {
        $now=date("Y-m-d H:i:s");
        $lockout=$set->getString('acc_lockout');
        if ($lockout >= $now ) {
            global $error;
            $error="Account lockout mas aktivny. Sorry ale neprihlasis sa minimalne do $lockout.
Prajem prijemnu odvykacku:-)";
            return false;
        }

//	Login sucessfull

	// prevent session fixation
	session_regenerate_id(); 

        $cube_vector=$set->getString('cube_vector');

        // saves friends list as an array into user session
        $q="select distinct node_parent,node_name from nodes where node_creator='$user_id' and
external_link='session://friend' order by node_parent";
        $friendset=$db->query($q);
        while ($friendset->next()){
            $_SESSION['friends'][$friendset->getString('node_parent')]=true;
        }

        // saves bookmarks as an array into user session
        $q="select nodes.node_name,nodes.node_id from node_access left join nodes on node_access.node_id=nodes.node_id
where node_access.user_id='$user_id' and node_bookmark='yes' order by node_name";
        $bookmarkset=$db->query($q);
        while ($bookmarkset->next()){
            $_SESSION['bookmarks'][$bookmarkset->getString('node_id')]=$bookmarkset->getString('node_name');
        }

        //saves ignored users as an array into user session
        $q="select node_parent from nodes where node_creator='$user_id' and external_link='session://ignore'";
        $ignoreset=$db->query($q);
        while ($ignoreset->next()){
            $_SESSION['ignore'][$ignoreset->getString('node_parent')]=true;
        }

        //saves fooked forums as an array into user session
        $q="select node_parent from nodes where node_creator='$user_id' and external_link='session://fook'";
        $fookset=$db->query($q);
        while ($fookset->next()){
            $_SESSION['fook'][$fookset->getString('node_parent')]=true;
        }


        //save bookstyle into user session
        $q="select node_content from nodes where node_parent=19 and external_link='session://bookstyl' and node_creator='$user_id'";
        $bookstylset=$db->query($q);
        $bookstylset->next();
        $_SESSION['bookstyl'] = $bookstylset->getString('node_content');

        // mood
        $mset = $db->query(sprintf('select moods from users where user_id = %d', $user_id));
        $mset->next();
        $moods_expl = explode(";",$set->getString('moods'));
        if (!empty($moods_expl[count($moods_expl)-1])) {
            $_SESSION['mood_id'] = $moods_expl[count($moods_expl)-1];
            $mset = $db->query(sprintf('select node_name, node_content from nodes where node_id = %d', $moods_expl[count($moods_expl)-1]));
            $mset->next();
            $_SESSION['mood_name'] = $mset->getString('node_name');
            $_SESSION['mood_content'] = addslashes(substr(strip_tags($mset->getString('node_content')),0,223));
        }
        // last login

	$db->query(sprintf('update users set date_last_login = NOW() where user_id = %d', $user_id));

        $_SESSION['user_id']=$user_id;
        $_SESSION['user_name']=addslashes($user_name);
	setcookie('jabber_login', strtolower($user_name), time()+60*60*24*10, '/'); //10days on whole domain - should have persistent username in future...
	setcookie('jabber_password', hash('md5', 'jabber:'.$_POST['password']), time()+60*60*24*10, '/'); //10days on whole domain
        if (!empty($cube_vector)) $_SESSION['cube_vector']=$cube_vector;
        if (empty($_SESSION['template_set'])) $_SESSION['template_set']=$set->getString('template_set');
        if (is_numeric($_POST['screen_width'])) $_SESSION['browser']['screen_width']=$_POST['screen_width'];
        if (is_numeric($_POST['screen_height'])) $_SESSION['browser']['screen_height']=$_POST['screen_height'];
        $_SESSION['listing_amount']=$set->getString('listing_amount');
        $_SESSION['listing_order']=$set->getString('listing_order');
        $_SESSION['header_id']=$set->getString('header_id');
    }
//    header("Location: $referer");
    return true;
}
?>
