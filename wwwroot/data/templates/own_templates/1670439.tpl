<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel="shortcut icon" href="/favicon.ico" />
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/2197287.tpl'>
<title>kyberia.sk >> {$node.node_name|strip_tags:false}</title>

<script language="JavaScript" type="text/javascript">
<!-- Begin

{if $node.node_name eq 'mail'}

function vymena() {ldelim}
document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}

function chngto(name,id) {ldelim}
document.formular.mail_to.value = name ;
name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}

{/if}


var formblock;
var forminputs;

function prepare() {ldelim}
formblock= document.getElementById('form_id');
forminputs = formblock.getElementsByTagName('input');
{rdelim}

function select_all(name, value) {ldelim}
for (i = 0; i < forminputs.length; i++) {ldelim}
// regex here to check name attribute
var regex = new RegExp(name, "i");
if (regex.test(forminputs[i].getAttribute('name'))) {ldelim}
if (value == '1') {ldelim}
forminputs[i].checked = true;
{rdelim} else {ldelim}
forminputs[i].checked = false;
{rdelim}
{rdelim}
{rdelim}
{rdelim}

if (window.addEventListener) {ldelim}
window.addEventListener("load", prepare, false);
{rdelim} else if (window.attachEvent) {ldelim}
window.attachEvent("onload", prepare)
{rdelim} else if (document.getElementById) {ldelim}
window.onload = prepare;
{rdelim}


//  End -->
</script>
</head>

<body>
<!--<meta http-equiv="Cache-Control" content="Public">-->
<div style='position: fixed; background-color: black; width:100%; z-index: 5;height: 20px;vertical-align: middle'>
<center>
<!--<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>-->
<form action='/id/{$node.node_id}' method='post'>
<a href='/id/1/'>main</a> ||
<a href='/id/101/'>kyberia</a> ||
<a href='/id/102/'>hysteria</a> ||
<a href='/id/1671023'>bookmarks</a> ||
<a href='/id/1679905'{if $new_mail eq true} style='color: red;text-decoration:blink'{/if}>mail{if $new_mail eq true}({$new_mail}){/if}</a> ||
<a href='/id/23'>last</a> ||
<a href='/id/1680840'>k</a> ||
<a href='/id/1058182'>forums</a> ||
<a href='/id/27'>people</a> ||
<!-- <a href='/id/20'>clanky</a> ---- -->
<a href='/id/21'>blogs</a> ||
<a href='/id/29'>forums</a> ||
<a href='/id/25'>search</a> ||
<!--<a href='/id/1017832'>help</a> || tabindex='23' -->
<a href='/id/{$user_id}/1961033'>settings</a> ||

<input type='submit' value='logout' name='event'>
</form>
</center>
</div>

<div style='width:100%;height: 20px'></div>
{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}