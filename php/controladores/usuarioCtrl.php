<?php

	require_once(dirname(__FILE__)."/../general/bbdd.php");
	require_once(dirname(__FILE__)."/../clases/Hash.php");
	require_once(dirname(__FILE__)."/../clases/Usuario.php");
	require_once(dirname(__FILE__)."/../clases/Invitacion.php");

	if( $accion == 'listar' ){

		$sql = 'SELECT id, username FROM usuario';

		$respuesta['usuarios'] = consulta( '', '', '', $sql);
		$respuesta['error']    = ($respuesta['usuarios'] === false);
	}
	else if( $accion == 'alta' ){

		$camposInvitacion = array(
			'email' => $obj['usuario']['email'],
			'clave' => $obj['clave']
		);
		$invitacionValidada = validarInvitacion($camposInvitacion);

		if($invitacionValidada){
			$invitacion = new Invitacion();

			if($invitacion->cargarPorEmail($invitacionValidada['email'])){

				if($invitacion->getClave() == $invitacionValidada['clave']){

					$obj['usuario']['administrador'] = 0;
					$usuarioValidado = validarUsuario($obj['usuario']);

					if($usuarioValidado){

						$usuario = new Usuario();

						if($usuario->rellenar( $usuarioValidado)){

							$invitacion->eliminar();

							/*TO DO: incluir Token */

							$respuesta['idUsuario'] = $usuario->getId();
							$respuesta['error'] = false;

						} else{
							$respuesta['error'] = true;
							$respuesta['mensajeError'] = 'Error interno al crear el usuario. Póngase en contacto con un administrador.';		
						}
					} else{
						$respuesta['error'] = true;
						$respuesta['mensajeError'] = 'Los datos introducidos son incorrectos.';		
					}

				} else{
					$respuesta['error'] = true;
					$respuesta['mensajeError'] = 'La clave introducida es incorrecta.';					
				}
			} else{
				$respuesta['error'] = true;
				$respuesta['mensajeError'] = 'El email introducido no corresponde a ningún usuario invitado.';
			}
		}else{
			$respuesta['error'] = true;
			$respuesta['mensajeError'] = 'Los datos introducidos son incorrectos.';
		}
	}
	else if( $accion == 'existe' ){

		$respuesta['existe'] = existeRegistro($obj['campo'], $obj['valor'], $obj['opcion']);
	}

	else{
		$respuesta['error'] = true;
		$respuesta['mensajeError'] = 'La acción solicitada no existe. Por favor, póngase en contacto con un administrador.';
	}