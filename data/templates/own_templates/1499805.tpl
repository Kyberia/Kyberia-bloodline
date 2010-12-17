body {
color : #008000;
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
text-decoration: none;
margin: 0;
background-color: #000;
background-position: center center;
background-repeat: no-repeat;
background-attachment: fixed;
scrollbar-shadow-color: #008000;
scrollbar-highlight-color: #000;
scrollbar-3dlight-color: #008000;
scrollbar-base-color: #000;
scrollbar-darkshadow-color: #000;
scrollbar-track-color: #000;
scrollbar-arrow-color: #008000;
}

/* fix menu: menu je potrebne vlozit do <div class="t1"> a podneho nasupovat div z "t2" */
.t1 {
color: #008000;
position: fixed;
margin: 0;
text-align: center;
font-size: 8pt;
font-weight: normal;
background-color: #000;
border: 0;
top: auto;
width: 100%;
height: 17px;
right: 0;
top: 0%;
left: 0;
z-index: 23;
}

.t1 a {
color: #FFF;
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
text-decoration: none;
font-weight: bold;
}

.t1 a:hover {
color: #F00;
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
text-decoration: none;
font-weight: bold;
}

.t2 {height: 17px}

img {
	border: 0;
}
inframe {
width: 90%;
height:230px;
}

textarea.small {
width : 90%;
height : 42px;
border: 1px solid #008000;
background-color: transparent;
overflow: hidden;
color: #FFF;
}

a {
color: #FFF;
border: 0;
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

td {
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
wordwrap: break-word;
}

.bordered {
border: 1px solid #008000;
background-color: #000;
}

.bordered2 {
border: 1px solid #008000;
}

input {
color: #FFFFFF;
font-size: 8pt;
font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
background-color: transparent;
vertical-align: middle;
border: 1px solid #008000;
height: 15px
}

input[type='submit'] {color: #FFF; background-color: #000; border: 1px solid #008000;}
input[type='submit']:focus {color: #000; background-color: #008000; border: 1px solid #008000;}

input[type='text'] {border: 1px solid #008000; color: #FFF;}
input[type='text']:focus {border: 1px solid #FFF; color: #FFF;}

input[value='delete'] {position: fixed; right: 110px; bottom: auto; bottom: 10px; width: 60px; z-index: 666666;}

input[name='bookmark_category_id'] {position: fixed; right: 165px; bottom: auto; bottom: 10px; width: 100px; z-index: 666666;}
input[value='set_bookmark_category'] {position: fixed; right: 10px; bottom: auto; bottom: 10px; width: 150px; z-index: 666666;}

input[value='<'] {position: fixed; right: 105px; bottom: auto; bottom: 30px; width: 20px; z-index: 666666;}
input[value='<<'] {position: fixed; right: 70px; bottom: auto; bottom: 30px; width: 30px; z-index: 666666;}
input[value='>>'] {position: fixed; right: 35px; bottom: auto; bottom: 30px; width: 30px; z-index: 666666;}
input[value='>'] {position: fixed; right: 10px; bottom: auto; bottom: 30px; width: 20px; z-index: 666666;}

input[value='delete_mail'] {position: fixed; right: 10px; bottom: auto; bottom: 10px; width: 100px; z-index: 666666;}

input.small {
	color: #FFF;
	font-size: 8pt;
	font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
	background-color: transparent;
	width: 50px;
	vertical-align: middle;
	border: 1px solid #008000;
	height: 15px;
}

select {
	color: #FFF;
	font-size: 8pt;
	font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
	background-color: #000;
	vertical-align: middle;
	border: 1px solid #008000;
	height: 15px;
}

.header {
	background-color: #222;
	border-bottom: 1px solid #008000;
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
	color: #F00;
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
	border: 1px solid #008000;
	color: #999;
	font-size: 8pt;
	font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
}
textarea:focus {
	border: 1px solid #FFF;
	color: #FFF;
}
textarea.node_content {
	width : 800px;
	height: 666px;
	background-color: transparent;
	border: 1px solid #008000;
	color: #999;
}
textarea.node_content:focus {
	border: 1px solid #FFF;
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

/* ----- PANEL ----- */
#panel {
	position: absolute;
	top: 0px;
	left: 0px;
	display: none;
	z-index: 23;
	color: #FFF;
	background: #000;
	border: 1px solid #008000;
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