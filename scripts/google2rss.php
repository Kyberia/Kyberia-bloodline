<?
error_reporting(0);
// This program is public domain. Do with this what you want.
//
// Disclaimer. Don't expect this to be here, to work, or to get fixed.
// But if you have a question or comment, email: mailto:julian_bond@voidstar.com
//
// If you're using Gnews2rss you presumably find it useful.
// Please email Google (news-feedback@google.com) asking them to produce RSS
// directly out of Google News Search.
//
// And why not host it yourself to save my bandwidth costs.

// Note: This version requires curl support in your php installation

$q=$_GET['q'];

if ($q) {
  parse_html($q);
} else {
  show_form();
}

//****************
function show_form() {

  $server = getenv("SERVER_NAME");
  $request = getenv("REQUEST_URI");
?>

   <center><B>Gnews2RSS at VoidStar.com</B></center>
   <p>An experimental convertor that takes a Google News search and turns it
into RSS</p>

   <form action="<? print "http://" . $server . $request; ?>">
     <br />Number of entries to return: <select name="num">
       <option name="5">5</option>
       <option name="5">10</option>
       <option name="5" selected>15</option>
       <option name="5">20</option>
       <option name="5">25</option>
       <option name="5">50</option>
       <option name="5">75</option>
       <option name="5">100</option>
     </select>
     <br />Search Query:<input type="text" name="q" size=50>
     <br /><input type="submit" value="Create RSS">
   </form>
   <br /><b>Usage</b>:
http://www.voidstar.com/gnews2rss.php?num=number_of_items&q=your_query
   <br />
   <br /><b>Example</b>: <a
href="http://www.voidstar.com/gnews2rss.php?q=wifi+OR+WLAN+OR+80211">http://www.voidstar.com/gnews2rss.php?q=wifi+OR+WLAN+OR+80211</a>
   <br />
   <br /><b>Disclaimer</b> Don't expect this to be here, to work, or to get
fixed. But if you have a question or comment, email: <a
href="mailto:julian_bond@voidstar.com">julian_bond@voidstar.com</a></li>
   <br />
   <br /><b>Notes:</b>
   <ul>
   <li>num defaults to 15</li>
   <li>Source <a
href="http://www.voidstar.com/gnews2rss.php.txt">http://www.voidstar.com/gnews2rss.php.txt</a>
If you have access to PHP, why not run your own. </li>
   <li>Source <a
href="http://www.voidstar.com/gnews2rss.php.curl.txt">http://www.voidstar.com/gnews2rss.php.curl.txt</a>
A version using curl. </li>
   <li>If you're using Gnews2rss you presumably find it useful. Please <a
href="mailto:news-feedback@google.com">email Google</a> asking them to
produce RSS directly out of Google News Search. And why not <a
href="http://www.voidstar.com/gnews2rss.php.txt">host it yourself</a> to
save my bandwidth costs.</li>
   <li>Note: Some people have had trouble making it work on their servers
where no results seem to be found. This seems to be related to fopen(),
certain versions of php and some check that Google does.
   If you get this, read the source and try uncommenting the lines just
after the data is collected to see what google returns.
   Alternatively try the cURL version of the source, for which of course you
will need cURL support in PHP.</li>
   <li>I'm happy to talk on email about all this, but I can't get involved
in debugging your installation. Go back and read the disclaimer!</li>
   </ul>
<?
}

//****************
function parse_html($q){

  header("Cache-Control: public");

  $itemregexp = "%<a class=y href=\"(.+?)\">(.+?)<br><font size=-1><font color=#6f6f6f>(.+?)</font><br></table>%is";
  $allowable_tags = "<A><B><BR><BLOCKQUOTE><CENTER><DD><DL><DT><HR><I><IMG><LI><OL><P><PRE><U><UL>";

  $num = ($num) ? $num+1 : 16 ;

  $url =
"http://news.google.com/news?hl=en&num=$num&scoring=d&q=".urlencode($q);

  if ($fp = @fopen($url, "r")) {
    while (!feof($fp)) $data .= fgets($fp, 128);
    fclose($fp);
  }

// *******************
// Some people seem to have problems with google not returning anything
// uncomment the following lines and comment out the content-type header
// to see what google is returning.

//  print "<html>";
//  print "<pre>";
//  print htmlentities($data);
  header("Content-Type: text/xml");

  $data = strstr($data,"Sorted by date</b>");

  eregi("<title>(.*)</title>", $data, $title);
  $channel_title = $title[1];

  $match_count = preg_match_all($itemregexp, $data, $items);
  $match_count = ($match_count > 25) ? 25 : $match_count;

  $output .= "<?xml version=\"1.0\" encoding=\"iso-8859-1\" ?>\n";
  $output .= "<!-- generator=\"gnews2rss/1.0\" -->\n";
  $output .= "<!DOCTYPE rss >\n";

  $output .= "<rss version=\"2.0\">\n";
  $output .= "  <channel>\n";
  $output .= "    <title>Google News Search: $q</title>\n";
  $output .= "    <link>". htmlentities($url) ."</link>\n";
  $output .= "    <description>Google News Search: $q</description>\n";
  $output .= "    <webMaster>julian_bond@voidstar.com</webMaster>\n";
  $output .= "    <language>en-us</language>\n";
  $output .= "    <generator>&lt;a href=\"http://www.voidstar.com/gnews2rss.php\">GNews2Rss&lt;/a></generator>\n";

  $day = date("d");
  if ($day == 1 || $day == 11 || $day == 21) {
    $output .= "    <item>\n";
    $output .= "      <title>". date("d-M-y"). " Do you find Gnews2RSS useful?</title>\n";
    $output .= "      <link>http://www.voidstar.com/gnews2rss.php</link>\n";
    $output .= "      <description>If you're using Gnews2rss you presumably find it useful. Please &lt;a href=\"mailto:news-feedback@google.com\">email Google&lt;/a> asking them to produce RSS directly out of Google News Search. And why not &lt;a href=\"http://www.voidstar.com/gnews2rss.php.txt\">host it yourself&lt;/a> to save my bandwidth costs.</description>\n";
    $output .= "    </item>\n";
  }

  for ($i=0; $i< $match_count; $i++) {

    $item_url = $items[1][$i];
    $title = $items[2][$i];
    $title = strip_tags($title);
    $desc = $items[3][$i];

    $desc = eregi_replace("&nbsp;-&nbsp;.* ago</font><br>", "<br>", $desc);
    $desc = strip_tags($desc, $allowable_tags);
    $desc = htmlspecialchars($desc);

    $output .= "    <item>\n";
    $output .= "      <title>". htmlspecialchars($title) ."</title>\n";
    $output .= "      <link>". htmlspecialchars($item_url) ."</link>\n";
    $output .= "      <description>". $desc ."</description>\n";
    $output .= "    </item>\n";
  }

  $output .= "  </channel>\n";
  $output .= "</rss>\n";

  print $output;

//****************
// More debug stuff
//  print "<pre>";
//  print htmlentities($output);
//  print "</pre>";

}


?>