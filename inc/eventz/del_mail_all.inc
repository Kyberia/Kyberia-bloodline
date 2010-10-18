<?php
    /* INDEV / DO NOT TOUCH | del_mail_all button functionality in mailbox | maniax */

    function del_mail_all($node_id) {
    global $db, $error;

        if (empty($_POST['del_mail_all_chk']) || $_POST['del_mail_all_chk'] != 'on') {
            $error = 'You must check the checkbox near del_mail_all button, to perform this operation';
            return (false);
        }

        $user_id = $_SESSION['user_id'];
        $m_qs = sprintf('delete from mail where mail_user = %d', $user_id);
        $db->query($m_qs);

        $error = 'All your mail has been deleted.';
        return (true);
    }
?>


