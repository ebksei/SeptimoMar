<?php
	require_once(dirname(__FILE__)."/../clases/JWT.php");

	define("KEY","CLAVE_SECRETA");
	define("ENCRYPT", "['HS256']");
	define("DURACION" , (60*60)); //Duración de la validez del token

	//Genera un token a través de los parámetros proporcionados
	function generarToken($idUsuario,$nombre,$nombreUsuario,$rol,$correo){
		$tiempo = time();

		$data = array(
			'iat' => $tiempo,
			'exp' => $tiempo + DURACION,
			'data' =>[
				'id' => $idUsuario,
				'nombre' => $nombre,
				'nombreUsuario' => $nombreUsuario,
				'rol' => $rol,
				'correo' => $correo
			]
		);

		$token = JWT::encode($data, KEY);

		return $token;
	}

	//Comprueba si el token pasado por parámetro es válido
	function comprobarToken($token){
		$acierto = false;

		try{
			if($token != 'notValid'){
				$data = JWT::decode($token, KEY, array(ENCRYPT));
				$acierto = true;
			}
		} catch(Exception $e){
		}

		return $acierto;
	}

	// Intenta recuperar el token de las cabeceras o de POST. Devuelve null si no lo consigue.
	function recuperarToken(){
		$token = null;
		$headers = apache_request_headers();
		$obj = $_POST;
		
		if($headers && isset($headers['token'])){
			$token = $headers['token'];
		} else if(isset($headers['Token'])){
			$token = $headers['Token'];
		} else if(isset($obj['token'])){
			$token = $obj['token'];
		} else if(isset($obj['Token'])){
			$token = $obj['Token'];
		}
		return $token;
	}

	function recuperarDeToken($variable){
		$token = recuperarToken();
		$valor = null;
		try{
			$data = JWT::decode($token, KEY, array(ENCRYPT));
			$valor = $data->data->$variable;
		} catch(Exception $e){
		}

		return $valor;
	}

	// Recupera el rol del token. Si hay algún error al decodificar el token devuelve null.
	function getRol($token){
		$rol = null;

		try{
			$data = JWT::decode($token, KEY, array(ENCRYPT));
			$rol = $data->data->rol;
		} catch(Exception $e){
		}

		return $rol;
	}

	function getNombre($token){
		$nombre = null;
		try{
			$data = JWT::decode($token, KEY, array(ENCRYPT));
			$nombre = $data->data->nombre;
		} catch(Exception $e){
		}

		return $nombre;
	}
