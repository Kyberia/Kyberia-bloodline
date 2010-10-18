#mnu {
	width: 170px;
	height: 74px;
	position: fixed;
	left: 0;
	bottom: 0;
	background: black;
	_display: none;
}
#topic {
        width:660px;
        padding:6px;
        display: table;
}
object {display:none;}


.active_user_img {
	width: 53px;
	height: 53px;
	margin: 0;
	padding:0;
	display:block;
	float:left;
}
.active_user_img img {width: 50px; height:50px; border: 0;}

.active_user_img img:hover {border: 0; width: 53px; height: 53px;}

.active_users .active_user_name {
text-align: center;
}

.bordered {
}

.bordered2 {
	border-left: solid 1px #FD00B3;
	border-right: solid 1px #FD00B3;
	border-bottom: solid 1px #FD00B3;
}

.header {
	color: black;
	background: #FD00B3;
	border:1px solid black;
	height: 100%;
	width: 100%;
	vertical-align: top;
	padding: 0pt;
}

table[width="666"] .header {
	border:0;
}

.header .most_important {
	font-weight: bold;
	color: black;
}

.header a {
	text-decoration: none;
}

.th_cnt .icon {margin-top:2px}

.th_header {
	color: black;
	background: #FD00B3;
}



.th_header .most_important {
	font-weight: bold;
	color: black;
}

.th_header a {
	text-decoration: none;
}

a.vector {
	color: #aaa;
	background: #aaa;
	text-decoration: none;
	font-size: 2px;
}

a.vector:hover {
	background: #000;
}

.important {
	font-weight: bold;
	text-align: center;
}

a.important:hover {
	font-weight: bold;
}

.most_important {
	font-weight: bold;
	color: red;
}

.t1 {
	position: fixed;
	margin: 0;
	text-align: center;
	background-color: #000;
	top: 0%;
	width: 100%;
	height: 20px;
	right: 0;
	left: 0;
        z-index:2;
}

.t2 {
	height: 20px;
}

a {
	color: white;
	text-decoration: none;
	font: 8pt Verdana,"Arial CE","Helvetica CE",Arial,Helvetica;
}

a.mail {
	color: red;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	font: 8pt Verdana,"Arial CE","Helvetica CE",Arial,Helvetica;
}

a.mail:active {
	border-bottom: 5px solid #333;
}

a.mail:hover {
	color: white;
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	font: 8pt Verdana,"Arial CE","Helvetica CE",Arial,Helvetica;
}

a:hover {
	color: #ACA899;
	font: 8pt Verdana,"Arial CE","Helvetica CE",Arial,Helvetica;
}

body {
	color: #FD00B3;
	text-decoration: none;
	margin: 0;
	scrollbar-shadow-color: #000;
	scrollbar-highlight-color: #000;
	scrollbar-3dlight-color: #000;
	scrollbar-base-color: #FD00B3;
	scrollbar-darkshadow-color: #000;
	scrollbar-track-color: black;
	scrollbar-arrow-color: #FD00B3;
	font: 8pt Verdana,"Arial CE","Helvetica CE",Arial,Helvetica;
	background: black url("http://img172.imageshack.us/img172/294/untitled18dk.png") no-repeat fixed bottom right;
}

img > a:hover {
	border-bottom: 0px solid red;
}

img[width=50] {
	border: 1px solid black;
}

inframe {
	width: 90%;
	height: 230px;
}

input {
	color: white;
	background-color: transparent;
	vertical-align: middle;
	border: solid 1px #FD00B3;
	height: 18px;
	font: 8pt Verdana,Arial,Helvetica,Geneva,Swiss,SunSans-Regular;
}


.header input {
  margin:0;
  padding:0;
  width: 8pt;
  height: 8pt;
  background-color: #000;   /* len opera */
  border: 1px solid #fff;   /* len opera */
  color: #fff;
  opacity: 0.8;
}

.th_header input {
  margin:0;
  padding:0;
  width: 8pt;
  height: 8pt;
  background-color: #000;   /* len opera */
  border: 1px solid #fff;   /* len opera */
  color: #fff;
}

input.small {
	color: white;
	background-color: transparent;
	width: 50px;
	vertical-align: middle;
	border: solid 1px #FD00B3;
	height: 18px;
	font: 8pt Verdana,Arial,Helvetica,Geneva,Swiss,SunSans-Regular;
}

input[name='get_children_move'] {
	background: black;
	height: 10px;
	padding: 0;
	font-size: 10px;
	position: fixed;
	bottom: 35px;
	border: 0;
}

input[name='get_children_move']:focus {
	color: #fff;
}

input[name='listing_amount'] {
	border: 0px;
	background: black;
	height: 10px;
	padding: 0;
	font-size: 10px;
	width: 20px;
	position: fixed;
	left: 80px;
	bottom: 35px;
}

input[name='listing_amount']:focus {
	border: 0;
	background: black;
}

input[name='new_parent'] {
	color: #fff;
	border: 0;
	background-color: transparent;
	margin: 0;
	padding: 0;
	height: 18px;
}

input[name='nodeshell_id'] {position: fixed; left: 111px; bottom: auto; bottom: 10px; background-color: black; width:55px}

input[type='text'][name='new_parent']:focus {
	color: #FD00B3;
	border: 0;
	border-top: 1px solid #fff;
}

input[type=submit] {
	color: #FD00B3;
	background-color: #000;
	border: 1px solid;
}

input[type=submit]:focus {
	background-color: #FD00B3;
	color: #fff;
}

input[type=text]:focus, textarea.node_content:focus {
	border: 1px solid #fff;
	color: #FD00B3;
}

input[value='<'] {
	left: 10px;
	border: 0;
	border-left: 2px solid;
}

input[value='<<'] {
	left: 30px;
	border: 0;
	border-left: 2px solid;
}

input[value='>'] {
	left: 150px;
	border: 0;
	border-right: 2px solid;
}

input[value='>>'] {
	left: 120px;
	border: 0;
	border-right: 2px solid;
}

input[value='K'] {
	position: fixed;
	bottom: 55px;
	background: black;
	border: 0;
	border-left: 2px solid;
	left: 10px;
	height: 10px;
	padding: 0;
	font-size: 10px;
}

input[value='add'] {
	color: #FD00B3;
	border: 0;
	background-color: transparent;
	margin: 0;
	padding: 0;
	height: 15px;
	font-size: 10px;
	width: 70px;
}

input[value='delete'] {
	border: 1px solid;
	font-size: 8pt;
	height: 18px;
	position: fixed;
	width: 59px;
	left: 10px;
	bottom: 10px;
}

input[value='filter_by'] {
	color: #FD00B3;
	border: 0;
	background-color: transparent;
	width: 70px;
	margin: 0;
	padding: 0;
	height: 15px;
	font-size: 10px;
}

input[value='preview'], input[value='send'], input[value='delete_mail'] {
	color: #FD00B3;
	width: 70px;
	border: 0;
	background-color: transparent;
	margin: 0;
	padding: 0;
	height: 15px;
	font-size: 10px;
}

input[value='put'] { height: 18px; font-size: 8pt; border:1px solid; position: fixed; left: 70px; bottom: auto; bottom: 10px; width:40px}

input[value='set_parent'] {
	color: #FD00B3;
	width: 70px;
	border: 0;
	background-color: transparent;
	margin: 0;
	padding: 0;
	height: 18px;
	font-size: 10px;
}

option {
	margin: 0px;
	background: transparent;
}

select {
	color: #FD00B3;
	background-color: transparent;
	vertical-align: middle;
	border: 1px solid #FD00B3;
	height: 18px;
	font: 8pt Verdana,Arial,Helvetica,Geneva,Swiss,SunSans-Regular;
}

select[name='listing_order'] {
	border: 1px solid transparent;
	height: 20px;
	padding: 0;
	font-size: 10px;
	position: fixed;
	left: 74px;
	bottom: 55px;
}

select[name='listing_order']:focus {
	border: 1px solid transparent;
}

select[name='nodeshell_id_select'] {border-top:0; border-bottom:0;}

table[width="666"] {
	background: #fff;
}

table[width="666"] a {
	color: black;
	text-decoration: underline;
}

td {
	wordwrap: break-word;
	font: 8pt Verdana,"Arial CE","Helvetica CE",Arial,Helvetica;
}
/*
table[width="666"] td[colspan='3'] {
	display: none;
}
*/
table[width="666"] td[colspan='3'] a {
	color: #aaa;
	background: #aaa;
	text-decoration: none;
	font-size: 2px;
}

table[width="666"] td[colspan='3'] a:hover {
   background: #000;
}

td[width="16%"] {
	border: 0px solid pink;
}

textarea {
	width: 666px;
	height: 123px;
	background-color: #FD00B3;
	border: 1px solid #FD00B3;
	color: white;
	font: 8pt monospace;
}

textarea.node_content {
	width: 800px;
	height: 666px;
	background-color: transparent;
	border: 1px solid #FD00B3;
	color: white;
}

textarea.small {
	width: 90%;
	height: 42px;
	border-color: #FD00B3;
	background-color: transparent;
	overflow: hidden;
	font-color: white;
	color: white;
}

textarea:focus {
	color: black;
}

.message { z-index:0; }

.node_userlist {
  width:666px;
  text-align:center;
  margin-bottom:10px;
  position:relative;
  z-index:0;
}

.node_userlist img {
  width: 50px;
  height: 50px;
  border: 0;
  margin: 0 3px 3px 0;
}

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

input[value='destroy_synapse'] {background:#fff}

.toolbar, #own_toolbar, .add_put { background: #fff; width: 666px; }

.toolbar { margin: 0 0 2px 0; padding: 2px 0 1px 0; }
#own_toolbar { margin-top: 2px; }
.add_put { margin-top: 2px; }