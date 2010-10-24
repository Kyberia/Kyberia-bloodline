body {
color: black;
text-decoration: none;
margin: 0;
background-color: white;
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
background-color: white;
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
color: black;
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
color: black;
text-decoration: none;
font-weight: bold;
text-align: center;
font: 8pt Tahoma,sans-serif;
}


.bordered {
border: 2px solid #6DAE42;
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

.header input {
margin:0;
padding:0;
width: 8pt;
height: 8pt;
background: #444; /* len opera */
border: 1px solid #000; /* len opera */
color: #000;
opacity: 0.8;
}

.important {
font-weight: bold;
text-align: center;
}

.most_important {
font-weight: bold;
color: red;
size:70%;
}

.important_y { color: red; display: block; font-size: 2em; margin: .67em 0 }
.important_n { color: green; display: block; font-size: 2em; margin: .67em 0 }

/* userlisty a podobny sajrajt ----------------------------------------- */

.active_user_img {
float: left;
width: 50px;
margin: 0 3px 3px 0;
_margin-bottom:0;
}

.active_user_img img { margin:0; padding:0; width: 50px; height:50px; border:0; }

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

/* thread -------------------------------------------------------------- */

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

.th_content img {
max-width: 560px; /* loliik[= */
}

/* form ---------------------------------------------------------------- */
input {
color: white;
background-color: black;
vertical-align: middle;
border: solid 1px #6DAE42;
height: 18px;
font: 8pt Tahoma,sans-serif;
}


input.small {
color: white;
background-color: transparent;
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
background-color: transparent;
border: 1px solid black;
color: white;
}

textarea.node_content {
width: 800px;
height: 666px;
background-color: transparent;
color: black;
}

textarea.small {
width: 90%;
height: 42px;
background-color: transparent;
overflow: hidden;
font-color: black;
color: black;
}

.controls { margin-top:3px; }
.controls input { margin-right: 2px; }

.toolbar { margin: 2px 0;}
.toolbar input { margin-right: 2px; }

.add_put { margin-top: 3px; }


/* mejl ---------------------------------------------------------------- */

#mail_form { margin-bottom:10px }
#mail_form .controls { margin-top:2px; }
.message .header { padding:0.2em }


/* friend hilight [zatim len v blogs] ---------------------------------- */
.hilight {
background-color: #222;
}
.hilight .header {
background-color: #555;
}


/* user panel ---------------------------------------------------------- */
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