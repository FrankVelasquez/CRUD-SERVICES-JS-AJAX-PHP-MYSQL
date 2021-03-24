<?php

  include ("ClaseServicios.php");
  
  if(isset($_POST['txtdescripcion'])) {
    
    $id= $_POST['txtid'];
    $descrip= $_POST['txtdescripcion'];
    $Costo= $_POST['txtcosto'];

    
    $servicio = new Servicio ($id, $descrip, $Costo); 
       //Creo una instancia de la clase Clientes 
       //Y le asigno los valores que voy a insertar mediante la clase
    $servicio->insert(); //aqui solo llamo a ejecutar la f

  }

  
?>