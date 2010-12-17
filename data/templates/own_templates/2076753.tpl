<html>
<head>
<title>What is the matrix ?</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<script>
var invisible = new Array();
function setBackground(url,nc) {ldelim}
    document.body.style.backgroundImage = 'url('+url+')';
    document.body.style.backgroundRepeat = 'repeat';
document.Title=nc;

for (var i = 0;i<invisible.length;i++)
{ldelim}
  lmnt=document.getElementById('d'+invisible[i]);
  lmnt.innerHTML = "<img src='"+url+"'>";
{rdelim}

{rdelim}
//-->
</script>
<style type="text/css">
body {ldelim} background-repeat: repeat; {rdelim}
img {ldelim} width: 60px; height: 60px;{rdelim}
</style>
<link rel='stylesheet' title="kyberia" type='text/css' href='/data/css/kyberia.css'>
</head>
<body>
<br/>
{if $user_id eq true}
<div style='position: absolute; left:55px; right: 55px;'>
<h1>LOGOUT TO SEE IT PROPERLY
&& CLICK ON DA IMAGEZ<br/> </h1>
{include file="1549925.tpl"}
</div>
{/if}
{get_matrix_from_tree dimensions=2 d1=node_name d2=node_name}
<table align='center' valign='center' style='margin: 0px auto;'>
{foreach from=$get_matrix_from_tree item=rowset}
<tr>
{foreach from=$rowset item=item}
{if $item.node_name neq $item.node_content}
<td><img onMouseOver="status='{$item.node_content}';return true;" onClick='setBackground("http://kyberia.sk{get_image_link id=$item.node_id}","{$item.node_content}");' src='{get_image_link id=$item.node_id}' alt='{$item.node_content}' title='{$item.node_content}'></td>
{else}
<td align='center'>
<script>invisible.push({$item.node_id});</script>
<div id='d{$item.node_id}'><div style='border: 1px dashed; margin: 6;'>U'R FREE<br/>TO DO<br/>WHATEVER<br/>YOU WANT<br/>TO DO</br></div></div></td>
{/if}
{/foreach}
</tr>
{/foreach}
</body>
</html>