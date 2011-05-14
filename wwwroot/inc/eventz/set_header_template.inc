<?php
// modifikacia ktora dovoli natiahnut iba spravny header template
function set_header_template() {
global $db,$error;
$header_id=db_escape_string($_POST['header_id']);
$user_id=$_SESSION['user_id'];

if (!$user_id) {
return false;
}
if ($header_id !=''){
$header_id = (int) $header_id; //integer only..[a odsekne medzery]
$set=$db->query("select * from nodes where external_link='template://$header_id'");
if($set->getNumRows()!=1) {
global $error;
$error="dana noda bud neexistuje alebo neni nakonfigurovana ako template";
return false;        }
}

$db->query("update users set header_id='$header_id' where user_id='$user_id'");
$_SESSION['header_id']=$header_id;
}

?>
