<?php
function delete_mail() {
    global $node,$db,$error;
    $user_id = $_SESSION['user_id'];
    foreach ($_POST['message'] as $chosen =>$value) {

	$mail_id = intval($mail_id);
	if ($mail_id == 0)
		continue;

        $set = $db->query("select mail_read,mail_to from mail where mail_id = '$chosen' and mail_from = '$user_id'");
        $set->next();
        if ($set->getString('mail_read') == 'no') {
            $db->query("delete from mail where mail_duplicate_id = '$chosen' and mail_from = '$user_id'");
            $db->update("update users set user_mail = user_mail - 1 where user_id = ". $set->getString('mail_to') ."");
        }
        $db->query("delete from mail where mail_id = '$chosen' and mail_user = '$user_id'");
    }
}
?>
