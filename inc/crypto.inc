<?php

class crypto {

function crypto($text,$key) {
   /* Open the cipher */
   $td = mcrypt_module_open('rijndael-256', '', 'ecb', '');

   /* Create the IV and determine the keysize length */
   $iv = mcrypt_create_iv(mcrypt_enc_get_iv_size($td), MCRYPT_DEV_RANDOM);
   $ks = mcrypt_enc_get_key_size($td);

   /* Intialize encryption */
   mcrypt_generic_init($td, $key, "iv");

   /* Encrypt data */
	echo "LALALAL $iv LLALALAAL";
   $encrypted = mcrypt_generic($td, $text);

   /* Terminate encryption handler */
   mcrypt_generic_deinit($td);
   mcrypt_module_close($td);

  return $encrypted;
}


function decrypto($encrypted,$key) {
   $td = mcrypt_module_open('rijndael-256', '', 'ecb', '');

   /* Create the IV and determine the keysize length */
   $ks = mcrypt_enc_get_key_size($td);

//   $iv=substr($encrypted,0,mcrypt_get_iv_size($td));
//   $text=substr($encrypted,mcrypt_get_iv_size($td));

   mcrypt_generic_init($td, $key, "iv");

   /* Decrypt encrypted string */
   $decrypted = mdecrypt_generic($td, $encrypted);

   /* Terminate decryption handle and close module */
   mcrypt_generic_deinit($td);
   mcrypt_module_close($td);


  return $decrypted;
}


}

?>