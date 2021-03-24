<?php


require_once('ClaseServicios.php');

if(isset($_POST['id'])) {
  
  $id = $_POST['id'];

  //creo una instancia de la clase Servicios
  $servicio = new Servicio ($id, "", ""); 

  //Ejecuto la consulta
  $result=$servicio->BusquedaParticular();

  
  if(!$result) {
    die('La consulta falló');
  }

  //aqui creo un array 
  $json = array();
  
  //Solo lleno el array con los registrs de la busqueda 
  while($row = $result->fetch()) {
    $json[] = array(
      'id' => $row['Id'],
      'descripcion' => $row['Descripcion'],
      'costo' => $row['Costo']
    );
  }
  
  $result=null;
  //convierto el array en un objeto JSON
  $CadenaJson = json_encode($json[0]);
  echo $CadenaJson;
}

?>