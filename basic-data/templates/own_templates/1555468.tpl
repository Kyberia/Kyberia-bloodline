<!-- welcome to da hyperspace -->
<table class='bordered' id='node_coord' style='margin-bottom:8px;'><tr><td align='center'>
    <span style='font-weight:bold;'>cwbe coordinatez</span>:<br/>
    {$node.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}<br/><br/>
    {foreach from=$node.ancestors item=ancestor}
        <a href='/id/{$ancestor.link}' title='{$ancestor.name}'>{$ancestor.link}</a><br/>
    {/foreach}
    <br/>
    ABSOLUT<br/>
    <a href='/id/{$node.node_id}/15'>K</a>YBERIA
</td></tr></table>
<!-- hyperspace ain't left for now -->