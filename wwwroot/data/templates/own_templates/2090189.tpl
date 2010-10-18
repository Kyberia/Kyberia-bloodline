#ban { width: 23px; height:60px; background: #333; }
#ban object { display:none; }
#ban:hover object { display:block; margin-left:24px; }

div.b_cat div.b_item { margin:0; }

div.b_cat { border:1px solid; width: 400px; }
div.b_item { border-top:1px solid #333; }

 div.b_item { display:none; }

div.b_cat:hover { width: 100%; }
div.b_cat:hover div.b_item { display:block; }



#fix {position:fixed;height: 20px;  right: 10px; bottom:auto; bottom:10px;}

h2 {
font-size: 8pt;
font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
margin:0;
padding:0;
font-weight:normal;
display: inline;
float:left;
}

#book .panel-visible h2 {
	cursor: pointer;
}
#book .panel-hidden h2 {
	cursor: pointer;
}
#book h2:hover {
	color: #333;
}

.panel-hidden div.b_item {
	display: none;
}

.tt + div.b_cat { display:none; }
.tt + div.b_cat1 { display:none; }

div.b_cat:hover div.b_node:hover { background:#222; width:100%; }

div.b_cat:hover div.b_node:hover a:hover { color:#6dae42; }


div.b_cat1:hover div.b_node:hover { background:#222; width:100%; }
div.b_cat1:hover div.b_node:hover a:hover { color:#6dae42; }

.opt {height:13px; margin:0; position:absolute; top:0; right:50px;}
.opt a {color:#666;}
div.b_cat1:hover div.b_node:hover a.opt { color:#fff; }

.cconf { display:none; }
div.b_cat:hover .cconf { display:inline; }
