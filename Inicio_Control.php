<?php 
 
  require_once ('Connections/conexionPDOII.php');
  //si presiono el boton de aceptar
  

     //AQUI PONGO EN PRACTICA UN POCO DE SEGURIDAD PARA QUE NO HAGAN INYECCIONES SQL 
		

   		 $usuario=trim($_POST['txtusuario']);
	     $clave=$_POST['txtclave'];

		 $consulta = $conn->prepare("SELECT * FROM tbusuario WHERE Nom_Usu=:user and Cla_usu=:pwr");
         
         $consulta->bindValue(':user', (string)$usuario, PDO::PARAM_STR);
	     $consulta->bindValue(':pwr', (string)$clave, PDO::PARAM_STR);
       	 
       	 $consulta->execute();
         $consulta->setFetchMode(PDO::FETCH_ASSOC);
 
		/* comprobar si el servidor sigue vivo */
	    if(!($consulta)) { // No existe el usuario registrado
	          //libero memoria   
	          $conn=null;
		      $consulta=null;

	          die('Fallo la consulta');
	         
		}
		
		 $json = array();
         while($row= $consulta->fetch()){ 
		         $json[] = array(
				      'Nom_Usu' => $row['Nom_Usu'],
				      'Cla_usu' => $row['Cla_usu']
			    );
		 };

		  $jsonstring = json_encode($json);
		  echo $jsonstring;
    

?>