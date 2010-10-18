{if $header_id neq true}
<html>
   <head>

		<meta http-equiv="Default-Style" content="kyberia">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
		<link rel='stylesheet' title="kyberia" type='text/css' href='/data/templates/own_templates/2019722.tpl'>
		<title>{* title.tpl *}{include file="791948.tpl"}</title>

		<script language="JavaScript" type="text/javascript">
			<!--
			{literal}
			function vymena()
			{
				document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
				var browser = navigator.appName;
				if(browser == "Microsoft Internet Explorer")
				{
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				else
				{
					xmlhttp = new XMLHttpRequest();
				}
				get_id_url = 'http://kyberia.sk/ajax/get_username_by_id.php?name=';
				get_id_url += document.formular.mail_to.value;
				xmlhttp.open("GET", get_id_url);
				xmlhttp.onreadystatechange = function()
				{
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
					{
						id = xmlhttp.responseText;
						document.images['fricon'].src = '/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
					}
				}
				xmlhttp.send(null);
			}
			function chngto(name,id)
			{
				document.formular.mail_to.value = name ;
				name = name.toLowerCase() ;
				document.images['fricon'].src = '/images/nodes/'+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
			}
			{/literal}
			-->
		</script>

   </head>
   <body id='configure'>

	   {if $user_id eq true}{include file="1549959.tpl"}{/if}
	   {if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
	   {if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}
{/if}
		{if $user_id eq false}<center>{* loginbox *}{include file="1549885.tpl"}</center><br /><br />{/if}
		{if $node.node_creator eq $user_id or $node.node_permission eq 'master'}
		<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
			<input type='text' name='node_name' value='{$node.node_name}' />
			<input type='submit' name='event' value='configure_node_name' />
			<br>
			<select name='node_system_access'>
				<option value='public' {if $node.node_system_access eq 'public'}selected{/if}>public</option>
				<option value='moderated' {if $node.node_system_access eq 'moderated'}selected{/if}>moderated</option>
				<option value='private' {if $node.node_system_access eq 'private'}selected{/if}>private</option>
				<option value='cube' {if $node.node_system_access eq 'cube'}selected{/if}>cube</option>
				<option value='crypto' {if $node.node_system_access eq 'crypto'}selected{/if}>crypto</option>
			</select>
			<input type='submit' name='event' value='configure_system_access' />
			<br>
			<input name='node_external_access' type='checkbox' value='yes' {if $node.node_external_access eq 'yes'}checked{/if} />
			<input type='submit' name='event' value='configure_external_access' />
			<br>
			{if $node.node_creator eq $user_id}
			<input type='file' name='description_image' />
			<input type='submit' name='event' value='configure_image' />
			{/if}
			<br>
			<input type='text' name='template_id' value='{$node.template_id}' title='[submission: 4 | forum: 3 | nodeshell: 2 | article: 5 | data: 12 | user: 7]' />
			<input type='submit' name='event' value='configure_template_id' />
			<br>
			apply on vector ??? <input type='checkbox' name='apply_on_vector' />


		</form>
		{/if}
   </body>
</html>
