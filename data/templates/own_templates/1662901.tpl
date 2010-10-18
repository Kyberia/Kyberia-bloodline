<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

{if $node.node_id == 2072298}
<meta http-equiv="refresh" content="60">
{/if}

<link rel='stylesheet' type='text/css' href='http://www.mic.jablonka.org/kyberia/css/kyberia.css'>
<title>{$node.node_name|strip_tags}</title>
{if $node.node_id == 1685121}
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

</head>

<body>
<br><br>
<div id="header">
<center>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
<a href='/id/1663286/'>branch</a> &#9472;&#9472;
<a href='/id/1/'>main</a> &#9472;&#9472;
<a href='/id/101/'>kyberia</a> &#9472;&#9472;
<a href='/id/2515678'>bookmarks</a>.<a href='/id/2072298/'>fresh</a> &#9472;&#9472;
<a href='/id/24'>posta {if $new_mail eq true}
<span style="font-size:7pt;">(<b><span style="font-size:8pt;color:red;">{$new_mail},{$new_mail_name}</span></b>)</span>
{else}
<span style="font-size:7pt;">(0)</span>
{/if}</a>
 &#9472;&#9472;
<a href='/id/23'>posledne</a> &#9472;&#9472;
<a href='/id/15'>kar!</a>.<a href="/id/1569351">ma!</a> &#9472;&#9472;
<a href='/id/27'>ludia</a> &#9472;&#9472;
<a href='/id/21'>denniky</a> &#9472;&#9472;
<a href='/id/2537174'>datanodes</a> &#9472;&#9472;
<a href='/id/1664658'>search</a> &#9472;&#9472;
<a href='/id/1017832'>help</a> &#9472;&#9472;
<a href='/id/{$user_id}/1961033'>conf</a> &#9472;&#9472;
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</center>
</div>


{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}

<!-- Take me UP! -->
<div id="up">
{$node.node_type}<a href="#">take me UP!</a><br />
<form enctype="multipart/form-data" action='/id/{$node.node_id}/'method='post' name='formular'>
<input type='submit' name='get_children_move' value='<<'>
<input type='submit' name='get_children_move' value='<'>
<input type='submit' name='get_children_move' value='>'>
<input type='submit' name='get_children_move' value='>>'><br /><a href="/id/2072867">recycler:</a><br />
<input type='hidden' name='new_parent' value='2072867'>
<input type='submit' name='event' value='set_parent'><br />
</div>