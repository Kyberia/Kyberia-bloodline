<?php

class permissions {

//trillion lights to Hierarchy!
//$node input parameter can be a numeric node_id of a node-to-be-checked or a hash containing node_id,node_vector
public static function checkPerms($node) {
    // new permissions checking
    global $db;
	
	if (is_array($node)) {
		$node_id=$node['node_id'];
		$node_vector=$node['node_vector'];
	}

	elseif (is_numeric($node)) {
		$node_id=$node;
	}

	if (empty($node_vector)) {
		$set=$db->query("select node_vector from  nodes where node_id='$node_id'");
		$set->next();
		$node_vector=$set->getString('node_vector');
	}
	
	$user_id=(empty($_SESSION['user_id'])) ? "" : $_SESSION['user_id'];

    $perms['r'] = 0;
    $perms['w'] = 0;
    $perms['node_permission']      = '';
    $perms['node_system_access']   = '';
    $perms['node_external_access'] = '';

    if (!is_numeric($node_id))
        return $perms;

    $nv_arr = str_split($node_vector, VECTOR_CHARS);
    $nv_arr = array_map('intval', $nv_arr);
    $node_list = implode(', ', $nv_arr);
	$node_list.=",$node_id";

    $q_np = sprintf('select n.node_id, n.node_creator, length(n.node_vector) as nv_length
                          , n.node_system_access, n.node_external_access, na.node_permission
                     from nodes n
                     left join node_access na on na.node_id = n.node_id
                                             and na.user_id = %d
                     where n.node_id in(%s)
                     order by nv_length desc', $user_id, $node_list);

    $qr_np = $db->query($q_np);

    while ($qr_np->next()) {
        // nastavim si prava hlavnej zvolenej nody
        if ($perms['node_permission'] == '' && $perms['node_system_access'] == '') {

            $perms['node_permission']      = $qr_np->getString('node_permission');
            $perms['node_system_access']   = $qr_np->getString('node_system_access');
            $perms['node_external_access'] = $qr_np->getString('node_external_access');

            // r/w prava podla system accessu
            if ($perms['node_system_access'] == 'public') {
                $perms['r'] = 1;
                $perms['w'] = 1;
            }
            elseif ($perms['node_system_access'] == 'moderated') {
                $perms['r'] = 1;
                $perms['w'] = 0;
            }
            elseif ($perms['node_system_access'] == 'private') {
                $perms['r'] = 0;
                $perms['w'] = 0;
            }

            if ($qr_np->getInt('node_creator') == $user_id) {
                $perms['node_permission'] = 'owner';
                $perms['r'] = 1;
                $perms['w'] = 1;
                break;
            }

            if ($perms['node_system_access'] != 'private'
                && !$_SESSION['user_id']
                && $perms['node_external_access'] == 'yes') {
                    $perms['r'] = 1;
                    $perms['w'] = 0;
                    break;
            }

        } // if ($perms['node_permission'] == '' && $perms['node_system_access'] == '')
        else {
            // ked som v public alebo moderated fore a dalsie nadradene su uz privatne
            if ($node_system_access != 'private' && $qr_np->getString('node_system_access') == 'private')
                break;
            // ked som v privatnom fore a dalsie nadradene su public alebo moderated
            if ($node_system_access == 'private' && $qr_np->getString('node_system_access') != 'private')
                break;
        }

        $node_permission    = $qr_np->getString('node_permission');
        $node_system_access = $qr_np->getString('node_system_access');

        // nastavim r/w podla permissions a skoncim to
        if ($node_permission == 'ban') {
            $perms['r'] = 0;
            $perms['w'] = 0;
            break;
        }
        elseif ($node_permission == 'silence') {
            $perms['r'] = 1;
            $perms['w'] = 0;
            break;
        }
        elseif ($node_permission == 'op') {
            $perms['r'] = 1;
            $perms['w'] = 1;
            break;
        }
        elseif ($node_permission == 'master') {
            $perms['r'] = 1;
            $perms['w'] = 1;
            break;
        }
        elseif ($node_permission == 'access') {
            $perms['r'] = 1;
            $perms['w'] = 1;
            break;
        }

        if ($qr_np->getString('node_creator') == $user_id) {
            $perms['node_permission'] = 'owner';
            $perms['r'] = 1;
            $perms['w'] = 1;
            break;
        }

    }
    return $perms;
  }

}

?>
