<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
	<meta http-equiv="content-type" content="text/html; charset=windows-1250" />

<title>@</title>
<style>
a {ldelim}
color: white;
{rdelim}
#magick {ldelim}
width: 316px;
position: absolute;
top: 490px;
right: 267px;
font-color: #6DAE42;
color: #6DAE42;
background: black ;
{rdelim}
#thesis {ldelim}
width: 200px;
border #6DAE42 1px solid;
background: black;
position: absolute;
top: 50px;
left: 630px;
{rdelim}
#rulez {ldelim}
width: 200px;
border #6DAE42 1px solid;
background: black;
position: absolute;
top: 50px;
left: 330px;
{rdelim}
#submissionz {ldelim}
border #6DAE42 1px solid;
width: 200px;
background: black;
position: absolute;
top: 50px;
left: 30px;
{rdelim}
</style>
<script>

var contentz = new Array();
</script>
</head>
</html>
<body style="background: url('/id/2502006/download') no-repeat fixed; color:
#6DAE42; width:1024px; height: 768px;">
<script>var aVectors = new Array();
</script>
{get_threaded_children listing_amount=200 offset=0}
{foreach from=$get_threaded_children item=child}
{if $child.node_id eq "2345205"}<div id="thesis">
{elseif $child.node_id eq 2345183}</div><div id="submissionz">

{elseif $child.node_id eq 2345172}</div><div id="rulez">
{/if}
<div
onLoad="window.resizeTo(1100,810);onClick="location.href='http://kyberia.sk/id/{$child.node_id}';"
onMouseOver="document.getElementById('picture').innerHTML='<img src={get_image_link
id=$child.node_id}>';document.getElementById('magick').innerHTML=contentz[{$child.node_id}];"
id="node{$child.node_id}" style="position: relative; left: {math equation="(x-y)-8" x=$child.depth
y=$node.vector_depth}px;">{$child.node_name|stripslashes}</div>
<script>
contentz[{$child.node_id}]=unescape("{$child.node_content|stripslashes|escape:"javascript"}");
</script>
{/foreach}

</div>
<div id="magick"></div>
<div id="picture" style="position: absolute; top: 490px; left: 230px;"></div>
</body>

</html>