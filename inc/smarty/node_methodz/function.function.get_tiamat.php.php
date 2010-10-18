<?php

	function smarty_function_get_tiamat($params,&$smarty) {
		global $db, $error, $node;

                if ($params['listing_amount']=='all') $listing_amount='23232323232323323';
                elseif (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
                else $listing_amount=DEFAULT_LISTING_AMOUNT;

                if (is_numeric($params['offset'])) $offset=$params['offset'];
		elseif (is_numeric($_POST['offset'])) $offset=$_POST['offset'];
		else $offset=0;



		if (is_numeric($params['node_id'])) {
			$node_id=$params['node_id'];
			$where=" and node_id = '$node_id'";
		}

		elseif ($params['all']) {}

		elseif ($params['node_vector']) {
			$vector=$node['node_vector'];
			$where=" and node_vector like '$vector%'";
		}

		else {
			$node_id=$node['node_id'];
			$where=" and node_id = '$node_id'";

		}
		$q="select users.login,tiamat.* from tiamat left join users on tiamat.node_destructor=users.user_id where node_system_access!='private'  $where  order by update_performed desc limit $offset , $listing_amount";
		echo $q;
		$result=$db->query($q);
		while ($result->next()) {
			$array=$result->getRecord();
			$get_tiamat[]=$array;


		}
		$smarty->assign('get_tiamat',$get_tiamat);

}

?>