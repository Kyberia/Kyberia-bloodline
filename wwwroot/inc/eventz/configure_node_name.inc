<?php
function configure_node_name() {
    global $db,$error,$node;
    $node_id=$node['node_id'];
    $user_id=$_SESSION['user_id'];

    if (($node['node_permission']=='owner') || ($node['node_permission']=='master')) {
        $node_name = db_escape_string($_POST['node_name']);
        $test=$node_name.'[Locked_OUT]';

        if(!empty($node_id)) {
            if($node_id == $user_id) {
                $node_name=strip_tags($node_name);

//$validation = strpos($node_name, "'"); 
//if ($validation) {$error="Nepouzivaj ten otrasny znak '. co si myslis ze ludi to bude bavit pisat ti takto postu?";return false;}

               $node_name=strtr($node_name, "öûõü³¿ñæêœàáäåèéìíïòóôøùúšž¾ýÀÁÄÅÈÉÌÍÏÒÓÔØÙÚŠŽ¼ÝÄ","ououlzncesraalceeidnooruustzlyRAALCEEIDNOORUUSTZLYA"); //prec z diakritikou. ldap ju nezere

                if (strpos($node_name,'[Locked_OUT]')!=NULL){$error='Nemozes pouzit dany suffix';return false;}
                $set=$db->query("select * from users where login='$node_name'");
                if($set->getNumRows()>0) {
                    $error="user $node_name is already here";
                    return false;
                }else{
                $q="update users set login='$node_name' where user_id='$node_id'";
                $db->query($q);
                $_SESSION['user_name']=$node_name;}
            }
            $q="update nodes set node_name='$node_name' where node_id='$node_id'";
            $db->query($q);
        }
    }else{
        $error=$error_messages['EVENT_PERMISSION_ERROR'];
        return false; 
    }
    return true;
}
?>
