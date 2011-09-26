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

}
?>
