<?php function
smarty_function_get_sessions(){
    global $db,$error,$node;
    echo $_SESSION['user_id'];
    echo $_SESSION['user_name'];
    echo $_SESSION['cube_vector'];
}
?>