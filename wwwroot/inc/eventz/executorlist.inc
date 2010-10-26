<?php

        function executorlist() {
                global $db,$error,$node;
                $node_id=$node['node_id'];
                if ($node['node_permission']!='owner') {
                        $error=$error_messages['EVENT_PERMISSION_ERROR'];
                        return false;
                }

                $executors=explode(";",$_POST['executorlist']);
                $db->query("update node_access set node_permission='' where
 node_id=$node_id and node_permission='exec'");
                foreach ($executors as $execitpr) {
                        $set=$db->query("select user_id from users where login='$executor'");
                        $set->next();
                        if ($set->getString('user_id')) {
                                $q="update node_access set node_permission='exec' where node_id=$node_id and
user_id='".$set->getString('user_id')."'";
                                $changed=$db->update($q);
                                if (!$changed) {
                                        $q="insert into node_access set
node_permission='exec',node_id=$node_id,user_id=".$set->getString('user_id');
                                        $db->query($q);
                                        $logger::log('add exec',$node_id,'ok',$executor);

                                }
                        }
                        else { $error .= "$executor does not exist..."; }
                }
        }
?>
