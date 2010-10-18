<?php
// pokus urobit neco z anketami:-))nerehocte sa moc hlasno:-))

        function vote() {
                global $node,$db,$error,$referer_id;
                if (!$referer_id) $referer_id=1;

                $node_id=$node['node_id'];
                $user_id=$_SESSION['user_id'];

        $set=$db->query("select * from node_access where node_id='$node_id' and user_id='$user_id' and node_permission='ban'");
               if($set->getNumRows()>0) {
                global $error;
                $error="F ankete si uz hlasoval. nene..uz sa to neda viackrat...dufam:-)";
               return false;        }


$option=$_POST['poll_option'];

$option--;

if (!is_numeric($option)) {
                        $error="incorrect poll_option. fck";
                }

                $poll=unserialize($node['node_content']);
                ++$poll[$option]['number'];
                $node_content=serialize($poll);
                $db->query("update nodes set node_content='$node_content'
where node_id='$node_id'");

$db->query("update node_access set node_permission='ban' where
node_id='$node_id' and user_id='$user_id'");
              Header("Location: /id/".$node['node_parent']."/");

        }
?>