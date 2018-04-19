<?php

class Invitacion{
	//Atributos
	private $id = 0;
	private $email = '';
	private $fecha = '';
	private $clave = '';
	private $invitadoPor = 0;


	private $tablaSQL = '';
	private $camposSQL = '';

	function __construct(){
		$this->tablaSQL = "invitacion";
		$this->camposSQL = "email, fecha, clave, invitadoPor";
	}

	function rellenar($camposInvitacion){
		/* TODO */
	}

	function cargar($id){
		$condicion = "id = ".$id;
		$resultado = consulta($this->camposSQL,$this->tablaSQL, $condicion);

		if($resultado === false){
			$exito = false;
		} else{
			$this->id 				= $id;
			$this->email 			= $resultado['email'];
			$this->fecha 			= $resultado['fecha'];
			$this->clave			= $resultado['clave'];
			$exito = true;
		}

		return $exito;
	}

	function cargarPorEmail($email){
		$condicion = "email LIKE '".$email."'";
		$resultado = consulta('idInvitacion,'.$this->camposSQL,$this->tablaSQL, $condicion);

		if($resultado === false){
			$exito = false;
		} else{
			$this->id 				= $resultado['idInvitacion'];
			$this->email 			= $resultado['email'];
			$this->fecha 			= $resultado['fecha'];
			$this->clave			= $resultado['clave'];
			$exito = true;
		}

		return $exito;
	}

	function getId(){
		return $this->id;
	}

	function getEmail(){
		return $this->email;
	}

	function getFecha(){
		return $this->fecha;
	}

	function getClave(){
		return $this->clave;
	}

	function getInvitadoPor(){
		return $this->invitadoPor;
	}

	function setId($id){
		$this->id = $id;
	}

	function setEmail($email){
		$this->email = $email;
	}

	function setFecha($fecha){
		$this->fecha = $fecha;
	}

	function setClave($clave){
		$this->clave = $clave;
	}

	function setInvitadoPor($invitadoPor){
		$this->invitadoPor = $invitadoPor;
	}

	function eliminar(){
		borrar($this->tablaSQL, "idInvitacion = ".$this->id);
	}

}