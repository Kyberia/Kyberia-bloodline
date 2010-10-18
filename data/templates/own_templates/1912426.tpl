<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' type='text/css' href='/id/1912336/download'>
<title> {$node.node_name}</title>
{if $node.node_name eq 'mail'}
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
<!-- here you can realize yourself -->
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<a href='/id/101/'>kyberia</a> ~~~
<a href='/id/19'>elskanligr</a> ~~~
<a href='/id/24'>póstur</a> ~~~
<a href='/id/23'>nýligr</a> ~~~
<a href='/id/15'>k</a> ~~~
<a href='/id/1963616'>gle&#240;i stundir</a> ~~~
<a href='/id/21'>dagligr</a> ~~~
<a href='/id/25'>leita</a> ~~~
<a href='/id/{$user_id}/1961033'>stillingar</a> ~~~
<a href='/id/2046482'>rusl</a>
</form>
</div>
<div class="t2"></div>
{if $new_mail eq true}
<center><a href='/id/24'><b>&#254;ú hafí&#240; nýjan póst*</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}




