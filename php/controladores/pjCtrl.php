<?php

	require_once(dirname(__FILE__)."/../general/bbdd.php");
	require_once(dirname(__FILE__)."/../clases/Pj.php");

	if($accion == 'alta'){
		/*RECUPERAR DATOS*/

		/*VALIDACIÓN*/
		$personaje 			= validarPersonaje($obj['personaje']);
		$caracteristicas 	= validarCaracteristicas($obj['caracteristicas']);
		$habilidades 		= validarHabilidades($obj['habilidades']);
		$ventajas 	 		= validarVentajas($obj['ventajas']);
		$trasfondos 		= validarTrasfondos($obj['trasfondos']);

		if($personaje && $caracteristicas && $habilidades && $ventajas && $trasfondos){
			/*INSERCIÓN DE DATOS*/
			$pjId = insertar();

			/*RESPUESTA*/
			$respuesta['error'] 	= false;
			$respueste['pj'] 		= consulta('*','pj','pjId = '.$pjId);


		}else{
			$respuesta['error'] = true;
			$respuesta['mensajeError'] = 'Los datos introducidos son incorrectos.';
		}
	}
	else{
		$respuesta['error'] = true;
		$respuesta['mensajeError'] = 'La acción solicitada no existe. Por favor, póngase en contacto con un administrador.';
	}