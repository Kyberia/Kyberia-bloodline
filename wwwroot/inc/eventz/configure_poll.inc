<?php

function configure_poll() {
	//poll is special node with serialized option.text and option.number array in node_content

	global $db,$node;
	$user_id=$_SESSION['user_id'];
	if ($node['node_creator']==$user_id || $node['node_permission']=='master') {

              $options=explode(";",$_POST['options']);
	      if (!Is_array($options)) {
			$error="ain't any optionz for da poll h3r3 mista'";
			return false;
	      }
	      foreach ($options as $option) {
		$optionz[]=array("text"=>nodes::processContent($option),"number"=>"0");
		}

	      $optionz=serialize($optionz);

	$params['node_content']=$optionz;
$params['node_name']=$_POST['question'];
$params['template_id']="1549834";
$params['node_creator']=$_SESSION['user_id'];
nodes::addNode($params);
 Header("Location: /id/".$node['node_parent']."/");

	}


}

?>

