<?php
/**
* Clinica Dental Gill & Torres
* @author Grupo #1
* @url http://Grupo #1.com/about/
**/

if(count($_POST)>0){
	$user = new MedicData();
	$category_id = "NULL";
	if($_POST["category_id"]!=""){ $category_id = $_POST["category_id"]; }
	$user->name = $_POST["name"];
	$user->category_id = $category_id;
	$user->lastname = $_POST["lastname"];
	$user->address = $_POST["address"];
	$user->email = $_POST["email"];
	$user->phone = $_POST["phone"];
	$user->add();

print "<script>window.location='index.php?view=medics';</script>";


}


?>