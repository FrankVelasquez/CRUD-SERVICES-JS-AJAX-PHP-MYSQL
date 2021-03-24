<?php

include('Connections/conexionPDOII.php');//conectamos a la base de datos

$search = $_POST['search']; //gardo el dato en na variable antes de continuar

if(!empty($search)) { //si no esta vacio

  //Hago la consulta e coincida con todosn los  les parezca %
  $consulta = $conn->prepare("SELECT * FROM tbservicios WHERE Descripcion LIKE :search ");
  $consulta->bindValue(':search', (string)$search, PDO::PARAM_STR);

  $consulta->setFetchMode(PDO::FETCH_ASSOC);   
  $consulta->execute();

  //si no hay respuesta y termina el proceso
  if(!$consulta) {
    die('Error de consulta');
  }
  
  //Aqui obtuve un dato
  $json = array();

  //recorro el resltado de la conslta y creo n array json para guardar los datos y luego lo convierto en n obj json

  while($row = $consulta->fetch()) {
    
    $json[] = array(
      'id' => $row['Id'],
      'descripcion' => $row['Descripcion'],
      'costo' => $row['Costo']
    );
  }
  
  //aqui convierto el array json a un  JSON string
  $jsonstring = json_encode($json);
  echo $jsonstring; //aqui devuelvo el Json string
}
?>