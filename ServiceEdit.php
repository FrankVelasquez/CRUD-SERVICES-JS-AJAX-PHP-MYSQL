<?php

require_once ('ClaseServicios.php');

if(isset($_POST['txtid'])) {

  $id = $_POST['txtid']; 
  $descripcion = $_POST['txtdescripcion'];
  $costo = $_POST['txtcosto'];
  
  $servicio = new Servicio ($id, $descripcion, $costo); 

  $result=$servicio->edit();

  
  if (!$result) {
    die('Fallo la actualización');
  }
  echo "Servicio actualizado";  

}

?>