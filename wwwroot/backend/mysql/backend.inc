<?php
class nodes {
// All mysql code should go here
// Split into multiple files if needed

function processContent($node_content) { return processContent_hack($node_content); } //XXX TODO FIXME HACK

// Called for every node view. Updates node views, neurons, 
function update_nodes($user_id,$node_id,$referer_id) {
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


function putNode($what,$where,$checkpermissions=true) {
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

function addNode($params) {
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

static function getNodeIdByName($name, $external_link=false) {
	global $db;

	$qh = sprintf('select node_id from nodes where node_name = "%s"', mysql_real_escape_string($name));
    	if ($external_link)
		$qh .= sprintf(' and external_link="%s"', mysql_real_escape_string($external_link));

	$set = $db->query($qh);
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
		$record[]=addBase36id($result->getRecord());
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
		$array[]=addBase36id($result->getRecord());
	}

	return $array;

}


function getThreadedChildrenNodes($orderby="desc",$offset=0,$limit=DEFAULT_LISTING_AMOUNT) {
	global $db, $error, $node;
	$node_handle=$node['node_id'];

	$q="select length(node_vector) as depth,users.login,nodes.* from nodes left join users on users.user_id=nodes.node_creator where  node_vector like '".$node['node_vector'].";".$node['node_id']."%' and node_type=3 order by concat(node_vector,';',nodes.node_id,';z') desc,depth LIMIT $offset,$limit";

	$result=$db->query($q);

	while ($result->next()) {
		$children_array[]=addBase36id($result->getRecord());
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


// Simple internal function to set node parrent

function setParent($node_id,$parent_id) {
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

// Get nodes sorted by weight_k specific to user

function getKNeurons($user_id,$interval) {
	global $db,$node,$error,$error_messages;

	$q="call k_neurons('$user_id','$interval')";
	$set=$db->query($q);

	while ($set->next()) {
		$k_array[]=$set->getRecord();
	}

	return $k_array;
}

// Set synapse weight,

// XXX TODO

function setSynapseWeight($synapse_weightl) {
	global $db,$node,$error,$error_messages;

	// XXX security fix
//	$q="update neurons set synapse_weight='$synapse_weight' where dst = '$dst' and src = '$src'";
//	$q="insert into neurons values('$synapse_weight','$dst','$src',NULL,'synapse',XXX,now(),XXX,$src)";

//	$set=$db->query($q);

	return true;
}



}
