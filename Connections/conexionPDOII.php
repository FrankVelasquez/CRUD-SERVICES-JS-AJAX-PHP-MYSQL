<?php


$server = "localhost";
$username = "root";
$password = "123456";
$dbname = "bd_taller_mecanico";

// Create connection
try{
   $conn = new PDO("mysql:host=$server;dbname=$dbname","$username","$password");
   $conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
   die('No hubo conexion a la base de datos');
}
?>