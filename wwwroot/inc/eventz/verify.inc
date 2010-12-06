<?
function verify() {

global $db;
$uvercode=mysql_real_escape_string($_POST['vc']);
$login=mysql_real_escape_string($_POST['login']);

$kset=$db->query("select user_id from users where login='$login'");
$kset->next();$userid=$kset->getString('user_id');

$set=$db->query("select * from nodes where node_id='$userid' and node_parent=1836516");
if($set->getNumRows()!=1) {
         global $error;
         $error="User already verificated or invalid.";
         return false;
}


$kset=$db->query("select hash from users where login='$login'");
$kset->next();$vercode=$kset->getString('hash');

if($uvercode!=$vercode) {
global $error;
$error="Wrong verification code or username";
return false;
}

else {
//  ouch!! this is gonna be dirty!!!!! will be revised later:-)
// XXX hardcoded, rewrite
$q="update nodes set node_parent=2091448, node_vector='00876611020914480$userid' where node_id='$userid'";
$db->update($q);
$q="update nodes set node_children_count=node_children_count+1 where node_id=2091448";
$db->update($q);
$q="update nodes set node_created=NOW() where node_id='$userid'";
$db->update($q);
$q="update nodes set node_system_access='public' where node_id='$userid'";
$db->update($q);
$q="update node_access set node_user_subchild_count=node_user_subchild_count+1 where node_id=2091448";
$db->update($q);


// and now the happy news:-))


echo "<center>Verification successfull.<br><h3>from now on your registration is in the hands of kyberians</h3></center>";

die();
}
}
?>
