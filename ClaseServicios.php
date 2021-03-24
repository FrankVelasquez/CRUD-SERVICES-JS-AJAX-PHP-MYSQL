
<?php 

class Servicio {
  
    private $Id;
	private $Des;
	private $Pre;
	
	//Constructor

	public function __construct($Cod, $Des, $Pre)    {
	   
	  $this->Id=$Cod;
	  $this->Des=$Des;
	  $this->Pre=$Pre;
	 
	}
 	
	
	public static function SoloId($iden){
		  return new self($iden, '','');
	}	
	
 	
	public static function ningundato(){
		  return new self('','','');
	}	
	
	   
 //Funcion para insertar datos en la tabla persona
 public function insert (){

	 require_once ("Connections/conexionPDOII.php");

	  $id=$this->Id;
	  $descrip=$this->Des;
	  $costo=$this->Pre;
	  
	  $consulta=$conn->prepare ("INSERT into tbservicios(Id,Descripcion, Costo) VALUES (:id,:descrip, :costo)");

	  $consulta->bindValue(':id', (string)$id, PDO::PARAM_STR);
	  $consulta->bindValue(':descrip', (string)$descrip, PDO::PARAM_STR);
	  $consulta->bindValue(':costo', (string)$costo, PDO::PARAM_STR);


	   $result= $consulta->execute();
       
	  //si no devolvio un resultado
		  if (!$result) 
		  	echo "Hubo un error";
		
		  else
	       echo "Excelente";
}
  
 //Funcion para actualizar datos en la tabla persona
   
	public function BusquedaParticular() {
		
		require_once ("Connections/conexionPDOII.php"); 
	    
	    $consulta = $conn->prepare("SELECT * from tbservicios WHERE Id = :id");
        $consulta->bindValue(':id', $this->Id, PDO::PARAM_STR);
  
        $consulta->execute();
			
		return($consulta);	   
	 
	} 

//Funcion que devuelve todos los registros
	public function Todo() {
		
		require_once ("Connections/conexionPDOII.php"); 
	    
	    $consulta=$conn->prepare('SELECT * FROM tbservicios ORDER BY Descripcion ASC ');
        
        $consulta->execute();
			
		return($consulta);	   
	 
	} 

    public function edit(){
	 
      require_once ("Connections/conexionPDOII.php"); 
	  $consulta = $conn->prepare( "UPDATE tbservicios SET Descripcion= :descripcion, Costo = :costo WHERE Id = :id");
	 
	  $consulta->bindValue(':id', $this->Id, PDO::PARAM_STR);
	  $consulta->bindValue(':descripcion', $this->Des, PDO::PARAM_STR);
	  $consulta->bindValue(':costo', $this->Pre, PDO::PARAM_STR);

	  $consulta->execute();
      return($consulta);

    }

	public function delete() {
	  
		require_once ("Connections/conexionPDOII.php");

		if(isset($_POST['id'])) {
		  
		//aqi hace la consulta y elimina lan tarea
		  $id = $_POST['id'];
		  
	      $consulta = $conn->prepare("DELETE FROM tbservicios WHERE Id=:id");
	      $consulta->bindValue(':id', (int)$id, PDO::PARAM_INT);
		   
		  $result= $consulta->execute();
		  
		  if (!$result) {
		    die('Fallo la operación');
		  }
	    
	      echo "Eliminado satisfactoriamente";  
        }
	}
    
}

?>