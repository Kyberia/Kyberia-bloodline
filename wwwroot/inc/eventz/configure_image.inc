<?php
    // FINAL, RUNNING ... id# 2105641
    // Comments, requests and bugs na moj mail ;) dakujem.

    function __cin_get_img_type(&$_file_i) {
        list($_mime_type, $_mime_subtype) = explode('/', $_file_i['type']);
        if ($_mime_type != 'image') return (false);

        $_img_i = getimagesize($_file_i['tmp_name']);
        switch ($_mime_subtype) {
            case 'gif':  return (($_img_i[2] == 1)?'gif':false); break;
            case 'jpeg': return (($_img_i[2] == 2)?'jpg':false); break;
            case 'png':  return (($_img_i[2] == 3)?'png':false); break;

            default: return (false); break;
        }
    }

    function __cin_create_tmp_image($_src_f, $_dest_f, $_img_t, $_img_w) {

        switch ($_img_t) {
            case 'gif': $_img_c_func = 'imagecreatefromgif'; break;
            case 'jpg': $_img_c_func = 'imagecreatefromjpeg'; break;
            case 'png': $_img_c_func = 'imagecreatefrompng'; break;

            default: return (false); break;
        }

        $_src_i  = $_img_c_func($_src_f);
        $_src_w  = imagesx($_src_i);
        $_src_h  = imagesy($_src_i);

        $_dest_w = floor($_src_w / ($_src_w / min($_src_w, $_img_w)));
        $_dest_h = floor($_src_h / ($_src_w / min($_src_w, $_img_w)));

        $_dest_i = imagecreatetruecolor($_dest_w, $_dest_h);

        imagecopyresampled($_dest_i, $_src_i, 0, 0, 0, 0, $_dest_w, $_dest_h, $_src_w, $_src_h);

        imagegif($_dest_i, $_dest_f);
        chmod($_dest_f, 0664);

        imagedestroy($src_i);
        imagedestroy($dest_i);

        return (true);
    }

    function configure_image() {
    global $error, $node;

        if (empty($_FILES['description_image'])) {
            $error = '#00: Invalid file supplied.';
            return (false);
        }

        // if is owner, find out type of the image
        if ($node['node_permission'] == 'owner') {

            if (!($_img_t = __cin_get_img_type($_FILES['description_image']))) {
                $error = '#01: Invalid file format (only JPEG, GIF & PNG are allowed)';
                return (false);
            }
	// XXX hard coded
            $_WEBROOT_PATH     = realpath(dirname(__FILE__).'/../..');
            $_PROCESS_IMG_PATH = $_WEBROOT_PATH.'/process-img'; 

            $_required_dims    = ($node['node_id'] == $_SESSION['user_id'])?50:NODE_IMAGE_WIDTH;
            $_prepared_fname   = sprintf('%s/prepared/%03s_%s.gif.upload', $_PROCESS_IMG_PATH, $_required_dims, $node['node_id']);
            $_nodeimg_fname    = sprintf('%s/images/nodes/%s/%s/%d.gif', $_WEBROOT_PATH, $node['node_id'][0], $node['node_id'][1], $node['node_id']);

            if (!is_uploaded_file($_FILES['description_image']['tmp_name'])) {
                $error = '#02: Invalid file upload';
                return (false);
            }

            if (!__cin_create_tmp_image($_FILES['description_image']['tmp_name'], $_nodeimg_fname, $_img_t, $_required_dims)) {
                $error = '#03: Unable to create temporary thumbnail image!';
                return (false);
            }

//            if (!move_uploaded_file($_FILES['description_image']['tmp_name'], $_prepared_fname)) {
//                $error = '#04: Error moving uploaded file!';
//                return (false);
//            }

//            chmod($_prepared_fname, 0664);
//            rename($_prepared_fname, substr($_prepared_fname, 0, -7));

        }

        return (true);
    }
?>
