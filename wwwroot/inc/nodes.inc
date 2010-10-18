<?php
   if (!function_exists('str_split')){
     function str_split($string, $split_length=1){

         if ($split_length < 1){
           return false;
         }

         for ($pos=0, $chunks = array(); $pos < strlen($string); $pos+=$split_length){
           $chunks[] = substr($string, $pos, $split_length);
         }
         return $chunks;
     }
   }

class nodes {



function addNode($params) {
        global $db,$node,$error,$error_messages;
        $parent_id=$params['node_parent'];

        if (!is_numeric($parent_id)) {
                $parent_id=$node['node_id'];
        }

        $parent_permissions=permissions::checkPermissions($parent_id);
        if (!$parent_permissions['w']) {
                $error=$error_messages['WRITE_PERMISSION_ERROR'];
                log::log('add','error','WRITE_PERMISSION_ERROR');
                return false;
        }


        $kset=$db->query("select user_k from users where user_id='$params[node_creator]'");
        $kset->next();
        $user_k=$kset->getString('user_k');

        if ($params['flag']=='registration') $params['node_creator']=UBIK_ID;

        if (!$user_k && $params['node_creator']!=UBIK_ID) {
                $error=$error_messages['K_SPENT'];
                return false;
        }



        $set=$db->query("select node_vector,node_children_count from nodes where node_id='$parent_id'");
        $set->next();
        $parent_vector=$set->getString('node_vector');

        if ($set->getInt('node_children_count')>MAX_CHILDREN) {
                $error=$error_messages['MAX_CHILDREN'];
                return false;
        }

        //working with external links
        $external_link=$params['external_link'];

        $template_id=$params['template_id'];
        if (!is_numeric($template_id)) $template_id=DEFAULT_TEMPLATE_ID;

        $q="insert into nodes set
node_name='".$params['node_name']."',
node_external_access='".$node['node_external_access']."',
node_system_access='".$node['node_system_access']."',
node_creator='".$params['node_creator']."',
template_id='".$template_id."',
external_link='".$external_link."',
node_parent='".$parent_id."',
node_views=0,node_created=NOW(),
node_content='".$params['node_content']."',
node_vector='".$params['node_vector']."'";
        $db->query("start transaction");
        $db->query($q);
        $id=$db->getLastInsertId();

//node_content MyIsam only for FULLTEXT !!!
//        $db->query("insert into node_content set node_id='$id',node_content='".$params['node_content']."'");

        $new_id=str_pad($id,VECTOR_CHARS,"0",STR_PAD_LEFT);
        $new_vector=trim($parent_vector,"z").$new_id;

        if ($params['flag']=='registration') $db->query("update nodes set node_system_access='public',node_external_access='yes',node_creator=$id where node_id=$id");

        $db->query("update nodes set node_vector='$new_vector' where node_id='$id'");
        $db->query("update nodes set node_children_count=node_children_count+1 where node_id='$parent_id'");

        $node_vector=trim(chunk_split($new_vector,VECTOR_CHARS,';'),';');

        $ancestors=explode(";",$node_vector);
        foreach($ancestors as $key => $ancestor_id) {
                if ($key) {
                        $ancestor_id=ltrim($ancestor_id,'0');
                        $db->query("update nodes set node_descendant_count=node_descendant_count+1,lastdescendant_created=NOW() where node_id='$ancestor_id'");
                }
        }
        $db->query("update node_access set node_user_subchild_count=node_user_subchild_count+1 where node_id='$parent_id'");
        --$user_k;
        $db->query("update users set user_k='$user_k' where user_id='$params[node_creator]'");
        $db->query("commit");
        log::log('add','ok',$id);

        if ($_POST['code']) {
                $params['node_creator']=UBIK_ID;
                $params['node_parent']=WARNING_ZONE;
                $params['node_name']="node $id added with code_parameter";
                $params['node_content']="node <a href='/id/$id'>$id</a> added with code_parameter";
                unset($_POST['code']);
                nodes::addNode($params);
        }

        return $id;
}


function processContent($node_content) {
        global $node;
        include_once(SYSTEM_ROOT.'/inc/htmlparse.inc');

        if ($node['template_id']==$node['node_id'] && $_POST['event']=='configure_content') {

        }

        elseif ($_POST['no_html']) {
                $node_content=htmlspecialchars($node_content);
        }

        elseif ($_POST['wiki']) {
                // load the class file
                require_once 'Text/Wiki.php';

                // instantiate a Text_Wiki object with the default rule set
                $wiki =& new Text_Wiki();

                $node_content = $wiki->transform($node_content, 'Xhtml');
        }

        elseif ($_POST['code']) {}

        else {
                global $db,$htmlparse,$error;

                if (!htmlparse::htmlparse($node_content)) {
                        $error=$htmlparse;
                        return false;
                }

                $node_content = eregi_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank' href=\"\\6\\7\">\\6\\7</a>",$node_content);
		$node_content = mysql_real_escape_string($node_content);
        }

        return $node_content;
}


        function getUserByLogin($login) {
                global $error, $error_messages;
                $q2="select user_id from users where login='".$login."'";
                $userset=$db->query($q2);
                $userset->next();
                $id=$userset->getString('user_id');
                if (is_numeric($id)) return $id;
                else {
                        $error = $error_messages['USER_NOT_FOUND'];
                        return false;
                }
        }


        function getNodeIdByName($name,$external_link=false) {
                global $db;
                $q="select node_id from nodes where node_name='$name'";
                if ($external_link) $q.=" and external_link='$external_link'";
                $set=$db->query($q);
                $set->next();
                return $set->getString('node_id');
        }

        function getNodeById($node_handle,$user_id, $table_name="nodes") {
                global $db, $error;
                $q="select length(concat($table_name.node_vector)) as
vector_depth,$table_name.*,$table_name.node_creator as
node_owner_id,creator.node_name as owner,node_access.*,$table_name.node_id as
node_id,node_parent.node_name as node_parent_name
from $table_name left join $table_name as creator on creator.node_id=$table_name.node_creator
left join $table_name as node_parent on $table_name.node_parent=node_parent.node_id
left join node_access on (node_access.node_id='$node_handle' and node_access.user_id='$user_id')
where $table_name.node_id='$node_handle'";

                $result=$db->query($q);
                if (!$result->next()) {
                        return false;
                }
                else {
                        $node=$result->getRecord();
                        $node['node_vector']=trim($node['node_vector'],"z");
                        $ancestors=str_split($node['node_vector'],VECTOR_CHARS);
                        foreach ($ancestors as $ancestor) {
                          $node['ancestors'][]=array("name"=>"","link"=>ltrim($ancestor,"0"));
                        }
                }
                return $node;

        }


        function redirByName($node_handle) {
                global $db, $error;
                $user_id=$_SESSION['user_id'];
                $set=$db->query("select node_id from nodes where node_name='$node_handle' and node_creator='$user_id'");
                if ($set->next()) {
                        $node_id=$set->getString('node_id');
                        if (!empty($node_id)) {
                                return nodes::getNodeById($node_id,$_SESSION['user_id']);
                        }

                }
                $set=$db->query("select node_id from nodes where node_name='$node_handle' ");
                $set->next();
                $node_id=$set->getString('node_id');
                if (!empty($node_id)) {
                        return nodes::getNodeById($node_id,$_SESSION['user_id']);
                }

        }

        function getNodesByName($node_handle) {
                global $db, $error;
                $q="select nodes.* from nodes where node_name='$node_handle%'";

                $result=$db->query($q);

                while ($result->next()){
                        $record[]=$result->getRecord();
                }
                return $record;

        }



        function getChildrenNodes($orderby="desc",$offset=0,$limit=DEFAULT_LISTING_AMOUNT) {
                global $db, $error, $node;
                $node_handle=$node['node_id'];

                $q="select users.*,nodes.* from nodes
left join users on users.user_id=nodes.node_creator where
node_parent='$node_handle' order by node_created $orderby LIMIT $offset,$limit";
                echo $q;
                $result=$db->query($q);

                while ($result->next()) {
                        $array[]=$result->getRecord();
                }

                return $array;

        }


        function getThreadedChildrenNodes($orderby="desc",$offset=0,$limit=DEFAULT_LISTING_AMOUNT) {
                global $db, $error, $node;
                $node_handle=$node['node_id'];

                $q="select length(node_vector) as depth,users.login,nodes.* from nodes left join users on users.user_id=nodes.node_creator where  node_vector like '".$node['node_vector'].";".$node['node_id']."%' and node_type=3 order by concat(node_vector,';',nodes.node_id,';z') desc,depth LIMIT $offset,$limit";

                $result=$db->query($q);

                while ($result->next()) {
                        $children_array[]=$result->getRecord();
                }

                return $children_array;

        }



        function getNodeAccessData() {
                global $node,$db;
                $q="select users.login,node_access.* from node_access left join users on users.user_id=node_access.user_id where node_id='".$node['node_id']."' and node_permission!=''";
                $result=$db->query($q);

                while ($result->next()) {
                        $access_data[]=$result->getRecord();
                }

                return $access_data;

        }
}

?>