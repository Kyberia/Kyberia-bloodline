<?php

function upload_data_file() {
	// XXX sec. bug over sec. bug

	global $db,$error,$node;

	require(INCLUDE_DIR.'filez.inc');

	if (($node['node_permission']!='owner') && 
	    ($node['node_permission']!='master')) {
		$error=$error_messages['EVENT_PERMISSION_ERROR'];
		return false;
	}

	$node_id=$node['node_id'];
	filez::upload_data_file($node_id);	
/*
	if ($suffix=='zip' && $_POST['unzip']) {
		mkdir(TMP."/".$_FILES['data_file']['name']);

		// directory traversal si dissabled by default from zip v 5.50
		$cmd="unzip ".$_FILES['data_file']['tmp_name']." -d "
			.TMP."/".$_FILES['data_file']['name'];

		shell_exec($cmd);
		$handle=opendir(TMP."/".$_FILES['data_file']['name']);

		// XXX move this mess into a function
		while (($file = readdir($handle))!==false) {
			if ($file!="." && $file!="..") {

				// Need to check extenstions of all extracted files
				if ( !filez::filename_secure($_FILES['data_file']['file'])) {
					$error = 'ale ale, kto nam to tady loupe pernicek.. ';
					return false;
				}

				$node_params['node_name']=$file;
				$node_params['node_creator']=$_SESSION['user_id'];
				$node_params['template_id']=DEF_DATA_TEMPLATE;
				$node_params['node_parent']=$node['node_id'];

				$node_params['node_content']=$file;
				$datanode_id=nodes::addNode($node_params);
				$file_suffix = array_pop(explode('.', basename($file)));
				copy(TMP."/".$_FILES['data_file']['name']."/".$file,
				     FILE_DIR.$_SESSION['user_id'].'/'.$datanode_id.".$file_suffix");
				symlink(FILE_DIR.$_SESSION['user_id'].'/'.$datanode_id.".$file_suffix",
					SYSTEM_ROOT.'/files/'.$datanode_id);

# Removed for now, need complete rewrite

#				if ($_POST['gallery']) {
#					$node_params['template_id']=DEF_GALLERY_TEMPLATE;
#					$image=TMP."/".$_FILES['data_file']['name']."/".$file;
#					$image_name=$file;
#					$width=NODE_IMAGE_WIDTH;
#
#					if (stristr($image_name,".jpg") || 
#					    stristr($image_name,".jpeg") ){
#						
#						/// XXX UTILZ_DIR is not set. remove?
#						$cmd=UTILZ_DIR."/jpegtopnm  $image |".UTILZ_DIR."/pnmscale -width=$width | ".UTILZ_DIR."ppmquant 256 |".UTILZ_DIR."ppmtogif >".SYSTEM_ROOT.SYSTEM_IMAGES.'/nodes/'.substr($datanode_id,0,1)."/".substr($datanode_id,1,1)."/".$datanode_id.".gif";
#					}
#					elseif (stristr($image_name,".gif")) {
#						$cmd=UTILZ_DIR."/gifsicle --resize ".$width."x_ $image > ".SYSTE_ROOT.SYSTEM_IMAGES.'/nodes/'.substr($datanode_id,0,1)."/".substr($datanode_id,1,1)."/".$datanode_id.".gif";
#					}
#					if ($cmd) {
#						shell_exec($cmd);
#					}
#					// XXX WTF
#					echo $cmd;
#				}
			}
		}
		closedir($handle);
		die();
	}

	else {
		copy($_FILES['data_file']['tmp_name'],
			FILE_DIR.$_SESSION['user_id'].'/'.$node['node_id'].".$suffix");
		symlink(FILE_DIR.$_SESSION['user_id'].'/'.$node['node_id'].".$suffix",
			FILE_DIR.'/'.$node['node_id']);
	}
*/
}
?>
