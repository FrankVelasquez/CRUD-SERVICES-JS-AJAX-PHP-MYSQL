
<?php
  include ("ClaseServicios.php");
  
    
    $id= $_POST['id'];
   
    $servicio = new Servicio ($id, "", ""); 
       //Creo una instancia de la clase Clientes 
       //Y le asigno los valores que voy a insertar mediante la clase
    $servicio->delete(); //aqui solo llamo a ejecutar la f
    
?>