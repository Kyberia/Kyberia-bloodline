var hide = 0;
function showcontent(id) {
var fr_node_hide = 'fr_node_' + hide;
var fr_node_id = 'fr_node_' + id;
var fr_nodecn_hide = 'fr_nodecn_' + hide;
var fr_nodecn_id = 'fr_nodecn_' + id;
var fr_title_hide = 'fr_title_' + hide;
var fr_title_id = 'fr_title_' + id;
var fr_cn_hide = 'fr_cn_' + hide;
var fr_cn_id = 'fr_cn_' + id;
    document.getElementById(fr_node_hide).className = "fr_node_off";
    document.getElementById(fr_node_id).className = "fr_node_on";
    document.getElementById(fr_nodecn_hide).className = "fr_nodecn_off";
    document.getElementById(fr_nodecn_id).className = "fr_nodecn_on";
    document.getElementById(fr_title_hide).className = "fr_title_off";
    document.getElementById(fr_title_id).className = "fr_title_on";
    document.getElementById(fr_cn_hide).className = "fr_cn_off";
    document.getElementById(fr_cn_id).className = "fr_cn_on";
    hide = id;
}