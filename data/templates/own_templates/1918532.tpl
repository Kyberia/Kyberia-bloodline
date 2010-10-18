{literal}
<script language='javascript' type='text/javascript'>
function ajax() {
	var browser = navigator.appName;
	if(browser == "Microsoft Internet Explorer") {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else {
		xmlhttp = new XMLHttpRequest();
	}
	url = '/ajax/get_moods.php?user_id=2334';
	xmlhttp.open("GET", url);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("ajax").innerHTML = xmlhttp.responseText);
		}
	}
	xmlhttp.send(null);
}
</script>
{/literal}
<a href='#' onClick='ajax();'>ajax</a>
<div id='ajax'></div>