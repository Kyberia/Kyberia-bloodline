<b>utility: header_template rescue</b> <br/>
momentalne nefunguje pre iste restrikcie systemu
{* pouzivanie php bolo zakazane}

 if (isset($_POST['id_usera'])) {
 echo "formular set_header_template pre user id " . $_POST['id_usera'];
 echo "<form action='/id/";
 echo $_POST['id_usera'];
 echo "' method='post'><input type='text' name='header_id' value='";

{/pouzivanie php bolo zakazane/php *}
{$header_id}
{* pouzivanie php bolo zakazane}
 echo "'><input type='submit' name='event' value='set_header_template'></form>";
} else {
 echo "zadaj ID nody usera ";
}
{/php *}
<form action='http://kyberia.sk/id/1695281/' method='post'>
<input type='text' name='id_usera'>
<input type='submit' value='vygeneruj set_header_template formular' name='submit'>
</form>

</body>
</html>