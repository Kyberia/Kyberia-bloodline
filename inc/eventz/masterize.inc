<?php
function masterize() {
        global $error,$db;
        $uname=  mysql_real_escape_string($_SESSION['user_name']);
        $user =  mysql_real_escape_string($_POST['userto']);
        $node =  mysql_real_escape_string($_POST['nodeto']);
        $priv =  mysql_real_escape_string($_POST['privileg']);
        $pass_posted= mysql_real_escape_string($_POST['passpost']);
        $comment = mysql_real_escape_string($_POST['comment']);
        $banned_nodes='1059888;2019771;2019772;2029360;2058745';
        $password='33a7aa9a96b1a4a41637a670cee8d4bf';
        $go=1;

if (!is_numeric($user) or !is_numeric($node)) {$error='noda a user musia byt ciselne';return false;}

if ($password != md5($pass_posted)) {$go=0;$passstate="<span class='most_important'>Bad Password</span>";}else{$passstate='ok';}

if (!$comment){$go=0;$commentstate="<span class='most_important'>Invalid comment</span>";$comment="<span class='most_important'>INVALID!!!</span>";}else{$commentstate='OK';}

if (strpos($banned_nodes, $node)){$go=0;$bannedstate="<span class='most_important'>Masterize usage on banned nodes</span>";}else{$bannedstate='OK';}


$passstate=addslashes($passstate);
$bannedstate=addslashes($bannedstate);
$comment=addslashes($comment);
$final=addslashes($final);
if ($go==1){$final="<span class='important_y'>GRANTED!!!</span>";}else{$final="<span class='important_n'>NOT GRANTED!!!</span>";}



        $params['node_creator']=UBIK_ID;
        $params['node_parent']=2058745;
        $params['node_name']="masterize execute: user $user, priv: $priv on node: $node by $uname";
        $params['node_content']="User who executed masterize: $uname";
        $params['node_content'].="<br />User who wanted to gain privilegues: $user";
        $params['node_content'].="<br />Node on whitch the privilegues should be gained: $node";
        $params['node_content'].="<br />Type of privilegues [empty is for delete]: $priv";
        $params['node_content'].="<br />Password state is: $passstate";
        $params['node_content'].="<br />Banned nodes check is: $bannedstate";
        $params['node_content'].="<br />commentz: $comment";
        $params['node_content'].="<br/><br/>$final";
 $params['node_content']=addslashes($params['node_content']);
nodes::addNode($params);




if ($go==1){
$q="update node_access set node_permission='$priv' where node_id=$node and user_id='$user'";
$changed=$db->update($q);
if (!$changed) {
$q="insert into node_access set node_permission='$priv',node_id='$node',user_id='$user'";
$db->query($q);
$error="access granted";}}else{$error='access denied';}




return false;
    }

?>