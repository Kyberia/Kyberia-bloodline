<?php
function F() {
global $db,$node,$error,$error_messages;
$user_id=$_SESSION['user_id'];
$user_name=$_SESSION['user_name'];
$kset=$db->query("select user_k from users where user_id='$user_id'");
$kset->next();
$user_k=$kset->getString('user_k');

$senat_id = 876611;
$K_id = 1961061;
$comms = getCommanders($K_id);
$isComm = isCommander($comms,$user_id);
$isSOwner = isSenatOwner($senat_id, $user_id);

if (is_array($_POST['node_chosen'])) {
$k=$_POST['node_chosen'];
}
else $k[]=$node['node_id'];
$db->query("set autocommit=0");

foreach ($k as $id) {

if ($user_k) {
$isSenat = hasAncestor(getAncestors($id), $senat_id);
if ($isSenat && !($isComm || $isSOwner)){
$error.="Sorry, ale v senate mozu Kckovat len obcania.";
}else{
$userset=$db->query("select node_creator from nodes where node_id='$id'");
$userset->next();
$acceptor_id=$userset->getString('node_creator');

$set=$db->query("select * from node_access where node_id='$id' and user_id='$user_id' and given_k='yes'");
if ($set->getNumRows()) {
$error.=$error_messages['K_GIVEN'];
}else{
--$user_k;
$db->query("update nodes set k=k-1 where node_id='$id'");
$db->query("insert into I set node_id='$id'");
$result=$db->update("update node_access set given_k='yes' where node_id='$id' and user_id='$user_id'");
if (!$result) {
$db->query("insert into node_access set given_k='yes',node_id='$id',user_id='$user_id',last_visit=NOW()");
}
}
}
}

else {
$error.=$error_messages['K_SPENT'];
}
}

$db->query("update users set user_k='$user_k' where user_id='$user_id'");
$db->query("commit");

if (!$error) return true;
else return false;
}

?>
