/* ----- BOOKMARKS ----- */
div.b_cat div.b_item { margin:0; }

div.b_cat {
	border-width: 1px 1px 1px 7px;
	border-style: solid;
	border-color: #008000;
	width: 400px;
	padding: 2px 0 2px 4px;
}
div.b_item {
	border-top: 1px solid #FFF;
	padding: 4px;
}

div.b_item {
	display: none;
	_display: block;
}

div.b_cat:hover { width: 666px; }
div.b_cat:hover div.b_item { display: block; }

div.b_cat:hover div.b_node:hover { background: #333; width: 100%; }
div.b_cat:hover div.b_node:hover a:hover { color: #6DAE42; }

h2 {
	font-size: 8pt;
	font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
	margin: 0;
	padding: 0;
	font-weight: normal;
	display: inline;
	float: left;
}

.tt + div.b_cat { display: none; }

.b_friend img {
	float: left;
}
input[type='checkbox'] {background: #000; color: #008000; border: 1px solid #008000;}