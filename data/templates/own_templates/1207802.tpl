body {
    color: #777;
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    text-decoration: none;
    margin: 0;
    background-color: #000;
    background-position: bottom right;
    background-repeat: no-repeat;
    background-attachment: fixed;
}

/* fix menu: menu je potrebne vlozit do <div class="t1"> a podneho nasupovat div z "t2" */
.t1 {
    color: #777;
    position: fixed;
    margin: 0;
    text-align: center;
    font-size: 8pt;
    font-weight: normal;
    background-color: #000;
    top: auto;
    width: 100%;
    height: 17px;
    right: 0;
    top: 0%;
    left: 0;
    z-index: 666;
}

.t2 {
    height: 17px
}

inframe {
    width: 90%;
    height: 230px;
}

#body {
    width: 850px;
    margin-right: 93px;
}

#topic {
    width: 662px;
    padding: 2px;
    display: table;
    wordwrap: break-word;
}

img {
    background: #000;
    border: 0;
}

img:hover {
    background: #111;
}

a {
    color: #FFF;
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    text-decoration: none;
}

a:hover {
    color: #F00;
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    text-decoration: none;
}

a.mail {
    color: #FFF;
    font-size: 8pt;
    font-weight: bold;
    text-align: center;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    text-decoration: none;
}

a.mail:hover {
    color: #F00;
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    text-decoration: none;
    font-weight: bold;
    text-align: center;
}

td {
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    wordwrap: break-word;
}
.bordered {
    border: 1px solid #777;
    background-color: #000;
    z-index: 0;
}
.bordered2 {
    border-right: 1px solid #777;
    border-bottom: 1px solid #777;
    border-left: 1px solid #777;
    z-index: 0;
}
.header {
    background-color: #222;
    border-bottom: 1px solid #777;
    height: 100%;
    width: 100%;
    vertical-align: top;
    text-align: left;
    padding: 0pt;
    width: 100%;
    z-index: 0;
}
.important {
    font-weight: bold;
    color: #AAA;
}
.most_important {
    font-weight: bold;
    color: #F00;
}
.message {
    background-color: #000;
    z-index: 0;
}

.active_users .active_user_img {
    width: 50px;
    float: left;
}
.active_user_img img {
    border: 0;
    width: 50px;
    height: 50px;
}
.active_users .active_user_name {
    text-align: center;
}

textarea {
    width : 666px;
    height: 123px;
    background-color: transparent;
    border: 1px solid #777;
    color: #999;
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
}
textarea:focus {
    border: 1px dashed #AAA;
    color: #FFF;
}
textarea.node_content {
    width : 800px;
    height: 666px;
    background-color: transparent;
    border: 1px solid #777;
    color: #AAA;
}
textarea.node_content:focus {
    border: 1px dashed #AAA;
    color: #FFF;
}
textarea.small {
    width : 90%;
    height : 42px;
    border-color: #777;
    background-color: transparent;
    overflow: hidden;
    color: #FFF;
}
table[width="666"] td[colspan='3'] a {
    text-decoration: none;
    font-size: 6px;
}
table[width="666"] td[colspan='3'] a:hover {
    color: #FFF;
    background: #333;
}
input {
    color: #FFFFFF;
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    background-color: transparent;
    vertical-align: middle;
    border: 1px solid #777;
    height: 15px
}
input[type='submit'] {
    color: #FFF;
    background-color: #000;
    border: 1px solid #777;
    text-align: center;
}
input[type='submit']:focus {
    color: #000;
    background-color: #777;
    border: 1px solid #AAA;
}
input[type='text'] {
    border: 1px solid #777;
    color: #FFF;
}
input[type='text']:focus {
    border: 1px dashed #AAA;
    color: #FFF;
}
input[value='delete'] {position: fixed; right: 10px; bottom: 12px; width: 53px; z-index: 666;}

input[name='bookmark_category_id'] {position: fixed; right: 162px; bottom: 10px; width: 132px; z-index: 666;}
input[value='set_bookmark_category'] {position: fixed; right: 10px; bottom: 10px; width: 157px; z-index: 666;}

.add_put input[value='K'] {position: fixed; right: 156px; bottom: 30px; width: 27px; z-index: 666;}
input[value='<'] {position: fixed; right: 124px; bottom: 30px; width: 27px; z-index: 666;}
input[value='<<'] {position: fixed; right: 83px; bottom: 30px; width: 36px; z-index: 666;}
input[value='>>'] {position: fixed; right: 42px; bottom: 30px; width: 36px; z-index: 666;}
input[value='>'] {position: fixed; right: 10px; bottom: 30px; width: 27px; z-index: 666;}

input[value='delete_mail'] {position: fixed; right: 10px; bottom: 10px; width: 84px; z-index: 666;}

input.small {
    color: #FFF;
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    background-color: transparent;
    width: 50px;
    vertical-align: middle;
    border: 1px solid #777;
    height: 15px;
}
select {
    color: #FFF;
    font-size: 8pt;
    font-family: Tahoma, Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
    background-color: #000;
    vertical-align: middle;
    border: 1px solid #777;
    height: 15px;
}

/* friend hilighting */
.hilight {
    background-color: #222;
}
.hilight .header {
    background-color: #444;
    border-bottom: solid 1px #777;
}

/* useful menu */
#main_menu {
    float: right;
    border: 1px solid #777;
    background: #000;
    position: fixed;
    right: 5px;
    z-index: 5;
    width: 85px;
    text-align: center;
}
#main_menu .menu_off {
    display: none;
}
#main_menu .menu_on {
    display: block;
}
#main_menu .onoff {
    width: 71px;
    margin: 0 6px 0 6px;
    text-align: center;
    font-size: 6pt;
    color: #FFF;
    background: #000;
    border: 1px solid #777;
}
#menu div.line {
    width: 85px;
    height: 18px;
}
#menu div.line:hover {
    background: #111;
}
#menu input {
    margin: 1px;
}

/* user panel */
#panel {
    position: absolute;
    top: 0px;
    left: 0px;
    display: none;
    z-index: 23;
    color: #FFF;
    background: #000;
    border: 1px solid #777;
    padding: 2px;
    margin: 0;
}
#panel .panel_btn {
    border: 0;
    color: #FFF;
    background: transparent;
    margin: 0;
    padding: 1px 0 1px 0;
}
#panel .panel_btn:hover {
    color: #F00;
}
#panel form {
    padding: 0;
    margin: 0;
}


/* notable nodes */
#th_root {
margin:0;
padding:0;
}

#th_root li {
list-style-type:none;
border-left: 1px dotted #444;
padding-left:2pt;
margin-top: 5pt;
}

#th_root > li {
border-bottom: 1px dotted #333;
}

.th_cnt {
margin:0;
padding:0;
border-bottom: 1px dotted #444;
}


a.vector {
font-size: 6pt;
}

a.vector:hover {
font-size: 6pt;
}

.th_cnt .bordered {
margin:0;
padding: 2px;
border: 2px solid #6dae42;
background: #000;
}

.th_header {
margin:0;
padding:0.2em;
background: #333;
}

.th_header input {
margin:0;
padding:0;
width: 8pt;
height: 8pt;
background: #444; /* len opera */
border: 1px solid #000; /* len opera */
color: #000;
opacity: 0.8;
}

.th_header input:hover {
background: #000;
color: #6dae42;
border: 1px solid;
opacity: 1;
}

.th_header div {
margin:0;
}

.th_content {
margin:0;
padding:0;
}