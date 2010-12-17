<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

{if $node.node_id eq 24}
    <!-- IN MAIL SCRIPT -->
    <script language="JavaScript" type="text/javascript" src="/data/templates/own_templates/1502254.tpl"></script>
{/if}

<!-- MENU -->
<script language="JavaScript" type="text/javascript" src="/data/templates/own_templates/1378272.tpl"></script>

<!-- PANEL JS -->
<script language="JavaScript" type="text/javascript" src="/data/templates/own_templates/1515428.tpl"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/data/templates/own_templates/1207802.tpl" media="screen">
<!--<link rel="stylesheet" type="text/css" href="/data/templates/own_templates/973161.tpl" media="handheld">-->

<!-- TITLE -->
<title>
    {if $new_mail eq true}
        {$new_mail}@ [{$new_mail_name}]~
    {/if}
    {include file="791948.tpl"}
</title>

</head>
<body>
<div class="t1">
    <form action="/id/{$user_id}/" method="post">
        <a href="/id/1/">main</a> |
        <a href="/id/101/">kyb</a> |
        <a href="/id/102/">hyst</a> |
        <a href="/id/1478235/">book</a> |
        <a href="/id/24/">{if $new_mail eq true}<i>{/if}mail{if $new_mail eq true}</i>{/if}</a> |
        <a href="/id/23/">last</a> |
        <a href="/id/15/">k!</a> |
        <!--<a href="/id/1670413/">K!</a>-->
        <!--<a href="/id/27">people</a> -->
        <a href="/id/1502464">pipl</a> |
        <a href="/id/21/">blogz</a> |
        <a href="/id/1058182/">forumz</a> |
        <a href="/chat/chat.htm" target="_blank">chat</a> |
        <a href="/id/25/">search</a> |
        <a href="/id/{$user_id}/">me</a>
        [<a href="/id/{$user_id}/1961033">cfg</a>]
        <input type="submit" value="pakes">
        <input type="hidden" name="event" value="logout">
    </form>
</div>
<div class="t2"></div>

<!-- MAIL & ERROR -->
{if $new_mail eq true}
    <div class="most_important"><center>
        <a href="/id/24" class="mail"><b>u have {$new_mail} new mail last from {$new_mail_name2}</b></a>
    </center></div>
{/if}
{if $error eq true}
    <div class="most_important"><center>{$error}</center></div>
{/if}
<div id="main_menu">
    <input type="button" onclick="this.value=ShowHide_Menu()" value="hide" class="onoff">
    <div id="menu" class="menu_on">
        <div class="line">
            <a href="/id/1141959/" title="personal datanode">frz's</a> |
            <a href="/id/1478222" title="templates">tpl</a> |
            <a href="/id/1487381" title="recycle bin">r-bin</a>
        </div>
        <div class="line">
            <a href="/id/1548898" title="modules">mdl</a>
        </div>
        <div class="line">
            <a href="/id/{$node.node_id}/2" title="nodeshell view">2</a> |
            <a href="/id/{$node.node_id}/3" title="forum view">3</a> |
            <a href="/id/{$node.node_id}/14" title="template view">14</a> |
            <a href="/id/{$node.node_id}/{$node.node_id}" title="selftemplate view">nd</a>
        </div>
        {if $node.node_creator eq $user_id or $node.node_permission eq "master" or $node.node_permission eq "op"}
            <div class="line">
                <a href="/id/{$node.node_id}/1961033">configure</a>
            </div>
        {/if}
        <input type="button" onclick="this.value=ShowHide_Devmenu()" value="dev | show" class="onoff">
        <form method="post" action="/id/{$node.node_id}" id="devmenu" class="menu_off">
            <input type="submit" name="event" value="debugging"><br />
            <input type="submit" name="event" value="addTemplate"><br />
            <input type="submit" name="event" value="addEvent"><br />
            <input type="submit" name="event" value="addPlugin"><br />
            <input type="submit" name="event" value="addAjax">
            <input type="hidden" name="add_template_id" value="{$node.node_id}">
            <input type="hidden" name="add_event_id" value="{$node.node_id}">
            <input type="hidden" name="add_plugin_id" value="{$node.node_id}">
            <input type="hidden" name="add_ajax_id" value="{$node.node_id}">
        </form>
    </div>
</div>

<div id="panel" onmouseout="hideSubmenu();" onmouseover="km();"></div>
<script language="JavaScript" type="text/javascript">p = document.getElementById('panel');</script>

<div id="body">