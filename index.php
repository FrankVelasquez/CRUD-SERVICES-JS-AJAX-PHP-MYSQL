<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Login de sistema</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/master.css" />
    <link rel="stylesheet" href="bootstrap4/css/bootstrap.min.css">
 
 </head>
  <body>

   <div class="login-box">
      
	  <img src="Imagenes/logo.png" class="avatar" alt="Avatar Image" />
      <h1>Login Aqui</h1>
      
	  <form id="form-iniciar">
       
	    <!-- Entrada de Nombre de Usuario -->
        <label for="username">Nombre de Usuario</label>
        <input type="text" id="txtusuario" placeholder="Inserte nombre de usuario" />
        
		<!-- Entrada del Password -->
        <label for="password">Contraseña</label>
        <input type="password" id="txtclave" placeholder="Indique su contraseña" />
        
        <button type="submit" id="cmdenviar" class="btn btn-primary btn-block text-center">Entrar</button>
        
        <!--para mostrar mensaje de error -->
        <div class="card-body" id="respuesta">
                  <ul id="container-sm"></ul>
        </div>
       
     </form>
     
    </div>

     <script src="bootstrap4/js/jquery.js"></script>
     <script src="js/login.js"></script>   
  
  </body>
</html>