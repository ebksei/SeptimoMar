<?php

	/* CARGA DE DEPENDENCIAS */
	require_once("./general/autenticacion.php");
	require_once("./general/validacion.php");

	/* INICIALIZACIÓN DE VARIABLES */
	$respuesta = array();

	$pruebas = true;
	if($pruebas){
		/*$personaje = array(
			'nombre' 			=> "Kreion",
			'apodo' 			=> "El erudito",
			'concepto' 			=> "",
			'reputacion'		=> "",
			'riqueza'			=> 0,
			'heridasDramaticas'	=> 0,
			'avatar'			=> '',
			'vivo'				=> true,
			'idVirtud'			=> 0,
			'idHibris'			=> 0,
			'idReligion'		=> 0,
			'idPais'			=> 0
		);

		$trasfondos = array();
		$trasfondos[0] = '0';
		$trasfondos[1] = '1';

		$caracteristicas = array(
			'musculo'	=> 2,
			'mana'		=> 2,
			'brio'		=> 2,
			'ingenio'	=> 2,
			'donaire'	=> 2
		);

		$habilidades = array(
			'apuntar'			=> 0,
			'armas'				=> 2,
			'atletismo'			=> 2,
			'conocimiento'		=> 2,
			'convencer'			=> 2,
			'empatia'			=> 2,
			'equitacion'		=> 2,
			'esconder'			=> 2,
			'interpretar'		=> 2,
			'intimidar'			=> 3,
			'navegacion'		=> 0,
			'pelear'			=> 0,
			'percepcion'		=> 1,
			'robar'				=> 4,
			'tacticasDeGuera'	=> 1,
			'tentar'			=> 2
		);

		$ventajas = array();
		$ventajas[0] = 0;
		$ventajas[1] = 1;
		$ventajas[2] = 5;*/


		$obj = array();
		$obj['controlador'] = 'usuario';
		$obj['accion'] = 'alta';		

		$obj['clave'] = 'A1B2';
		$usuario = array(
			'nick' => 'Aleks',
			'email' => 'erdnussbulle@hotmail.es',
			'pass'	=> 'Contra123'
		);
		$obj['usuario'] = $usuario;	
		/*$obj['personaje'] = $personaje;
		$obj['trasfondos'] = $trasfondos;
		$obj['caracteristicas'] = $caracteristicas;
		$obj['habilidades'] = $habilidades;
		$obj['ventajas'] = $ventajas;*/

	}else{
		$obj = $_POST;
	}


	$controlador = $obj['controlador'];
	$accion = $obj['accion'];

	$existeControlador = file_exists('./controladores/'.$controlador.'Ctrl.php');
	if($existeControlador){
		/* AUTENTICACIÓN Y PERMISOS */
		$idConectado = recuperarIdUsuarioConectado();
		$tienePermiso = comprobarPermiso($idConectado, $controlador, $accion);

		if($tienePermiso){
			/* CARGA DE CONTROLADOR ESPECÍFICO */
			require_once('./controladores/'.$controlador.'Ctrl.php');
		} else{
			$respuesta['error'] = true;
			$respuesta['mensajeError'] = 'No se tienen permisos para la acción solicitada.';
		}
	} else{
		$respuesta['error'] = true;
		$respuesta['mensajeError'] = 'No existe el controlador solicitado. Póngase en contacto con un administrador.';
	}


	/* RESPUESTA */

	echo  json_encode($respuesta);

?>