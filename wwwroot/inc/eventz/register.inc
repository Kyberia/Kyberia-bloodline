<?php
function register() {
    global $error;
    $error = 'Rozhodne nechceme, aby se nasim clenem stal uzivatel '.$_POST['reg_login'].' pouzivajici email '.$_POST['reg_email'].
		' a vyzadujici heslo '.$_POST['reg_pass'].' jenom protoze rika <pre>'."\n".$_POST['reg_content']."\n</pre>;-)";
    return false;
}
?>
