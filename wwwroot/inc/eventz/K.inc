<?php
function hasAncestor($ancest, $n_id){
    foreach($ancest as $one){
        if($one['link'] == $n_id){ return true;}
    }
    return false;
}
function getAncestors($node_id){
    global $db;
    $q="select node_vector from nodes where node_id=".$node_id;
    $result=$db->query($q);
    if ($result->next()) {
        $node=$result->getRecord();
        $node['node_vector']=trim($node['node_vector'],"z");
        $ancestors=explode(' ',chunk_split($node['node_vector'],VECTOR_CHARS,' '));
        foreach ($ancestors as $ancestor) {
            $anc[]=array("name"=>"","link"=>ltrim($ancestor,"0"));
        }
        return $anc;
    }else{ return false;}
}
function getCommanders($node_id) {
    global $db;
    $set=$db->query("select node_permission,users.login,users.user_id from node_access left join users on node_access.user_id=users.user_id where node_id='$node_id' and node_permission!='' order by node_permission");
    while ($set->next()) {
        $commanders[$set->getString('node_permission')][]=$set->getString('user_id');
    }
    return $commanders;
}
function isCommander($comms,$user_id){
    foreach($comms['master'] as $one){
        if($one == $user_id){return true;}
    }
    foreach($comms['op'] as $one){
        if($one == $user_id){return true;}
    }
    foreach($comms['execute'] as $one){
        if($one == $user_id){return true;}
    }
    return false;
}
function isSenatOwner($senat_id, $user_id){
    global $db;
    $set=$db->query("select node_creator from nodes where node_id='$senat_id'");
    if ($set->next()) {
        if(($set->getString('user_id')) == $user_id){return true;}
    }
    return false;
}

function K() {
    global $db,$node,$error,$error_messages;
    $user_id=$_SESSION['user_id'];
    $user_name=$_SESSION['user_name'];
    $kset=$db->query("select user_k from users where user_id='$user_id'");
    $kset->next();
    $user_k=$kset->getString('user_k');

    // XXX hard coded
    $senat_id = 876611;
    $K_id     = 1961061;
    $comms    = getCommanders($K_id);
    $isComm   = isCommander($comms,$user_id);
    $isSOwner = isSenatOwner($senat_id, $user_id);

    if (is_array($_POST['node_chosen'])) {
        $k=$_POST['node_chosen'];
    }
    else $k[]=$node['node_id'];
    $db->query("set autocommit=0");

    foreach ($k as $id) {

	// prevent sqli
	$k = intval($k);
	if ($k == 0) {	continue; }
	
	
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
                    $db->query("update users set k_wallet=k_wallet+1 where user_id='$acceptor_id'");

                    $db->query("update nodes set k=k+1 where node_id='$id'");
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


