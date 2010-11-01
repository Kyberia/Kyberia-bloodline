<?php
class filez {

//XXX function not used, remove?

public static function files($id) {
	global $db,$error;
	if (!is_dir(FILE_DIR.$_SESSION['user_id'])) {
		mkdir(FILE_DIR.$_SESSION['user_id']);
	}
	copy($_FILES['data_file']['tmp_name'],FILE_DIR.$_SESSION['user_id'].'/'.$_FILES['data_file']['name']);
	return $_SESSION['user_id'].'/'.$_FILES['data_file']['name'];
}

// Function that check if given filename is "secure" (for uploading)
// Dont use for reading files, directory traversal is not checked

public static function filename_secure(name){
	$suffix = array_pop(explode('.', basename($name)));
	
	// This is unfornately blacklist
	// TODO extend for all possible server configuations
	// TODO: why js?
	$preg_disallowed = '/([a-z]*)(php|htm|inc|js|vbs|cgi|asp|jsp|htaccess)([a-z]*)$/i';
	if (preg_match($preg_disallowed, $suffix) > 0) {
		return false;
	}
	return true;
}

}

/*
*  Returns disk usage in bytes of directory $d. Limit depth level with $depth.
*  Updates, documentation and examples: http://daniel.lorch.cc/projects/disk_usage/
*
*  Revision: 1.00
*/

function disk_usage($d, $depth = NULL) {
  if(is_file($d))
    return filesize($d);

  if(isset($depth) && $depth < 0)
    return 0;

  if($d[strlen($d)-1] != '\\' || $d[strlen($d)-1] != '/')
    $d .= '/';

  $dh=@opendir($d);
  if(!$dh)
    return 0;

  while($e = readdir($dh))
    if($e != '.' && $e != '..')
      $usage += disk_usage($d.$e, isset($depth) ? $depth - 1 : NULL);

  closedir($dh);

  return $usage;
}


?>
