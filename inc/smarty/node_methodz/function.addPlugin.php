<?php
        function addPlugin() {

                global $db,$error,$node, $error_messages;
                $add_plugin_id=$_POST['add_plugin_id'];

                if (!is_numeric($add_plugin_id)) {
                        $error=$error_messages['NOT_NUMERIC'];
                        return false;
                }


                $set=$db->query("select node_parent, node_system_access, node_creator, template_id, node_content, node_name from nodes where nodes.node_id='$add_plugin_id'");
                $set->next();
                $node_parent=$set->getString('node_parent');
                $node_system_access=$set->getString('node_system_access');
                $node_creator=$set->getString('node_creator');
                $node_template=$set->getString('template_id');
                $node_content=$set->getString('node_content');
                $plugin_name=$set->getString('node_name');
                $fp = fopen (SMARTY_PLUGIN_DIR."function.".$plugin_name.".php","w+");
                fwrite($fp,$node_content);
                fclose($fp);
                chown(SMARTY_PLUGIN_DIR.$plugin_name.".php","www");
                $q="update nodes set external_link='plugin://$plugin_name' where node_id='".$add_plugin_id."'";
                $db->query($q);

        //logging of every plugin for security reasons
        $params['node_creator']=UBIK_ID;
        $params['node_parent']=2019772;
        $params['node_name']="addPlugin execute: node $add_plugin_id";
        $params['node_content']="addPlugin execute: node <a href='$add_plugin_id'>$add_plugin_id</a> by user ".$_SESSION['user_name'];
        $params['node_content'].="<br />plugin_name: ".$plugin_name;
        $params['node_content'].="<br />template_id: <a href='$node_template'>".$node_template."</a>";
        $params['node_content'].="<br />node_parent: <a href='$node_parent'>".$node_parent."</a>";
        $params['node_content'].="<br />node_system_access: ".$node_system_access;
        $params['node_content'].="<br />node_creator: <a href='$node_creator'>".$node_creator."</a>";
        $params['node_content']=addslashes($params['node_content']);
        nodes::addNode($params);

                return true;
}

?>


