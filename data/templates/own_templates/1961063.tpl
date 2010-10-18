function register() {

global $db,$error;
$user_info=AddSlashes($_POST['user_info']);
$email=AddSlashes($_POST['email']);
$password1=$_POST['password1'];
$password2=$_POST['password2'];
$login=AddSlashes($_POST['login']);
$node_content=AddSlashes($_POST['user_info']);

$set=$db->query("select * from users where login='$login'");
if($set->getNumRows()>0) {
global $error;
$error="user with $login already registered";
return false;
}
elseif($password1!=$password2) {
global $error;
$error="passwords do not match";
return false;
}
elseif(strlen($password1)<6) {
global $error;
$error="password too short";
return false;
}
elseif(empty($user_info)) {
global $error;
$error="please write something about Thee";
return false;
}
elseif(empty($email)) {
global $error;
$error="please enter your email address";
return false;
}
elseif((strpos($email, '@') === false) || (strpos($email, '@') == '0') || (strpos($email, '@') >= (strlen($email) - 4))) {

global $error;
$error="please enter correct mail";
return false;
}
/*
if (!empty($_POST['cube_vector'])) {
$q = "insert into nodes set external_link='db://user',node_creator='$id',node_name='$login',node_external_access='yes',node_system_access='public',node_parent='$parent',node_vector='$vector', template_id='7'";
$db->query("insert into nodes set external_link='db://user',node_creator='$id',node_name='$login',node_external_access='yes',node_system_access='public',node_parent='$parent',node_vector='$vector', template_id='7'");
$last_id=$db->getLastInsertId();
$db->query("insert into node_content set node_content='$node_content',node_id='$last_id'");

$q="INSERT INTO users set user_status='waiting',user_id='$last_id',login='$login'";
$node_content=nodes::processContent($user_info);
if (!empty($email)) $q.=", email='$email'";
$q.=",password='".md5($password1)."'";
if (!empty($user_icq)) $q.=", icq='$user_icq' ";
if (!empty($user_www)) $q.=", www='$user_www' ";
if (!empty($user_ad)) $q.=", user_ad='$user_ad' ";
$q.=",cube_vector='".$_POST['cube_vector']."'";
$db->query($q);
}

*/
$id=ubik::ubikRegister();
$db->query("insert into nodes set external_link='db://user',node_name='$login',
node_external_access='yes',node_system_access='public',
node_parent='$parent',node_vector='$vector', template_id='7'");
$last_id=$db->getLastInsertId();
$db->query("insert into node_content set node_content='$node_content',node_id='$last_id'");
$db->query("update nodes set node_creator='$last_id' where node_id='$last_id'");
$q="INSERT INTO users set user_id='$last_id',login='$login'";
$node_content=nodes::processContent($user_info);
if (!empty($email)) $q.=", email='$email'";
$q.=",password='".md5($password1)."'";
$db->query($q);




echo "<p>Access granted.</p>";
die();
}




?>

