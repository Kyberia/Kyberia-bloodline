<?php
// testing & develop for function send [multimail bugless send capatibility]
        function send2() {
                global $db;
if (empty($_SESSION['user_id']) || empty($_SESSION['user_name'])) {
global $error;
$error=" poradi redtime:-))";
return false;
}

                $user_id=$_SESSION['user_id'];
                $user_name=$_SESSION['user_name'];
                $mail_name=$_POST['mail_to'];
                $mail_name=mysql_escape_string($mail_name);
                $mail_to=explode(";",$mail_name);
                $mail_text=$_POST['mail_text'];
                $nohtml=$_POST['nohtml'];



        if (count($mail_to)==1) {
                $q="select user_id from users where login='$mail_name'";
                        $result=$db->query($q);
                        $result->next();
                        $to=$result->getRecord();
                        if (!$to['user_id']) {
                                       global $error;
                                       $error="Dana osobka ktorej by si chcel poslat spravicku si bud zmenila nick alebo robis preklepy.[dosla mi fantazia pri vymyslani err msg...na picu..]";
                                       return false; }
                        else {$mail_to_id[]=$to['user_id'];}
        }

        elseif (count($mail_to)>1) {
                foreach ($mail_to as $mail_to_exploded) {
                        $q="select user_id from users where login='$mail_to_exploded'";
                                $result=$db->query($q);
                                $result->next();
                                $to=$result->getRecord();
                                if (!$to['user_id']) {
                                       global $error;
                                       $error="Pravdepodobne si osobka $mail_to_exploded zmenila nick alebo mas niekde preklep. Skus to pravit a potom try again:-]";
                                       return false; }
                                else {$mail_to_id[]=$to['user_id'];}
            }
        }


                if (empty($mail_text)) {
                        global $error;
                        $error="Prilis kratka sprava. Syr vesela krava, student prava a ci
dobra trava?";
return false;
                }

                if ($mail_to_id) {

                        $mail_text=nodes::processContent($mail_text);
global $htmlparse;
if ($htmlparse) {
$error=$htmlparse;
return false;
}
foreach ($mail_to_id as $mail_to_id_send) {
                $q="insert into mail set
mail_user='$user_id',mail_read='no',
mail_from='$user_id',mail_text='$mail_text',mail_to='$mail_to_id_send',mail_timestamp=NOW()";
                        $result=$db->query($q);
                $duplicate_id=$db->getLastInsertId();
                       $q="insert into mail set mail_duplicate_id='$duplicate_id',
mail_read='no',mail_user='$mail_to_id_send',mail_from='$user_id',mail_text='$mail_text',
mail_to='$mail_to_id_send',mail_timestamp=NOW()";
                        $result=$db->query($q);
                        $db->query("update users set user_mail=user_mail+1,
user_mail_name='$user_name' where user_id='$mail_to_id_send'");
                }
            return true;

                }

                else {
                        global $error;
                        $error="user $mail_to does not exist";
                        return false;
                }
        }


?>