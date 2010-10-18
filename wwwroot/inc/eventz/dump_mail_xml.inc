<?php
    /* INDEV / DO NOT TOUCH | dump_mail_xml button functionality in mailbox | maniax */

    if (!defined('M_ENDL')) define('M_ENDL', chr(10));

    function dmx_gen_entry($m_rec) {
        printf('  <mail id="%d">'.M_ENDL, $m_rec['mail_id']);
        printf('    <datetime>%s</datetime>'.M_ENDL, $m_rec['mail_timestamp']);
        printf('    <from id="%d"><![CDATA[%s]]></from>'.M_ENDL, $m_rec['mail_from'], htmlspecialchars($m_rec['mail_from_login']));
        printf('    <to id="%d"><![CDATA[%s]]></to>'.M_ENDL, $m_rec['mail_to'], htmlspecialchars($m_rec['mail_to_login']));
        echo   '    <text><![CDATA['.M_ENDL;
        printf('      %s'.M_ENDL, $m_rec['mail_text']);
        echo   '    ]]></text>'.M_ENDL;
        printf('  </mail>'.M_ENDL);
    }

    function dump_mail_xml($node_id) {
    global $node, $db, $error;

        $user_id = $_SESSION['user_id'];

        $gm_qs = sprintf('select mail.*, users_from.login as mail_from_login, users_to.login as mail_to_login from mail
                          join users as users_from on users_from.user_id = mail.mail_from
                          join users as users_to   on users_to.user_id   = mail.mail_to
                          where mail_user = %d order by mail_id asc', $user_id);

        $m_set = $db->query($gm_qs);

        if (!empty($_POST['FORCE_OB']) && $_POST['FORCE_OB'] == 'true') ob_clean();

        Header('Content-type:application/octet-stream');
        Header(sprintf('Content-disposition:attachment;filename=maildump-%d.xml', $user_id));

        echo '<?xml version="1.0"?>'.M_ENDL;
        printf('<!-- XML mail dump for user id %s, generated @ %s -->'.M_ENDL, $user_id, date('d-m-Y, H:i:s'));
        printf('<maillist owner="%d">'.M_ENDL, $user_id);
        while ($m_set->next())
            dmx_gen_entry($m_set->getRecord());
        printf('</maillist>'.M_ENDL);

        die();
    }
?>






