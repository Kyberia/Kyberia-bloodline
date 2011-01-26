<?php
if ($_SESSION['debugging']) {
  $_SESSION['debugging']=false;
  echo "debugging turned off; refresh to turn it on";
} else {
  $_SESSION['debugging']=true;
  echo "debugging turned on; refresh to turn it off";
}
?>
