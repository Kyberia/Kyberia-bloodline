<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<!-- TITLE -->
<title>
    {if $new_mail eq true}
        {$new_mail}.m@il.from.{$new_mail_name}..
    {/if}
    {include file="791948.tpl"}
</title>

{if $node.node_name eq 'mail'}
<!-- IN MAIL SCRIPT -->
    <script>
        function vymena() {ldelim}
            document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
            document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
        {rdelim}

        function chngto(name,id) {ldelim}
            document.formular.mail_to.value = name ;
            name = name.toLowerCase() ;
            document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
        {rdelim}
    </script>
{/if}

<!-- CSS -->
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/1499805.tpl'>

<!-- PANEL JS -->
<script src='/data/templates/own_templates/1515428.tpl' type='text/javascript'></script>

</head>

<body>
<!-- HEADER -->
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<a href='/id/1/'>main</a> ::
<a href='/id/101/'>kyb</a> ::
<a href='/id/19/'>bookmarks</a> ::
{if $new_mail eq true}
<a href='/id/24/'><i><b>mail</b></i></a> ::
{else}
<a href='/id/24/'>mail</a> ::
{/if}
<a href='http://kyberia.sk/id/23/'>last</a> ::
<a href='/id/2024123/'>k!</a> ::
<a href='/id/27'>people</a> ::
<a href='/id/21/'>blogs</a>::
<!-- <a href='/id/29'>news</a> -->
<a href='/id/25/'>search</a> ::
<a href='/id/2063096/'>a ttack</a> ::
<a href='/id/{$user_id}/'>me</a> ::
<a href='/id/{$user_id}/1961033'>conf</a> :::
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</div>
<div class="t2"></div>

<!-- PANEL -->
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div>
<script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>

{if $new_mail eq true}
<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail, last from {$new_mail_name}</a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}