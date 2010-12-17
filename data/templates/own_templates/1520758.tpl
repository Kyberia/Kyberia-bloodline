body {
color : #6DAE42;
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
text-decoration: none;
margin: 0;
background-color: #000;
background-position: top center;
background-repeat: no-repeat;
scrollbar-shadow-color: #6DAE42;
scrollbar-highlight-color: #000;
scrollbar-3dlight-color: #6DAE42;
scrollbar-base-color: #000;
scrollbar-darkshadow-color: #000;
scrollbar-track-color: #000;
scrollbar-arrow-color: #000;
}

/* fix menu: menu je potrebne vlozit do <div class="t1"> a podneho nasupovat div z "t2" */
.t1 {
color: #6DAE42;
position: fixed;
margin: 0;
text-align: center;
font-size: 8pt;
font-weight: normal;
background-color: #000;
border-bottom: 1px dashed #6DAE42;
top: auto;
width: 100%;
height: 20px;
right: 0;
top: 0%;
left: 0;
z-index: 666;
}

.t2 {height: 20px}

inframe {
width: 90%;
height:230px;
}

textarea.small {
width : 90%;
height : 42px;
border-color: #6DAE42;
background-color: transparent;
overflow: hidden;
font-color: #FFF;
color: #FFF;
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
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
text-decoration: none;
}

a:hover {
color: #F00;
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
text-decoration: none;
}

a.mail {
color: #F00;
font-size: 8pt;
font-weight: bold;
text-align: center;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
text-decoration: none;
}

a.mail:hover {
color: #FFF;
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
text-decoration: none;
font-weight: bold;
text-align: center;
}

a.mail:active {
border-bottom: 5px solid #333;
}


td {
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
wordwrap: break-word;
}

table[width="666"] {background: #000;}

.bordered {
border: dashed 1px #6DAE42;
border-bottom: 1px dashed #6DAE42;
border-left: 1px dashed #6DAE42;
background-color: #000;
}

.bordered2 {
border: dashed 1px #6DAE42;
border-bottom: 1px;
border-left: 1px;
}

input {
color: #FFFFFF;
font-size: 8pt;
font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
background-color: transparent;
vertical-align: middle;
border: solid 1px #6DAE42;
height: 15px
}

input[type='submit'] {color: #FFF; background-color: #000; border: 1px solid #6DAE42;}
input[type='submit']:focus {color: #000; background-color: #6DAE42; border: 1px solid #6DAE42;}

input[type='text'] {border: 1px solid #6DAE42; color: #FFF;}
input[type='text']:focus {border: 1px dashed #FFF; color: #FFF;}

input[value='K'] {position: fixed; right: 175px; bottom: auto; bottom: 25px; width: 20px; z-index: 666;}
input[value='delete'] {position: fixed; right: 110px; bottom: auto; bottom: 25px; width: 60px; z-index: 666;}
input[value='put'] {position: fixed; right: 65px; bottom: auto; bottom: 25px; width: 40px; z-index: 666;}
input[name='nodeshell_id'] {position: fixed; right: 10px; bottom: auto; bottom: 25px; background-color: #000; width: 50px; z-index: 666;}

input[name='bookmark_category_id'] {position: fixed; right: 165px; bottom: auto; bottom: 25px; width: 100px; z-index: 666;}
input[value='set_bookmark_category'] {position: fixed; right: 10px; bottom: auto; bottom: 25px; width: 150px; z-index: 666;}

input[value='<'] {position: fixed; right: 175px; bottom: auto; bottom: 45px; width: 20px; z-index: 666;}
input[value='<<'] {position: fixed; right: 140px; bottom: auto; bottom: 45px; width: 30px; z-index: 666;}
input[name='listing_amount'] {position: fixed; right: 77.5px; bottom: auto; bottom: 45px; width: 50px; text-align: center; z-index: 666;}
input[value='>>'] {position: fixed; right: 35px; bottom: auto; bottom: 45px; width: 30px; z-index: 666;}
input[value='>'] {position: fixed; right: 10px; bottom: auto; bottom: 45px; width: 20px; z-index: 666;}

input[value='delete_mail'] {position: fixed; right: 10px; bottom: auto; bottom: 25px; width: 100px; z-index: 666;}

input.small {
color: #FFF;
font-size: 8pt;
font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
background-color: transparent;
width: 50px;
vertical-align: middle;
border: solid 1px #6DAE42;
height: 15px;
}

select {
color: #FFF;
font-size: 8pt;
font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
background-color: #000;
vertical-align: middle;
border: solid 1px #6DAE42;
height: 15px;
}

.header {
background-color: #222;
border-bottom: solid 1px #6DAE42;
height: 100%;
width: 100%;
vertical-align: top;
align: left;
padding: 0pt;
width: 100%;
}

.important {
font-weight: bold;
text-align: center;
}

.most_important {
font-weight: bold;
font-color: #F00;
color: #F00;
}

.active_users .active_user_img {
width: 50px;
float: left;
}

.active_user_img img {
border: 0; width: 50px; height: 50px;
}

.active_users .active_user_name {
text-align: center;
}

textarea {
width : 666px;
height: 123px;
background-color: transparent;
border: 1px dashed #6DAE42;
color: #999;
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
}
textarea:focus {border: 1px dashed #FFF; color: #FFF;}

textarea.node_content {
width : 800px;
height: 666px;
background-color: transparent;
border: 1px dashed #6DAE42;
color: #999;
}
textarea.node_content:focus {border: 1px dashed #FFF; color: #FFF;}

/* ----- FRIEND HILIGHT ----- */
.hilight {
	background-color: #222;
}
.hilight .header {
	background-color: #555;
}

/* ----- PANEL ----- */
#panel {
	position: absolute;
	top: 0px;
	left: 0px;
	display: none;
	z-index: 23;
	color: #FFF;
	background: #000;
	border: 1px solid #6DAE42;
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