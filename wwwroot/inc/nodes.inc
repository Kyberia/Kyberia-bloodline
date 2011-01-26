<?php
require_once(INCLUDE_DIR.'base36.inc');

   if (!function_exists('str_split')){
     function str_split($string, $split_length=1){

         if ($split_length < 1){
           return false;
         }

         for ($pos=0, $chunks = array(); $pos < strlen($string); $pos+=$split_length){
           $chunks[] = substr($string, $pos, $split_length);
         }
         return $chunks;
     }
   }



function processContent_hack($node_content) {
        global $node;
        include_once(INCLUDE_DIR.'htmlparse.inc');

        if ($node['template_id']==$node['node_id'] && $_POST['event']=='configure_content') {

        }

        elseif ($_POST['no_html']) {
                $node_content=htmlspecialchars($node_content);
        }

        elseif ($_POST['wiki']) {
                // load the class file
                require_once 'Text/Wiki.php';

                // instantiate a Text_Wiki object with the default rule set
                $wiki = new Text_Wiki();

                $node_content = $wiki->transform($node_content, 'Xhtml');
        }

        elseif ($_POST['code']) {}

        else {
                global $db,$htmlparse,$error;

                if (!htmlparser::htmlparse($node_content)) {
                        $error=$htmlparse;
                        return false;
                }

                $node_content = eregi_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank' href=\"\\6\\7\">\\6\\7</a>",$node_content);
		//$node_content = mysql_real_escape_string($node_content); once is enough
        }

        return $node_content;
}


require_once(BACKEND_DIR.'/'.DB_TYPE.'/backend.inc');

