{if $header_id neq true}
{get_movement_params children_count=$node.node_children_count}
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
            <link rel='stylesheet' type='text/css' href='/data/css/main.css'>
                <title>prava sa nerozdavaju ale beru</title>
            </head>
<body>
    <form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
        {if $user_id eq true}{if $header_id neq true}{include file="modules/toolbar.tpl"}{/if}{/if}
        {if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
        {if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}{/if}

    <table align='center' valign='top' class='bordered' width='865'>
        <tr><td colspan='3' align='center' valign='top'></td></tr>
        <tr>
            <td align='left' valign='top' width='230'>
                {include file="1549925.tpl"}
                <br /><br /><br />
                <span class="important">Citizens:</span><br>
                {get_citizen_list}
                {foreach from=$get_citizen_list item=citizen}
                    <a href="/id/{$citizen.user_id}">{$citizen.login}</a><br />
                {/foreach}
            </td>
            <td valign='top' width='468'>
                <table class="bordered">
                    <tr><td>
                        <span class="important">Citizens:</span> {get_citizen_count}{$get_citizen_count}<br>
                        <span class="important">Votes needed:</span> {$get_citizen_count_need}<br><br>
                        <span class="important">Ustava:</span> Senat nemoze odhlasovat svoje zrusenie.<br><br>
                        <span class="important">Vyzva:</span> <b>Bolo by dobre, keby obcania a ziadatelia dodrziavali stabnu kulturu t.j. nedakovali za kacka formou ziadosti do senatu a nemenili nazvy svojich ziadosti o obcianstvo. titulky nod su totiz zatial jedinou moznostou okrem contentu, ako prispevky v senate filtrovat. pouzite show flat</b>
                        <br><br>
                        <span class="important">Linky:</span><br>
                        <a href="/id/1963268">_senat_</a> - tu mozete diskutovat o navrhoch<br>
                        <a href="/id/1967743">kyberia questz</a> - sem idu schvalene ziadosti formulovane pre koderov a developerov<br>
                        <a href="/id/1961192">solon's revenge</a> - 2.3 kyberia manifesto<br>
                        <a href="/id/1844471">senate_approved</a> - sem by obcania mohli preparentovat svoje uznane ziadosti o obcianstvo
                        <br><br>
                        <b>Vyzyvam vsetkych obcanov, aby ignorovali navrhy, ktore neboli riadne prediskutovane v _senat_-e. Pochopitelne, mozu existovat aj vynimky, ale navrhy, ktorych realizacia sa vyznamne dotkne vacsiny userov je vhodne prediskutovat, predideme tak nedorozumeniam, hadkam a chaosu, ktory neplodi nic produktivne.
                        <br><br>
                        <b>Vzhladom na to, ze momentalne nemam cas mazat tu v senate nejake hluposti a riesit rozmary roznych id (a nehodlam sa bavit ani o tom ci som fasista, jelito a nejake podobne objekty) budem davat za nezmysly az do odvolania <i>silence</i>.</i></b>
                        <br><br>
Na popud niekolkych id, aby som robil v senate poriadky som pomazal niekolko exkrementov <br>(PRANIER:: namatkovo spomeniem id nawdm, ktory este stale nie je schopny reagovat rozumnym sposobom pod prispevky)<br> rozsiahle diskusie mazat nebudem, hoci vlastnim senatnu nodu, necitim sa povolany a vznikne zbytocne iba dalsi nepokoj a verim ze niektori budu mat pocit, ze su diskriminovani a tomu sa chcem vyhnut - pokial to bude mozne.
<br><br>
Prijmam akukolvek konstruktivnu kritiku svojej pozicie ako majitela senatu a povinnosti s nou spojenych do posty. Zatial mame aspon filter, revidovanie senatnej templaty je dlhodoba vec na ktorej sa pracuje, ale tiez prijmam hociake navrhy, moj povodny napad zrejme zlyhal.
<br><br>
V senate "autokraticky a kruto vladnu" : Daniel, Jay, MARIN, freezy, Robert der Tanzende Schauspieler
                    </td></tr>
                </table>
                <br>
                <form method='post'>
                    <table class='bordered'>
                        <tr><td colspan='2' align='center' class='important'>Nova ziadost do senatu</td></tr>
                        <tr><td  class='important'>Nazov ziadosti::</td><td><input type='text' style='width: 230px;' name='node_name'></td></tr>
                        <tr><td  class='important'>Obsah ziadosti::</td><td><textarea name='request_content'></textarea></td></tr>
                        <tr><td  class='important'>Moznosti::</td><td><textarea name='options'></textarea><br><i>do ramceka zadaj lubovolne mnozstvo moznosti oddelene bodkociarkou (napr. ano;nie;mozno)</i></td></tr>
                        <tr><td align='center' colspan='2'><input type='submit' name='event' value='addSenateRequest'></td></tr>
                    </table>
                    <br>
                    <textarea name='node_content' style="width:123px; height:20px;">{$post_vars.node_content}</textarea>
                    <input type='submit' name='template_event' value='filter_by' style='height:20px'>
                    <select name='search_type'>
                       <option value='user'>user</option>
                       <option value='content'>content</option>
                    </select>
                    <br /><br />
                    {include file="1549913.tpl"}<br>
                    <span class='important'>Navrhy a ziadosti::</span><br><br>
                    {include file="1549839.tpl"}
                </form>
            </td>
            <td valign='top' width='165'>
                <center><br><a href='/id/1058820'>become citizen</a><br><br>
                <form action='/id/25/' method='post'>
                    <input type='text' value='{$smarty.post.query}' name='query'>
                    <input type='submit' name='template_event'  value='search'><br>
                </form>
                <br><br></center>
                {include file="1549803.tpl"}
                <a href='/id/876611/15'>Najuspesnejsie hlasovania</a><br><br>
                <a href='/id/876611/788016'>Najzhavejsie hlasovania</a>

            </td>
        </tr>
    </table>
    {include file="1549377.tpl"}




