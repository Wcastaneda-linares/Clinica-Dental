<?php
class Database {
	public static $db;
	public static $con;
	
	// Cambiar el nombre del constructor
	function __construct(){
		$this->user = "root";
		$this->pass = "123";
		$this->host = "localhost";
		$this->ddbb = "citas_medicas";
	}

	function connect(){
		$con = new mysqli($this->host, $this->user, $this->pass, $this->ddbb);
		$con->query("set sql_mode=''");
		return $con;
	}

	public static function getCon(){
		if(self::$con == null && self::$db == null){
			self::$db = new Database();
			self::$con = self::$db->connect();
		}
		return self::$con;
	}
}
?>
