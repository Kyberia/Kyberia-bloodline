<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='/data/templates/own_templates/2070521.tpl'> 
<!-- <link rel='stylesheet' type='text/css' href='/id/2070521'>  -->
<!-- <link rel='stylesheet' type='text/css' MEDIA="screen" href='/id/1080814/download'> 
<LINK REL="stylesheet" TYPE="text/css" MEDIA="handheld" HREF="http://x86.sk/~marin/css/pda.css"> -->

<title> {* title.tpl *}{include file="791948.tpl"} {if $new_mail eq true}|{$new_mail}_{$new_mail_name}{/if}</title>

<script language="JavaScript" type="text/javascript">
<!--
{literal}
	function vymena() {
		document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
		var browser = navigator.appName;
		if(browser == "Microsoft Internet Explorer") {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		else {
			xmlhttp = new XMLHttpRequest();
		}
		get_id_url = 'http://kyberia.sk/ajax/get_username_by_id.php?name=';
		get_id_url += document.formular.mail_to.value;
		xmlhttp.open("GET", get_id_url);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				id = xmlhttp.responseText;
				document.images['fricon'].src = '/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
			}
		}
		xmlhttp.send(null);
	}

	function chngto(name,id) {
		document.formular.mail_to.value = name ;
		name = name.toLowerCase() ;
		document.images['fricon'].src = '/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
	}
	
	function develMnu() 
  {
    document.getEtementById(devel).style.display = "block"; 
  }
	
	
{/literal}
-->
</script>

<!-- USER MENU PANEL JS -->
<script src='/id/1515428' type='text/javascript'></script>

</head>


<body>
<!-- here you can realize yourself -->
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<a href='#top' style='display:block; height:15px; width:40px; color:#333; border:1px solid; float:left;'>top</a><input type='submit' value='logout' name='event' tabindex='23' style='float:right;'>
<a href='/id/1/'>&#1087;&#1086;&#1088;&#1090;&#1072;&#1083;</a>__<a href='/id/1582474/'>0</a><!--|<a href='/id/1370868/'>+</a>-->__<a href='/id/101/'>&#1076;&#1077;&#1088;&#1077;&#1074;&#1086;</a>__<a href='/id/683643'>&#1087;&#1077;&#1088;&#1077;&#1087;&#1083;&#1077;&#1090;&#1085;&#1072;&#1103;</a>__<a href='/id/1392818'>&#1082;&#1072;&#1090;&#1072;&#1083;&#1086;&#1075;</a>__<!-- <a href='/id/404600'>0k</a> --><a href='/id/24'>&#1087;&#1086;&#1095;</a><a href='/id/1953327'>&#1090;&#1072;</a><!-- <a href='/id/23'>LAST</a> | -->__<a href='/id/15'>&#1082;!</a>_<a href='/id/1569351'>&#1082;</a>__<!-- <a href='/id/27'>ludia</a> :: --><!-- <a href='/id/1416619'>on</a> <a href='/id/23'>air</a> :: --><!-- <a href='/id/21'>denniky</a> :: --><!-- <a href='/id/29'>news</a> :: --><a href='/id/25'>&#1080;&#1089;&#1082;á&#1090;&#1100;</a>__<a href='/id/{$user_id}'>&#1084;&#1072;&#1088;&#1080;&#1085;</a>[<a href='/id/{$user_id}/1961033'>c</a>]__<a href='/id/980161'>&#1087;&#1083;&#1072;&#1090;&#1083;&#1072;&#1089;</a>[<a href='/id/980161/1961033'>c</a>] 

<a href='/id/1549689'>||</a>
<a href='/id/1559635'>|t</a>
<a href='/id/1440515'>|r</a>
<a href='/id/1400424/1961033'>|h</a>&nbsp;
:<a href='/id/{$node.node_id}/14'>&#1079;&#1076;&#1088;&#1086;&#1081;</a>
<a href="javascript:develMnu()">dev</a>
 </form>
</div>
 <div class="t2"></div>
 <div id='devel' style='display:none'>
 
  <form method='post'>
    <input type='submit' name='event' value='debugging'>  |
    <input type='submit' name='event' value='addTemplate'>
    <input type='text' name='add_template_id' value='{$node.node_id}'>  |
    <input type='submit' name='event' value='addEvent'>
    <input type='text' name='add_event_id' value='{$node.node_id}'>  |
    <input type='submit' name='event' value='addPlugin'>
    <input type='text' name='add_plugin_id' value='{$node.node_id}'>  |
    <input type='submit' name='event' value='undelete'>
    <input type='text' name='undelete_id' value='31337'>
  </form>
 
 </div>
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>
{if $new_mail eq true}
<center><a href='/id/24'><b>mas {$new_mail} new mail||posledny od {$new_mail_name} {$new_mail_user_id}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}
<div id="mnu"></div>