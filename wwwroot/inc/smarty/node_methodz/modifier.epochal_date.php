<?php
/*
* Smarty plugin
* -------------------------------------------------------------
* Type: modifier
* Name: epochal_date
* Version: 0.23
* Date: December 12, 2010
* Author: Daniel Hromada
* Purpose: let's consider the beginning of UNIX epoch to be more relevant to our current situation the birth of christ
* Examples: {$smarty.now|epochal_date}
* -------------------------------------------------------------
*/
function smarty_modifier_epochal_date($date) {
   $year=date("Y",$date);
   echo str_replace($year,$year-1970,date("d/m/Y",$date));
   return $date;
}
?>