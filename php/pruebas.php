<?php

	require_once(dirname(__FILE__)."/clases/Hash.php");
	$hash = new Hash('Contraseña');
	echo $hash->get();
