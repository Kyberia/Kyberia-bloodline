{if $user_id eq true}
    {if $header_id neq true}
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
            <link rel='stylesheet' type='text/css' href='/data/css/main.css'>
            <title>{* title *}{include file="791948.tpl"}</title>
        </head>
        <body>
        {if $user_id eq true}
            {if $header_id neq true}
                {* toolbar *}{include file="1549959.tpl"}
            {/if}
        {/if}
        {if $error eq true}
            <center><span class='most_important'>{$error}</span></center>
        {/if}
        {if $new_mail eq true}
            <center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>
        {/if}
    {/if}
<center>
<table align='center' valign='top' class='bordered' width='865'>
    <tr>
        <td colspan='3' align='center' valign='top'></td>
    </tr>

    <tr>
        <!-- left column -->
        <td align='left' valign='top' width='230'>

            <!-- blogs -->
            <center><span class='important'>user blogs</span></center><Br>
            {get_nodes_by_parent parent=21 listing_amount=23 offset=$offset}
            {foreach from=$get_nodes_by_parent item=child}
                <table width='230'>
                    <tr>
                        <td>
                            <img src='{get_image_link id=$child.node_creator}' align='left' hspace='5' vspace='5' border='0'>
                            <a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:20:"<br>":true|stripslashes}</a><br>
                            {$child.node_content|strip_tags:false|stripslashes|truncate:66:"...":true|wordwrap:20:"<br>":true}<br>
                            by <a href='/id/{$child.node_creator}'>{$child.login}</a> {$child.node_views} views
                        </td>
                    </tr>
                </table>
                <br>
            {/foreach}
            <!-- end of blogs -->

            <br>

            <!-- data nodes -->
            <center><span class='important'>latest data nodes</span></center><br><br>
            {get_nodes_by_type type=12 listing_amount=23 offset=$offset}
            {foreach from=$get_nodes_by_type item=child}
                <div style='margin-bottom: 6px;'>
                <a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:40:"<br>":true}</a><br>
                by <a href='/id/{$child.node_creator}'>{$child.login|wordwrap:40:"<br>":true}</a><br>
                in <a href='/id/{$child.node_parent}'>{$child.parent_name|wordwrap:40:"<br>":true}</a><br>
                </div>
            {/foreach}
            <!-- end of datanodes -->

            {* node_settings *}{include file="1549925.tpl"}
        </td>
        <!-- end of left column -->

        <!-- central column -->
        <td valign='top' width='468'>
            <!-- forums -->
            <center><span align='center' class='important'>latest forums</span></center><br>
            {get_linked_nodes node_id=1058182 listing_amount=23}
            {foreach from=$get_linked_nodes item=child}
                <a href='/id/{$child.node_id}'>{$child.node_name|strip_tags|stripslashes}</a>
                by <a href='/id/{$child.node_creator}'>{$child.login}</a>
                ({$child.node_children_count} children)</a><br>
            {/foreach}
            <!-- end of forums -->

            <br><br>
            <!-- reklama? -->
<center>{* banner editovat na /id/1870248 *}{include file='1870248.tpl'}
<br>Bolo mi ctou.</center>
            <form method='post'>
                <table align='center'><tr>
                    <td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
                    <td><input type='submit' name='get_children_move' value='<'</td>
                    <td><input type='submit' name='get_children_move' value='>'</td>
                </tr></table>
            </form>

            <!-- articles -->
            {get_linked_nodes listing_amount=42}
            <br><center><span class='important' align='center'>latest articles</span></center>
            {foreach from=$get_linked_nodes item=child }
                <table width='100%' class='bordered'><tr>
                    <td>
                        <img width=75 src='{get_image_link id=$child.node_id}' align='left' hspace='5' vspace='5' border='0'>
                        <a href='/id/{$child.node_id}'>{$child.node_name|stripslashes}</a><br>
                        {$child.node_content|strip_tags|truncate:320|stripslashes}<br><br>
                        <i>node created by <a href='/id/{$child.node_creator}'>{$child.login}</a></i>
                    </td>
                </tr></table>
                <br>
            {/foreach}
            <!-- end of articles -->
        </td>
        <!-- end of central column -->

        <!-- right column -->
        <td valign='top' width='165'>
            <center><br><a href='/id/31' title='register'>register</a>
            <br><a href='/id/17/' title='request password'>request password</a>
            <br><br>
            <form action='/id/25/' method='post'>
                <input type='text' value='{$smarty.post.query}' name='query'>
                <input type='submit' name='template_event'  value='search'><br>
            </form><br><br>
            </center>

            {* get_userlist *}{include file="1549848.tpl"}
        </td>
    </tr>
</table>
</center>
{else}
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
            <link rel='stylesheet' type='text/css' href='/data/css/main.css'>
            <title>{* title *}{include file="791948.tpl"}</title>
        </head>
        <body>
            <center>{* loginbox *}{include file="1549885.tpl"}<br>
                <a href="/id/17/">request password</a><br><br>
                <img src='/images/stuff/kyberia-stickerVI.jpg'>
            </center>
{/if}
{* footer *}{include file="1549377.tpl"}