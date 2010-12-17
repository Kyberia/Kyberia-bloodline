function stswitch() {
   document.forms[0].submit();
}

submenuTimer = false;
timer = 500;

var IE = document.all?true:false
if (!IE) document.captureEvents(Event.MOUSEMOVE)
document.onmousemove = getMouseXY;
var tempX = 0
var tempY = 0

function getMouseXY(e) {
  if (navigator.userAgent.indexOf("Konqueror")!=-1) {  // grab the x-y pos.s if browser is Konqueror
    tempX = e.clientX
    tempY = e.clientY
  } else if (IE) { // grab the x-y pos.s if browser is IE
    tempX = event.clientX + document.body.scrollLeft
    tempY = event.clientY + document.body.scrollTop
  } else {  // grab the x-y pos.s if browser is NS
    tempX = e.pageX
    tempY = e.pageY
  }
  if (tempX < 0){tempX = 0}
  if (tempY < 0){tempY = 0}
  return true
}

function sm(name,id,node) {
   var t = tempY - 10;
   var l = tempX - 10;

   var cnt = "";
   cnt += "<a href='/id/" + id + "' title='" + name + "' class='panel_btn'>userinfo</a>";
   cnt += "<form action='/id/24' method='post'>";
   cnt += "<input type='hidden' value='" + name + "' name='mailto'>";
   cnt += "<input type='submit' value='posta' value='posta' class='panel_btn'></form>";
   cnt += "<form action='/id/" + node +"' method='post'>";
   cnt += "<input type='hidden' name='node_content' value='" + name + "'>";
   cnt += "<input type='hidden' name='search_type' value='user'>";
   cnt += "<input type='submit' name='template_event' value='filter_by' class='panel_btn'></form>";

   if (p) {
      p.innerHTML = cnt;
      p.style.top = t + "px";
      p.style.left = l + "px";
      p.style.display = "block";
   }
}

function sm_mail(name,id,node) {
   var t = tempY - 10;
   var l = tempX - 10;

   var cnt = "";
   cnt += "<a href='/id/" + id + "' title='" + name + "' class='panel_btn'>userinfo</a>";
   cnt += "<a href='javascript:chngto('" + name + "','" + id + "')' class='panel_btn'>posta</a>";
   cnt += "filter_by";
   cnt += "<form action='/id/" + node +"' method='post'>";
   cnt += "<input type='hidden' name='node_content' value='" + name + "'>";
   cnt += "<input type='submit' name='search_type' value='mail_from' class='panel_btn'>";
   cnt += "<input type='submit' name='search_type' value='mail_to' class='panel_btn'>";
   cnt += "<input type='hidden' name='template_event' value='filter_by'></form>";

   if (p) {
      p.innerHTML = cnt;
      p.style.top = t + "px";
      p.style.left = l + "px";
      p.style.display = "block";
   }
}

function hideSubmenu() {
	submenuTimer = setTimeout("hideSubmenu2()", timer);
}

function hideSubmenu2() {
   if (p) {
      p.style.display = "none";
   }
}

function km() {
   if (submenuTimer) {
      clearTimeout(submenuTimer);
   }
}