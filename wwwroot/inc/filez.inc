<?php

class filez {

// Function that check if given filename is "secure" (for uploading)
// Dont use for reading files, directory traversal is not checked

public static function upload_filename_secure($name){
	$suffix = array_pop(explode('.', basename($name)));
	
	// This is unfornately blacklist
	// TODO extend for all possible server configuations
	// TODO: why js?
	$preg_disallowed = '/([a-z]*)(php|htm|inc|js|vbs|cgi|asp|jsp|htaccess|htpasswd|asmx)([a-z]*)$/i';
	if (preg_match($preg_disallowed, $suffix) > 0) {
		return false;
	}
	return true;
}

public static function upload_data_file($node_id) {
	if ( !filez::upload_filename_secure($_FILES['data_file']['name'])) {
		$error = 'bad, naughty file type. Cruise missile launched.';
		return false;
	}
	if (!is_dir(FILE_DIR.$_SESSION['user_id'])) {
		 mkdir(FILE_DIR.$_SESSION['user_id']);
	}
	$suffix = array_pop(explode('.', basename($_FILES['data_file']['name'])));
	copy($_FILES['data_file']['tmp_name'], FILE_DIR.$_SESSION['user_id'].'/'.$node_id.".$suffix");
	symlink(FILE_DIR.$_SESSION['user_id'].'/'.$node_id.".$suffix",FILE_DIR.'/'.$node_id);

}

}
?>
