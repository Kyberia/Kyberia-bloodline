<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<script src='/id/1515428' type='text/javascript'></script>

<!-- <link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'> -->
<!-- <link rel='stylesheet' type='text/css' href='/id/2120531/download'> -->
<!-- <link rel='stylesheet' type='text/css' href='http://hysteria.sk/~smrtk/o.t'> -->
<link rel='stylesheet' type='text/css' href='http://147.32.129.99/~hrkalka/pub/o.t'>
<title>{$node.node_name} @ kbr.sk</title>

{if $node.node_name eq 'mail'}

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

		get_id_url = '/ajax/get_username_by_id.php?name=';

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

{/literal}

-->

</script>
{/if}
</head>
<body>
<center>
<div id='panel' onmouseout='hideSubmenu();' onmouseover='km();'></div> <script language='JavaScript' type='text/javascript'>p = document.getElementById("panel");</script>
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>

{if $error eq true}
[<span class='most_important'>{$error}</span>]<br>
{/if}
<a href='/id/1'> # </a>*
<a href='/id/2078639'> &#191; </a>*
<a href='/id/101/'> k </a>*
<!-- <a href='/id/102/'> h </a>* -->
<a href='http://anonym.to/?http://www.nyx.cz' target='_blank'> nx </a>*
<a href='http://anonym.to/?https://www.homeofpoi.com/ubbthreads/login.php?Cat=0' target='_blank'> hp </a>*
<a href='http://anonym.to/?http://www.mail.ru' target='_blank'> r</a>
<a href='http://anonym.to/?http://mail.google.com/mail/x/' target='_blank'>g</a>@ *
<!-- <a href='/id/63858'> frshw </a>* -->
<!-- <a href='/id/1196221'> f </a>* -->
<a href='/id/24'> {if $new_mail eq true}[{$new_mail_name}:<span class='most_important'>{$new_mail}</span>]{/if}{if $new_mail eq false} @ {/if} </a> *
<a href='/id/156968'> bm</a><a href='/id/1478235'>kz</a><a href='/id/2500049'><b>+</b> </a>*
<a href='/id/1999275'> P </a>*
<a href='/id/1406838'> n.d </a>*
<!-- <a href='/id/23'> lst </a>* -->
<a href='/id/2526026'> K</a><a href='/id/1569351'><b>-</b> </a>*
<!-- <a href='/id/27'> ppl </a>* -->
<a href='/id/64323/1549582'> lnx </a>*
<!-- <a href='/id/23'> lst </a>* -->
<!-- <a href='/id/20'> clanky </a>* -->
<a href='/id/21'> blgz</a><a href='/id/903198'><b>+</b> </a>*
<a href='/id/25'> srch </a>*
<a href='http://anonym.to/?http://www.sme.sk' target='_blank'> sme </a>*
<!-- <a href='http://anonym.to/?http://www.pobox.sk'> pbx </a>* -->
<a href=http://anonym.to/?http://zona.amtel.sk target='_blank'> msg </a>*
<a href=http://anonym.to/?http://babelfish.altavista.com target='_blank'> bblfsh </a>*
<a href=http://anonym.to/?http://maps.google.com target='_blank'> map</a>.<a href=http://anonym.to/?http://www.multimap.com target='_blank'>uk </a>*
<a href='/id/1370868'> kev </a>*
<a href='/id/{$user_id}'> m</a><a href='/id/{$user_id}/1573668'>e</a><a href='/id/{$user_id}/1911535'><b>+</b> </a>*
<a href='/id/{$user_id}/1961033'> cfg </a>*
<!-- <input type='submit' value='logout' name='event' tabindex='7'> -->
<button name='event' value='logout' type='submit'>.</button>
</form>
</center>