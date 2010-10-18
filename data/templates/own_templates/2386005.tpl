{rand min="10" max="20"}
{math equation="x * 10" x=$rand assign=csl}
<html>
<head>
<title>|</title>
<style>{literal}
.l:hover {visibility:hidden;}
.t1 {display:none}
{/literal}</style>
</head>
<body style='background:white; padding:3% 0 10px 15%'>
{*math equation="x - (((((sqrt(5) + 1)/2)*x) - x) - (x - ((((sqrt(5) + 1)/2)*x) - x)))" x=$hod*}
<div style="width:238px;">
<img src='http://www.xcity.cz/moje/marin/1k.png'><br /><br /><a href='/id/1538/1420506' style='color:black; font-family:monospace; font-size:90%; _font-size:60%; text-decoration:none'>click@kyberia</a><br /><br />
{if $csl neq 0}{section name=lala loop=$csl}<img src='http://www.xcity.cz/moje/marin/li.png' class='l'>{/section}
{else}{section name=lala loop=500}<img src='http://www.xcity.cz/moje/marin/li.png'>{/section}{/if}
</div>
</body></html>