<script type='text/javascript'>
{literal}
var pocet = 4;
function addmenu() {
    pocet++;
    menu = "<tr><td><input type='text' value='' name='menu_"+ pocet +"' /></td>";
    menu += "<td><input type='text' value='' name='id_"+ pocet +"' /></td></tr>";
    document.getElementById('header_menu').innerHTML += menu;
    document.getElementById('pocet').value = pocet;
}
{/literal}
</script>
<center>
<h3> Header template generator alpha 1 </h3>
<form action='/id/2153505' method='post'>
    <table id='header_menu' width='400'>
        <tr><td colspan='2'>main - 1, kyberia - 101, hysteria - 102<br />k - 15, bookmarks - 19, blogs - 21<br />
        last - 23, mail - 24, search - 25<br />people - 27, help - 1017832<br />
        <br />
        fixne menu je zalozene na marinovom cssku<br />[cize obsahuje t1 a t2 div]</td></tr>

        <tr><td> oddelovac </td>
        <td><input type='text' name='oddelovac' value='----' /></td></tr>

        <tr><td>fixne menu</td>
        <td>ano::<input type='radio' name='fixmenu' value='ano' /> nie::<input type='radio' name='fixmenu' value='nie' checked /></td></tr>

        <tr><td>cssko::</td>
        <td><input type='file' name='data_file'></td></tr>

        <tr><td><input type='text' name='name_1' value='main' /></td>
        <td><input type='text' name='id_1' value='1' /></td></tr>

        <tr><td><input type='text' name='name_2' value='kyberia' /></td>
        <td><input type='text' name='id_2' value='101' /></td></tr>

        <tr><td><input type='text' name='name_3' value='bookmarks' /></td>
        <td><input type='text' name='id_3' value='19' /></td></tr>

        <tr><td><input type='text' name='name_4' value='mail' /></td>
        <td><input type='text' name='id_4' value='24' /></td></tr>
    </table>
    <br />
    <input type='hidden' name='pocet' value='' id='pocet' />
    <input type='button' onclick='addmenu()' value='addmenu' />
    <br /><br />
    <input type='submit' name='event' value='generate_header_template' />
</form>
</center>