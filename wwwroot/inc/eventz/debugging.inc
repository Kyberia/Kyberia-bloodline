<?php
function debugging() {
if ($_SESSION['debugging']) unset($_SESSION['debugging']);
else $_SESSION['debugging']=true;
}
?>
