<?php
// this is LAMA work..tak plz no commentz:-))
//a bacha kedze tato pica zas odjebava opacne lomitka
function generate_header_template() {
    global $error;
    $user_id=$_SESSION['user_id'];
$error="temporairy out of order. code is being revised";return false;
$name_1=$_POST['1_name'];
$id_1=$_POST['1_id'];
$name_2=$_POST['2_name'];
$id_2=$_POST['2_id'];
$name_3=$_POST['3_name'];
$id_3=$_POST['3_id'];
$name_4=$_POST['4_name'];
$id_4=$_POST['4_id'];
$name_5=$_POST['5_name'];
$id_5=$_POST['5_id'];
$name_6=$_POST['6_name'];
$id_6=$_POST['6_id'];
$name_7=$_POST['7_name'];
$id_7=$_POST['7_id'];
$name_8=$_POST['8_name'];
$id_8=$_POST['8_id'];
$name_9=$_POST['9_name'];
$id_9=$_POST['9_id'];
$name_10=$_POST['10_name'];
$id_10=$_POST['10_id'];
$name_11=$_POST['11_name'];
$id_11=$_POST['11_id'];

$headertemplate="<html>
 <head>
  <META http-equiv='Default-Style' content='kyberia'>
   <meta http-equiv='Cache-Control' content='Public'>
    <meta http-equiv='Content-Type' content='text/html;
charset=windows-1250'>
    <title>{include file='791948.tpl'}</title>
    <script> function vymena() {ldelim} document.formular.mail_to.value =
document.formular.mail_to.value.toLowerCase() ; document.images['fricon'].src =
'/images/users/'+document.formular.mail_to.value+'.gif'; {rdelim} function
chngto(name,id) {ldelim} document.formular.mail_to.value = name ; name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/'
+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif'; {rdelim}
</script>
<script src='/id/1515428' type='text/javascript'></script>
<style type='text/css' media='all'>
            @import '/id/2019722/';
        </style>

   </head>
   <body>
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script
language='JavaScript' type='text/javascript'>p =
document.getElementById('panel');</script>
<div class='t1'>
<form enctype='multipart/form-data' action='/id/{$node.node_id}/{if $action neq
false}{$action}{/if}' method='post'>
<center>
<a href='/id/$id_1'>$name_1</a> ----
<a href='/id/$id_2'>$name_2</a> ----
<a href='/id/$id_3'>$name_3</a> ----
<a href='/id/$id_4'>$name_4</a> ----
<a href='/id/$id_5'>$name_5</a> ----
<a href='/id/$id_6'>$name_6</a> ----
<a href='/id/$id_7'>$name_7</a> ----
<a href='/id/$id_8'>$name_8</a> ----
<a href='/id/$id_9'>$name_9</a> ----
<a href='/id/$id_10'>$name_10</a> ----
<a href='/id/$id_11'>$name_11</a> ----
<a href='/id/25'>search</a> ----
<a href='/id/{$user_id}/1961033'>setup</a> -----
<a href='/id/1017832'>help</a> ----
<input type='submit' value='logout' name='event'
tabindex='23'>
</center>
</form>
</div><div class='t2'></div>
    {if $error eq true}<center><span
class='most_important'>{$error}</span></center>{/if}
    {if $new_mail eq true}
     <center><a href='/id/24/' class='mail'>u have {$new_mail} new
mail,last from {$new_mail_name}</a></center>
    {/if}";


// echo $headertemplate;
$params['node_content']=addslashes($headertemplate);
$params['node_parent']=2153627;
$params['node_name']="Header templata";
$params['node_creator']=$user_id;
$noda=nodes::addNode($params);

$error="Vypada to tak, ze vsetko vypada tak, ze je to OK. ID tvojej header_templaty je $noda";
return false;
}
?>