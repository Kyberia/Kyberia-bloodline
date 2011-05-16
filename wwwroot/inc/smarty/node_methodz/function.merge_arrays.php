<?php

	function smarty_function_merge_arrays($params,&$smarty) {

		$array1=$params['array1'];
		$array2=$params['array2'];
		if(!is_array($array1)) $array1=array();
		if(!is_array($array2)) $array2=array();
		$sort_by=$params['sort_by'];
		$orderby=$params['orderby'];
		if ($orderby=='asc') $order=SORT_ASC;
		elseif ($orderby=='desc') $order=SORT_DESC;
		else $order=SORT_DESC;

		$index1=count($array1)-1;
		$array1_last=$array1[$index1]['node_created'];
		$array1_last_time=$array1_last." GMT";

		$index2=count($array2)-1;
		$array2_last=$array2[$index2]['node_created'];
		$array2_last_time=$array2_last." GMT";

		$array2_first=$array2[0]['node_created'];
		$array2_first_time=$array2_first." GMT";

		$array1_first=$array1[0]['node_created'];
		$array1_first_time=$array1_first." GMT";


		$array=array_merge($array1,$array2);

		if ($sort_by=='thread') {
		        $i=0;
	       		 for($i=0; $i<count($array); $i++){
 				if ($order==SORT_DESC) $sortarr[]=count($array[$i]['node_vector']).";".$array[$i]['node_vector'].";".$array[$i]['node_id'].";z";
 				if ($order==SORT_ASC) $sortarr[]=count($array[$i]['node_vector']).";".$array[$i]['node_vector'].";".$array[$i]['node_id'];
	       	 	}
			array_multisort($sortarr,$order,$array);
		}

		else {
		        $i=0;
	       		 for($i=0; $i<count($array); $i++)	{
	        	        $sortarr[]=$array[$i][$sort_by];
	       	 	}
			array_multisort($sortarr,$order,$array);
		}


		$smarty->assign('merged',$array);

	}
?>
