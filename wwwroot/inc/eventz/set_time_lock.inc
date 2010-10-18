<?
function set_time_lock(){
global $db,$error;
$user_id = $_SESSION['user_id'];
$nick=mysql_real_escape_string($_SESSION['user_name']);
$nick=$nick . '[Locked_OUT]';
$hodina=mysql_real_escape_string($_POST['hodina']);
$minuta=mysql_real_escape_string($_POST['minuta']);
$den=mysql_real_escape_string($_POST['den']);
$mesiac=mysql_real_escape_string($_POST['mesiac']);
$rok=mysql_real_escape_string($_POST['rok']);

$now=date("Y-m-d H:i:s");
$til_lockout="$rok-$mesiac-$den $hodina:$minuta:00";
if ($til_lockout >= $now) {

  $q="update users set acc_lockout='$til_lockout' where user_id=$user_id";
  $db->query($q);

  $q="update nodes set node_name='$nick' where node_id=$user_id";
  $db->query($q);
  $q="update users set login='$nick' where user_id=$user_id";
  $db->query($q);

  $ubik['mail_to']=$user_id;
  $ubik['mail_text']="Prave si si uspesne nastavil account lockout do $til_lockout";
  ubik::ubikMail($ubik);

  return true;

// !!! upravit login aby odtrhaval [locked_out]
// !!! upravit register event aby nekradol nicky


}else
{ $error="ten datum uz presiel. chces sa uzamknut v minulosti? len pre informaciu: momentalne je: $now";return false;}

}
