<?php

function transport_load($transport) {
	require_once(TRANSPORT_DIR.$transport.'.inc');
}

