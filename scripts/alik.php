<?php
define('ALIK_DIR',"/storage/system/www-kyberia/data/alik/www.alik.cz/scripts/sample_icons/");
define('NEW_DIR',"/storage/system/www-kyberia/data/alik/icons/");

$handle=opendir(ALIK_DIR);
echo "Directory handle: $handle\n";
echo "Files:\n";
$i=10;
while (($file = readdir($handle))!==false) {
   echo "copying $file as $i.gif \n";
   $i++;
   if ($i==100) $i=10;
   copy(ALIK_DIR.$file,NEW_DIR.$i.".gif");
}
closedir($handle);
?>