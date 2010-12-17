/* tie komentare este niesu akoze naozaj [= vlastne aj toto css je taka provizooria; bo by som chcel zmenit system selektorov [aj v kode] */

/* pasteka */
body {
	color: #000;
	text-decoration: none;
	margin: 0;
	background-color: #6DAE42;
	background-position: top center;
	background-repeat: no-repeat;
	scrollbar-shadow-color: #6DAE42;
	scrollbar-highlight-color: #6DAE42;
	scrollbar-3dlight-color: #6DAE42;
	scrollbar-base-color: black;
	scrollbar-darkshadow-color: #6DAE42;
	scrollbar-track-color: black;
	scrollbar-arrow-color: black;
	font: 8pt Tahoma,sans-serif;
}

inframe {
	width: 90%;
	height: 230px;
}

td {
	wordwrap: break-word;
	font: 8pt Tahoma,sans-serif;
}


/* header [momentalne vypnute fixnutie] */
.t1 {
	position: relative;
	margin: 0;
	text-align: center;
	background-color: #000;
	top: 0%;
	width: 100%;
	height: 20px;
	right: 0;
	left: 0;
}

.t2 {
	height: 20px;
}

/* obsah nody */

#topic {
	width: 662px;
	padding: 2px;
	display: table;
}


a {
	color: white;
	text-decoration: none;
	font: 8pt Tahoma,sans-serif;
}

a:hover {
	color: red;
	text-decoration: none;
	font: 8pt Tahoma,sans-serif;
}

a.mail {
	color: red;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	font: 8pt Tahoma,sans-serif;
}

a.mail:hover {
	color: white;
	text-decoration: overline;
	font-weight: bold;
	text-align: center;
	font: 8pt Tahoma,sans-serif;
}


.bordered {
	border: solid 1pt #6DAE42;
}

.bordered2 {
	border-left: solid 1pt #6DAE42;
	border-right: solid 1pt #6DAE42;
	border-bottom: solid 1pt #6DAE42;
}


.header {
	background-color: #333;
	border-bottom: solid 1px #6DAE42;
	height: 100%;
	width: 100%;
	vertical-align: top;
	align: left;
	padding: 0pt;
}

.important {
	font-weight: bold;
	text-align: center;
}

.most_important {
	font-weight: bold;
	font-color: red;
	/*background-color: #333;*/
	color: red;
}


/* userlisty a podobny sajrajt ----------------------------------------- */

.active_user_img {
	float: left;
	width: 50px;
	margin: 0 3px 3px 0;
        _margin-bottom:0;
}

.active_user_img img { margin:0; padding:0; width: 25px; height:25px; border:0; }

.active_users .active_user_name {
	text-align: center;
}

.node_userlist {
	width: 666px;
	text-align: center;
	margin-bottom: 10px;
	position: relative;
}

.node_userlist img {
	width: 50px;
	height: 50px;
	border: 0;
	margin: 0 3px 3px 0;
}



/* form -------------------------------------------------------------- */


input {
	color: white;
	background-color: #6DAE42;
	vertical-align: middle;
	border: solid 1px #6DAE42;
	height: 18px;
	font: 8pt Tahoma,sans-serif;
}


input.small {
	color: white;
	background-color: #6DAE42;
	width: 50px;
	vertical-align: middle;
	border: solid 1px #6DAE42;
	height: 18px;
	font: 8pt Tahoma,sans-serif;
}

select {
	color: white;
	background-color: black;
	vertical-align: middle;
	border: solid 1px #6DAE42;
	height: 18px;
	font: 8pt Tahoma,sans-serif;
}

textarea {
	width: 666px;
	height: 123px;
	background-color: #6DAE42;
	border-color: #6DAE42;
	color: #000;
}

textarea.node_content {
	width: 800px;
	height: 666px;
	background-color: #6DAE42;
	border-color: #6DAE42;
	color: #000;
}

textarea.small {
	width: 90%;
	height: 42px;
	border-color: #6DAE42;
	background-color: #6DAE42;
	overflow: hidden;
	font-color: white;
	color: white;
}

.controls { margin-top:3px;  }
.controls input { margin-left: 2px; }
