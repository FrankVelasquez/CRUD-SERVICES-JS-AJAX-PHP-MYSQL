<?php

      require_once('ClaseServicios.php');
 
      //creo una instancia de la clase Servicios
      $servicio = new Servicio ("", "", ""); 
      
      //Ejecuto la consulta
      $result=$servicio->Todo(); 

                     
       if(!$result) {
          echo "consulta fallida";
      
       }else{ 
           
            //para obtener un arreglo de datos
           $json = array();
  
           while($row= $result->fetch()){ 
            
              $json[] = array(
                'id' => $row['Id'],
                'descripcion' => $row['Descripcion'],
                'costo' => $row['Costo']
              );

           }
        }


     $consulta=null;
   
    //codifico el arreglo en JSON
     $jsonstring = json_encode($json);
     //aqui devuelvo los registros
     echo $jsonstring;

?>