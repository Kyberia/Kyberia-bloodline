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
   <body>

	   {if $user_id eq true}{include file="1549959.tpl"}{/if}
	   {if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
	   {if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}
{/if}

	   <table style='width: 100%; align:center;' id='configure'>
		   <tr>
				<td align='center'>
				   {if $user_id eq false}<center>{* loginbox *}{include file="1549885.tpl"}</center><br /><br />{/if}
				   {if $node.node_creator eq $user_id or $node.node_permission eq 'master'}
				   <form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
					   <table align='center'>
						   <tr>
							   <td><input type='text' name='node_name' value='{$node.node_name}' /></td>
							   <td><input type='submit' name='event' value='configure_node_name' /></td>
						   </tr>
						   <tr>
							   <td>
								   <select name='node_system_access'>
									   <option value='public' {if $node.node_system_access eq 'public'}selected{/if}>public</option>
									   <option value='moderated' {if $node.node_system_access eq 'moderated'}selected{/if}>moderated</option>
									   <option value='private' {if $node.node_system_access eq 'private'}selected{/if}>private</option>
									   <option value='cube' {if $node.node_system_access eq 'cube'}selected{/if}>cube</option>
									   <option value='crypto' {if $node.node_system_access eq 'crypto'}selected{/if}>crypto</option>
								   </select>
							   </td>
							   <td><input type='submit' name='event' value='configure_system_access' /></td>
						   </tr>
						   <tr>
							   <td><input name='node_external_access' type='checkbox' value='yes' {if $node.node_external_access eq 'yes'}checked{/if} /></td>
							   <td><input type='submit' name='event' value='configure_external_access' /></td>
						   </tr>
						   {if $node.node_creator eq $user_id}
						   <tr>
							   <td><input type='file' name='description_image' /></td>
							   <td><input type='submit' name='event' value='configure_image' /></td>
						   </tr>
						   {/if}
						   <tr>
							   <td><input type='text' name='template_id' value='{$node.template_id}' title='[submission: 4 | forum: 3 | nodeshell: 2 | article: 5 | data: 12 | user: 7]' /></td>
							   <td><input type='submit' name='event' value='configure_template_id' /></td>
						   </tr>
					   </table>
					   <table>
							<tr>
								<td>apply on vector ??? <input type='checkbox' name='apply_on_vector' /></td>
							</tr>
					   </table>
				   </form>

				   <form action='/id/{$node.node_id}/' method='post'>
					   <table>
						   <tr>
							   <td colspan='2'>vector: {$node.node_vector}</td>
						   </tr>
						   <tr>
							   <td><input type='text' name='new_parent' value='{$node.node_parent}' /></td>
							   <td><input type='submit' name='event' value='set_parent' /></td>
						   </tr>
						   {if $node.node_creator eq $user_id}
						   <tr>
							   <td><input type='text' name='external_link' value='{$node.external_link}' /></td>
							   <td><input type='submit' name='event' value='set_external_link' /></td>
						   </tr>
						   {/if}
					   </table>
				   </form>

				   {if $node.node_creator eq $user_id}
				   <form action='/id/{$node.node_id}/' method='post'>
					   <input type='text' name='owner' value='{$node.owner}' />
					   <input type='submit' name='event' value='set_creator' />
				   </form>
				   {/if}

				   <form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
					   {if $node.node_system_access eq 'crypto'}crypto password: {$crypto_pass}{/if}
					   <input type='file' name='data_file' />
					   <input type='submit' name='event' value='upload_data_file' /><br />
					   <input type='checkbox' name='unzip' />unzip?
					   <input type='checkbox' name='gallery'>gallery<br /><br />
				   </form>

				   {if $user_id eq $node.node_id}
				   <form action='/id/{$node.node_id}/' method='post'>
					   <table align='center'>
						   <tr>
							   <td><input type='text' name='k_wallet' value='{$k_wallet}' /></td>
							   <td><input type='submit' name='event' value='k_wallet' /></td>
						   </tr>
						   <tr>
							   <td><input type='text' name='header_id' value='{$header_id}' /></td>
							   <td><input type='submit' name='event' value='set_header_template' /></td>
						   </tr>
						   <tr>
							   <td><input type='text' name='listing_amount' value='{$listing_amount}' /></td>
							   <td><input type='submit' name='event' value='set_listing_amount'  /></td>
						   </tr>
						   <tr>
							   <td>
								   <select name='listing_order'>
									   <option value='desc'  {if $smarty.session.listing_order eq 'desc'}selected{/if}>najnovsie hore</option>
									   <option value='asc' {if $smarty.session.listing_order eq 'asc'}selected{/if}>najstarsie hore</option>
								   </select>
							   </td>
							   <td><input type='submit' name='event' value='set_listing_order' /></td>
						   </tr>
					   </table>
					   <br />
					   <table class='bordered'>
						   <tr><td>old password</td><td><input name='old_password' type='password' /></td></tr>
						   <tr><td>new password</td><td><input name='new_password1' type='password' /></td></tr>
						   <tr><td>new password (again)</td><td><input name='new_password2' type='password' /></td></tr>
						   <tr><td colspan='2' align='center'><input type='submit' name='event' value='set_password' /></td></tr>
					   </table>
				   </form><br />

				   {get_user_email_icq_www user_id=$node.node_id}
				   {get_moods user_id=$user_id}
				   <form action='/id/{$node.node_id}/' method='post'>
					   <table>
						   <tr>
							   <td><input type='text' name='user_email' value='{$get_user_email}' /></td>
							   <td><input type='submit' name='event' value='configure_email' /></td>
						   </tr><br />
						   <tr>
							   <td><textarea class='small' name='moodlist'>{$get_moods_string}</textarea></td>
							   <td><input type='submit' name='event' value='moodlist' /></td>
						   </tr>
						   <tr>
							   <td>
								   <select name='mood'>
									   {foreach from=$get_moods item=mood}
									   <option value='{$mood.node_id}' {if $get_moods_mood.node_id eq $mood.node_id}selected{/if}>{$mood.node_name}</option>
									   {/foreach}
									   <option value='' {if $get_moods_mood.node_id eq ''}selected{/if}>clear mood</option>
								   </select>
								</td>
								<td><input type='submit' name='event' value='set_mood' /></td>
						   </tr>
					   </table>
					</form>
					{/if}
					{/if}

					<form method='post'>
						template_id: <input type='text' value='{$node.node_id}' name='add_template_id' /><br />
						<input type='submit' name='event' value='addTemplate' />
					</form>

					{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}
					<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
						<textarea class=node_content name='node_content'>{$node.node_content|escape:"html"}</textarea><br />
						<center>
							<input type='submit' name='event' value='configure_content'> &nbsp;&nbsp;
							<input type='checkbox' name='no_html' value='yes' />&nbsp;NO HTML &nbsp;&nbsp;
							<input type='checkbox' name='code' value='yes'>&nbsp;code &nbsp;&nbsp;
							<input type='checkbox' name='wiki' value='yes'>&nbsp;wiki
						</center><br /><br />
					</form>
					<form method='post' action='/id/{$node.node_id}'>
						{get_node_commanders}{*masterlist*}{include file="1549911.tpl"}
					</form>
					{/if}
				</td>
			</tr>
		</table>

	   <!-- in memorian ergond 23.7.2002 -->
		<center>
			&copy; kyberia.sk v2.3 - solon's revenge<br />
			prevadzkovatel stranky ruci za nic<br />
		</center>
   </body>
</html>
