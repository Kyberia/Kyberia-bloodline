function vymena() {
    var browser = navigator.appName;
    document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
    if(browser == "Microsoft Internet Explorer") {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else {
        xmlhttp = new XMLHttpRequest();
    }
    get_id_url = '/ajax/get_id_by_name.php?name=';
    get_id_url += document.formular.mail_to.value;
    xmlhttp.open("GET", get_id_url);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            id = xmlhttp.responseText;
            document.images['fricon'].src = '/images/nodes/' + id.substr(0, 1) + '/' + id.substr(1, 1) + '/' + id + '.gif';
        }
    }
    xmlhttp.send(null);
}

function chngto(name,id) {
    document.formular.mail_to.value = name ;
    name = name.toLowerCase() ;
    document.images['fricon'].src = '/images/nodes/' + id.substr(0, 1) + '/' + id.substr(1, 1)+'/' + id + '.gif';
}