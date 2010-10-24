function ShowHide_Menu() {
    if (menu.className == 'menu_off') {
        menu.className = 'menu_on';
        return "hide";
    } else {
        menu.className = 'menu_off';
        return "show";
    }
}

function ShowHide_Devmenu() {
    if (devmenu.className == 'menu_off') {
        devmenu.className = 'menu_on';
        return "dev | hide";
    } else {
        devmenu.className = 'menu_off';
        return "dev | show";
    }
}