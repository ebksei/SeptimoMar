<?php

class Usuario{
	
	//Atributos
	private $id = 0;
	private $nick = "";
	private $email = "";
	private $pass = "";
	private $administrador = "";

	private $tablaSQL = "";
	private $camposSQL = "";

	//Constructor

	function __construct(){
		$this->tablaSQL = "usuario";
		$this->camposSQL = "nick, email, pass, administrador";
	}

	function rellenar($camposUsuario){
		$hash = new Hash($camposUsuario['pass']);
		$camposUsuario['pass'] = $hash->get();

		$this->nick 			= $camposUsuario['nick'];
		$this->email 			= $camposUsuario['email'];
		$this->pass 			= $camposUsuario['pass'];
		$this->administrador	= $camposUsuario['administrador'];

		$this->id = insertar($this->camposSQL, $camposUsuario, $this->tablaSQL);

		return $this->id;
	}

	function cargar($id){
		$condicion = "id = ".$id;
		$resultado = consulta($this->camposSQL,$this->tablaSQ, $condicion);

		if($resultado === false){
			$exito = false;
		} else{
			$this->id = $id;
			$this->nick 			= $resultado['nick'];
			$this->email 			= $resultado['email'];
			$this->pass 			= $resultado['pass'];
			$this->administrador	= $resultado['administrador'];
			$exito = true;
		}

		return $exito;
	}

	//Getters & Setters
	function getId(){
		return $this->id;
	}

	function getNick(){
		return $this->nick;
	}

	function getEmail(){
		return $this->email;
	}

	function getPass(){
		return $this->pass;
	}

	function esAdministrador(){
		return $this->administrador;
	}

	function setId($id){
		$this->id = $id;
	}

	function setNick($nick){
		$this->nick = $nick;
	}

	function setEmail($email){
		$this->email = $email;
	}

	function setPass($pass){
		$this->pass = $pass;
	}

	function setAdministrador($administrador){
		$this->administrador = $administrador;
	}

	//TODO: Modificar

}