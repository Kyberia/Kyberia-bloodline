<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Cache-Control" content="Public" />
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250" />


<link rel='stylesheet' href='http://local.sk/~binary/binary.css' type='text/css' />
<title>{$node.node_name}|{if $new_mail eq true}{$new_mail} new mail,last from {$new_mail_name}{/if}</title>
</head>
<body>
{if $node.node_name eq 'mail'}
<script type="text/javascript">
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


<script src='/id/1515428' type='text/javascript'></script>



<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<a href='/id/24'>Mail</a> <a href='/id/2363050/'>!M</a> <a href='/id/15'>K</a><a href='/id/1569351'>!K</a> <a href='/id/23'>Last</a> <a href='/id/19'>Books</a><a href='/id/21'>Blogs</a>
<a href='/id/{$user_id}'>Me</a>
<a href='/id/{$user_id}/1961033'>Conf</a>
<a href='/id/{$user_id}/1573668'>Stuff</a>

<a href='/id/27'>Ppl</a>
<a href='/id/1058182'>Forumz</a>
<a href='/id/25'>Srch</a>
<a href='/id/1496001'>Main</a>

<a href='/id/101/'>Kyberia</a>
<input type='submit' value='logout' name='event' tabindex='23'/>
</form>
</div>
<div class="t2"></div>
<div class="t3">
{if $new_mail eq true}
<a href='/id/24'><b>{$new_mail} new | {$new_mail_name}</b></a>
{/if}

{if $error eq true}
<span class='most_important'>{$error}</span>
{/if}
</div>
</body>
</html>
