<?php
class nodes {
// All mysql code should go here
// Split into multiple files if needed

public static function processContent($node_content) { return processContent_hack($node_content); } //XXX TODO FIXME HACK

// Called for every node view. Updates node views, neurons, 
public static function update_nodes($user_id,$node_id,$referer_id) {
	global $node,$db,$error;
	$db->update("update nodes set node_views=node_views+1 where".
		     "node_id='".$node_id."'");
	if (is_numeric($referer_id) && ($referer_id)) {
		$q="update neurons set synapse=synapse+1 where ".
		    "dst='".$node_id."' and src='$referer_id'";
		$result=$db->update($q);
		if (!$result) {
			$q="insert into neurons set synapse_creator='".
			   $user_id."',dst='".$node_id.
			   "',src='$referer_id',synapse=1";
			$db->query($q);
		}
	}

	// LEVENSHTEIN

	// these 4 lines are not the source of kyberia lagging problems.
	// leave them. started on the 10.4. 
	// data gained will be used for scientific purposes
	if ($user_id) {
	        $q="insert delayed into levenshtein set user_id='".
		    $user_id."',node_id='".$node_id."'";
	        $db->update($q);
	}
}


public static function putNode($what,$where,$checkpermissions=true) {
	global $db,$error,$error_messages;
	$user_id = $_SESSION['user_id'];
	if (!$user_id) {
		$user_id=UBIK_ID;
	}
	if (!is_numeric($what) || !is_numeric($where)) {
		$error=$error_messages['NUMERIC_NOT_NUMERIC'];
	}

	$nodeshell = nodes::getNodeById($where,$user_id);
	$nodeshell_vector = $nodeshell['node_vector'];
	
	if ($checkpermissions) {
		$nodeshell_permissions = permissions::checkPerms($nodeshell);
		if (!$nodeshell_permissions['w']) {
			$error = $error_messages['WRITE_PERMISSION_ERROR'];
			return false;
    		}
	}

	$dst_vector = $nodeshell_vector.str_pad($chosen,VECTOR_CHARS,0,STR_PAD_LEFT);
	$q = "update neurons set synapse_created=NOW(),link='hard',synapse=synapse+1, dst_vector='$dst_vector' where src='$what' and dst='$where'";
	$result=$db->update($q);

	if (!$result) $db->query("insert into neurons set synapse_creator='$user_id',synapse_created=NOW(), src='$what',dst='$where',dst_vector='$dst_vector',link='hard',synapse=1");
	$db->query("update nodes set lastdescendant_created=NOW(),node_children_count=node_children_count+1 where node_id='$where'");
}

public static function addNode($params) {
        global $db,$node,$error,$error_messages;
        $parent_id=$params['node_parent'];

        if ($params['flag']=='registration') $params['node_creator']=UBIK_ID;

        if (!is_numeric($parent_id)) {
                $parent_id=$node['node_id'];
        }

        $parent_permissions=permissions::checkPerms($parent_id);

        if (!$parent_permissions['w']) {
                $error=$error_messages['WRITE_PERMISSION_ERROR'];
                logger::log('add','error','WRITE_PERMISSION_ERROR');
                return false;
        }


        $kset=$db->query("select user_k from users where user_id='$params[node_creator]'");
        $kset->next();
        $user_k=$kset->getString('user_k');

        if (!$user_k && $params['node_creator']!=UBIK_ID) {
                $error=$error_messages['K_SPENT'];
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

        if(!isset($params['node_system_access'])) $params['node_system_access'] = $node['node_system_access'];
        if(!isset($params['node_external_access'])) $params['node_external_access'] = $node['node_external_access'];

        $q="insert into nodes set
node_name='".$params['node_name']."',
node_external_access='".$params['node_external_access']."',
node_system_access='".$params['node_system_access']."',
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
        logger::log('add','ok',$id);

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


public static function getUserByLogin($login) {
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

public static function getNodeIdByName($name, $external_link=false) {
	global $db;

	$qh = sprintf('select node_id from nodes where node_name = "%s"', db_escape_string($name));
    	if ($external_link)
		$qh .= sprintf(' and external_link="%s"', db_escape_string($external_link));

	$set = $db->query($qh);
	$set->next();
	return $set->getString('node_id');
}

public static function getNodeById($node_handle,$user_id, $table_name="nodes") {
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
		$node=addBase36id($result->getRecord());
		$node['node_vector']=trim($node['node_vector'],"z");
		$ancestors=str_split($node['node_vector'],VECTOR_CHARS);
		foreach ($ancestors as $ancestor) {
			$node['ancestors'][]=array("name"=>"","link"=>ltrim($ancestor,"0"));
		}
	}
	transport_process_node($node);
	return $node;

}


public static function redirByName($node_handle) {
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

public static function getNodesByName($node_handle) {
	global $db, $error;
	$q="select nodes.* from nodes where node_name='$node_handle%'";

	$result=$db->query($q);

	while ($result->next()){
		$record[]=addBase36id($result->getRecord());
	}
	return $record;

}



public static function getChildrenNodes($orderby="desc",$offset=0,$limit=DEFAULT_LISTING_AMOUNT) {
	global $db, $error, $node;
	$node_handle=$node['node_id'];

	$q="select users.*,nodes.* from nodes
left join users on users.user_id=nodes.node_creator where
node_parent='$node_handle' order by node_created $orderby LIMIT $offset,$limit";
	#echo $q;
	$result=$db->query($q);

	while ($result->next()) {
		$array[]=addBase36id($result->getRecord());
	}

	return $array;

}


public static function GetUserSubmissionsChildren($user_id,$limit=23,$offset=0,$orderby='') {
  global $db;

	if (!is_numeric($user_id)) {
		return -1;
	}
	if (!is_numeric($limit)) {
		return -1;
	}
	if (!is_numeric($offset)) {
		return -1;
	}

	// XXX orderby mysql escape

	$q = "select child.*, users.login as login, parent.node_name as parent_name from nodes as child join 
		(select node_id,node_name,node_creator from nodes where node_creator='$user_id')
		as parent on child.node_parent=parent.node_id and child.node_creator <> '$user_id'
		join users as users on users.user_id=child.node_creator order by node_created desc
		$orderby LIMIT $offset,$limit";

  #echo $q;
  $result=$db->query($q);

  while ($result->next()) {
    $array[]=addBase36id($result->getRecord());
  }

  return $array;
}

public static function getThreadedChildrenNodes($orderby="desc",$offset=0,$limit=DEFAULT_LISTING_AMOUNT) {
	global $db, $error, $node;
	$node_handle=$node['node_id'];

	$q="select length(node_vector) as depth,users.login,nodes.* from nodes left join users on users.user_id=nodes.node_creator where  node_vector like '".$node['node_vector'].";".$node['node_id']."%' and node_type=3 order by concat(node_vector,';',nodes.node_id,';z') desc,depth LIMIT $offset,$limit";

	$result=$db->query($q);

	while ($result->next()) {
		$children_array[]=addBase36id($result->getRecord());
	}

	return $children_array;

}



public static function getNodeAccessData() {
	global $node,$db;
	$q="select users.login,node_access.* from node_access left join users on users.user_id=node_access.user_id where node_id='".$node['node_id']."' and node_permission!=''";
	$result=$db->query($q);

	while ($result->next()) {
		$access_data[]=$result->getRecord();
	}

	return $access_data;

}


// Simple internal function to set node parrent

public static function setParent($node_id,$parent_id) {
	global $db,$node,$error,$error_messages;

	if (!is_numeric($parent_id)) {
		return false;
	}

	$q="select node_vector from nodes where node_id='$parent_id'";
	$set=$db->query($q);
	$set->next();
	$parent_vector=$set->getString('node_vector');
	$new_vector=$parent_vector.str_pad($node_id,VECTOR_CHARS,"0",STR_PAD_LEFT);

	$q="update nodes set node_parent='$parent_id',node_vector='$new_vector' where node_id='$node_id'";
	$db->query($q);

	return 0;
}

// Get last submissions of all users on kyberia.
// XXX ad permission checking
// XXX remove constants

public static function getLast($params) {
	global $db,$node,$error,$error_messages;

	if ($params['listing_amount']=='all') $listing_amount='-1';
	else $listing_amount=addslashes($params['listing_amount']);
	if (empty($params['offset'])) $offset=0;
	else $offset=addslashes($params['offset']);

	global $db,$node;
	if ($node['node_id']==DEF_LAST_NODE)  {
		$interval=" nodes.node_created>NOW()-INTERVAL 65 HOUR and";
		$vector="00";
	}	else {

		$vector=$node['node_vector'];
		$interval=" nodes.node_created>NOW()-INTERVAL 42 DAY and";
	}

	$node_id=$node['node_id'];
	$user_id=$_SESSION['user_id'];
		$q="select parent.node_name as parent_name,users.*,nodes.* from nodes
		left join nodes as parent on parent.node_id=nodes.node_parent
		left  join users on users.user_id=nodes.node_creator where $interval
		nodes.node_vector like '$vector%'  and
		nodes.node_system_access!='private' order by nodes.node_id desc LIMIT $offset,$listing_amount ";

	$set=$db->query($q);

	while ($set->next()) {
		$last[]=$set->getRecord();
	}

	return $last;

}


// Get nodes sorted by weight_k specific to user

public static function getKNeurons($user_id,$interval) {
	global $db,$node,$error,$error_messages;

	$q="call k_neurons('$user_id','$interval')";
	$set=$db->query($q);

	while ($set->next()) {
		$k_array[]=$set->getRecord();
	}

	return $k_array;
}

// setSynapse

// Set synapse weight. 
// If synapse does not exists, create a new one.
// Secure.
// Returns true on sucess, otherwise false.

public static function setSynapse($params){
	global $db,$node,$error,$error_messages;

	// security check
	if ((!is_numeric($params['src'])) 
		or (!is_numeric($params['dst']))
		or (!is_numeric($params['weight']))) {

		return false;
	}

	$src=$params['src'];
	$dst=$params['dst'];
	$weight=$params['weight'];

	// weight could be only positive
	if ( $weight < 0) {
		return false;
	}

	// if already exists
	$q="select count(src) from neurons where dst ='$dst' and src = '$src'";
	$set=$db->query($q);
	$set->next();
	$isrc=$set->getString('count(src)');

	if ( $isrc > 0 ) {
		$q="update neurons set synapse_weight='$weight' 
			where dst = '$dst' and src = '$src'";
	} else { 
		// FIXME no vector set
		$q="insert into neurons values('$weight','$dst','$src',0,'synapse',
						CURRENT_TIMESTAMP(),now(),NULL,$src)";
	}
	$set=$db->query($q);

	return true;
}

// getSynapseWeight

// If synapse does not exists, weight is 1
// Secure.
// Returns synapse weight (from user to node)

public static function getSynapseWeight($user_id,$node_id){
	global $db;

	if (!is_numeric($user_id)) 
		{ return -1; }
	if (!is_numeric($node_id)) 
		{ return -1; }

	$set=$db->query("select synapse_weight from neurons where src =".
		$user_id." and dst = ".$node_id." and link='synapse'");

	$set->next();
	$synapse_weight=$set->getString('synapse_weight');

	if (! ($synapse_weight) ) { $synapse_weight = 1;}	

	return $synapse_weight;
}

// getNodeUserlist

// Get list of users currently viewing specified node.
// Secure.
// Returns list of (login, user_id)

public static function getNodeUserlist($node_id) {

	global $db;
	if (!is_numeric($node_id))
		 { return -1; }
		

	$set=$db->query("select login,user_id from users where user_action_id='$node_id'");
	while ($set->next()) {
		$userlist[]=$set->getRecord();
	}

	return $userlist;
}

// getNodeCommanders

// Get logins of all node commanders (used in configure)
// Secure.
// Returns list of (node_permission, login)

public static function getNodeCommanders($node_id) {
	global $db;

	if (!is_numeric($node_id))
		 { return -1; }

	$set=$db->query("select node_permission,users.login from node_access 
			left join users on node_access.user_id=users.user_id where 
			node_id='$node_id' and node_permission!='' order by node_permission");

	while ($set->next()) {
 		$commanders[$set->getString('node_permission')].=$set->getString('login').";";
	}

	return $commanders;
}

// logout

// Log out user.
// Secure

public static function logout() {
        global $db;
        $q="update users set user_action_id=null where user_id='".$_SESSION['user_id']."'";
        $db->query($q);
}

// getNodesByType

//
// Secure
// returns xxx
 
public static function getNodesByType($vector,$user_id,$type,$orderby,$offset,$listing_amount) {
	global $db;

	if ((!is_numeric($user_id))
		or (!is_numeric($offset))
		or (!is_numeric($listing_amount))
		or ($vector && !is_numeric($vector))
		or (!is_numeric($type)))
		{ return -1; }

	$orderby=db_escape_string($orderby);


	$q="select parent.node_name as parent_name,users.*,nodes.*,node_access.node_user_subchild_count from nodes 
		left join nodes as parent on parent.node_id=nodes.node_parent 
		left join node_access on node_access.node_id=nodes.node_id and node_access.user_id='$user_id'
		left  join users on users.user_id=nodes.node_creator where ";
	if ($vector) $q.="nodes.node_vector like '$vector%' and";
	$q.=" nodes.template_id='$type' and nodes.node_system_access!='private'";
	if ($orderby) $q.=" order by $orderby ";
	else $q.=" order by nodes.node_id desc ";
	$q.= " LIMIT $offset,$listing_amount ";
	$set=$db->query($q);

	while ($set->next()) $result[]=$set->getRecord();

	return $result;
}

// getLinkedNodes

// 
// returns XXX

function getLinkedNodes($node_id,$orderby,$offset,$listing_amount) {
	global $db;

	if ((!is_numeric($node_id))
		or (!is_numeric($offset))
		or (!is_numeric($listing_amount)))
		{ return -1; } // XXX check return value by caller?
	$orderby=db_escape_string($orderby);

	$q="select neurons.synapse_created,node_content,author.login,linker.login as linker,nodes.* from neurons 
		left join nodes on neurons.src=nodes.node_id 
		left join users as linker on neurons.synapse_creator=linker.user_id 
		left join users as author on nodes.node_creator=author.user_id  
		where dst='$node_id' and link in ('hard','bookmark') 
		order by $orderby desc limit $offset , $listing_amount";

	$result=$db->query($q);
	while ($result->next()) {
		$array=$result->getRecord();
		transport_process_node($array); // XXX
		$array['node_status']="linked";
		$array['node_created']=$array['synapse_created'];
		$get_linked_nodes[]=$array;
	}
	return $get_linked_nodes;
}


}
?>
