<?
function unset_time_lock(){
global $db,$error;
$user_id = $_SESSION['user_id'];
  $q="update users set acc_lockout=NULL where user_id=$user_id";
  $db->query($q);

$kset=$db->query("select login from users where user_id='$user_id'");
$kset->next();
$nick=$kset->getString('login');
$exploded=explode("[Locked_OUT]", $nick);
$nick=mysql_real_escape_string($exploded[0]);


  $q="update nodes set node_name='$nick' where node_id=$user_id";
  $db->query($q);
  $q="update users set login='$nick' where user_id=$user_id";
  $db->query($q);



$error="ok. tvoj timelock bol zruseny.";
return false;
}
?>