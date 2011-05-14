<?php
//funkcie na pridanie Re: alebo Re[x]: do nazvu (by Maniax)
function title_reply_callback($_matches) {
	return ($_matches[1].($_matches[2] + 1).$_matches[3]);
}

function title_reply($_in) {
	if (preg_match('/^Re[:\[]/', $_in)) {
		if (preg_match('/^Re\[/', $_in))
			return (preg_replace_callback('/^(Re\[)(\d*)(\].*)$/', 'title_reply_callback', $_in));
		else return (preg_replace('/^(Re)(:.*)$/', '\1[2]\2', $_in));
	} else return ('Re: '.$_in);
}

//Pridanie prispevku
function add() {

    global $db,$error,$node,$permissions,$types;

    $node_content=$_POST['node_content'];
    $node_parent=$_POST['node_parent'];
    $template_id=$_POST['template_id'];
    if (empty($template_id)) $template_id=4;
    $node_type=$template_id;

    if (strlen($node_name)<1){
        //     $error="node_name too short. please write some title";
        //     return false;
    }

    $node_name=addslashes(strip_tags($_POST['node_name']));
    $external_link=addslashes(strip_tags($_POST['external_link']));

    if (!empty($_POST['node_chosen'])) {
        $node_chosen=$_POST['node_chosen'];
        if (count($node_chosen)>1) {
            $error="please select only one node.";
            return false;
        }else {
            $node_parent=addslashes($node_chosen['0']);
            $q="select * from nodes where node_id='".$node_parent."'";
            $p_set = $db->query($q);
            if($p_set->next()){
                $node_parent_name = $p_set->getString('node_name');
                $node_parent_template = $p_set->getString('template_id');
            }
        }
    }else{
        $node_parent_name = $node['node_name'];
        $node_parent_template = $node['template_id'];
    }


    if (empty($node_name)) {
        if (empty($node_parent_name)){
            $node_name=date("d.m.Y-G:i:s");
        }elseif ($node_parent_template == "4"){
            $node_name = title_reply($node_parent_name);
        }else{
            $node_name=date("d.m.Y-G:i:s");
        }
    }

    if (empty($node_name)) {
        $node_name=date("d.m.Y-G:i:s");
    }
    $parent_name=$node['node_name'];
    $node_creator=$_SESSION['user_id'];

    $node_system_access=$node['node_system_access'];


    if (empty($node_system_access)) {
    $node_system_access='public';
    }

    $node_external_access=$_POST['node_external_access'];
    if (empty($node_external_access)) {
    $node_external_access='yes';
    }


    if (empty($node_content)) {
    $error=$error_messages['ADD_NO_CONTENT'];
    return false;
    }

    // prida mood na koniec contentu
    if (is_numeric($_SESSION['mood_id']) && $node['external_link'] != 'db://user' && $node['external_link'] != 'session://user') {
        $node_content .= "\n\n<small>".$_SESSION['mood_content']."</small>";
    }

    $node_content=nodes::processContent($node_content);

    if ($node_system_access=='crypto') {

    require(INCLUDE_DIR.'crypto.inc');

    if ($_SESSION['crypto'][$node_parent]) {
    $key=$_SESSION['crypto'][$node_parent];
    }
    else {
    $key = substr(md5(uniqid(rand(), true)),0,8);
    }

    $node_content=crypto::crypto($node_content,$key);



    }

    $params['node_name']=$node_name;
    $params['template_id']=$template_id;
    $params['node_parent']=$node_parent;
    $params['node_system_access']=$node_system_access;
    $params['node_creator']=$_SESSION['user_id'];
    $params['node_content']=db_escape_string($node_content);
    $params['external_link']=$external_link;
    nodes::addNode($params);
    return true;
}

?>
