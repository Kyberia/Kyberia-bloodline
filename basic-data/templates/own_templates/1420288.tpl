<html>
<head>
	<meta http-equiv="Default-Style" content="kyberia">
	<meta http-equiv="Cache-Control" content="Public">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
	<link rel="stylesheet" title="kyberia" type="text/css" href="http://www.hladat.sk/xyzz/data/style.css">
	<title>{$node.node_name|strip_tags}</title>
	<script type="text/javascript" src="http://www.hladat.sk/xyzz/data/script.js"></script>
</head>
<body>
<form enctype="multipart/form-data" action='/id/2240/' method='post'>
	<ul id="menu">
		<li><a href='/id/1/'>main</a> | <a href='/id/102/'>H</a>-<a href='/id/101/'>K</a> | <a href='/id/1141046'>search</a></li>
		<li><a href='/id/1451158'>bookmarks</a></li>
		<li><!--<a href='/id/1453990'>--><a href='/id/24'>
	{if $new_mail eq true}
		<strong>{$new_mail} ({$new_mail_name})</strong>
	{else}
		posta
	{/if}</a></li>
		<li><a href='/id/23'>posledne</a></li>
		<li><!--<a href='/id/1451091'>--><a href="/id/15">k</a>/<a href="/id/788016">K</a></li>
		<li><a href='/id/27'>ludia</a></li>
		<li><a href='/id/21'>denniky</a></li>
		<li><a href='/id/1058182'>forumz</a></li>
		<li><a href='/id/{$user_id}/1961033'>nastavenie</a> | <a href='/id/{$user_id}/'>profile</a> | <a href='/id/1635488/forum'>tmp</a></li>
		<li><a href='/id/{$node.node_id}/1961033'>E </a>|<a href='/id/{$node.node_id}/forum'> F </a>|<a href='/id/{$node.node_id}/stats'> S</a></li>
		<li><input type='submit' value='logout' name='event' tabindex='23'></li>
	</ul>
</form>

