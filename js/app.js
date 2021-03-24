
//esta fncion se activa inmediatamente al llamar el app.js desde el index.html 
$(document).ready(function() {
  
  //llamo a la funcion para q muestre los servicios
  ViewServices();
  // Global Settings
  let edit = false;

  // Con esto verificas que tu JQUERY instalado funciona
  console.log('El Jquery esta activado!');
  

  //el Div del index llamado ResultSearch la escondemos y cuando consiga datos del 
  //servidor la muestro hide= ocultar 
  $('#ResultSearch').hide();

   //Aqui podemos salir o no de la sesion activa
    $(document).on('click', '#accion', (e) => {
           
         if(confirm('Esta seguro que desea salir?')) {
           $conn=null;
           document.location.href='./';
         }  
    });
  
     //Aqui podemos salir o no de la sesion activa
    $(document).on('click', '#buscar', (e) => {
        e.preventDefault();
        if ($('#search').val()) {  
         buscar();
        }else{
         ViewServices();

        }  
    });



   //Aqui se activa el boton que tiene el formulario para guardar o editar
  $('#FormaService').submit(function (e) {
      e.preventDefault(); //evita que la pagina se recargue por comportamiento
                          //por defecto del formulario
     
     //condicion para que no este vacio los datos
     if (($('#txtdescripcion').val()) && ($('#txtid').val()) && ($('#txtcosto').val())  ) {
      
      //creo un objeto ue contenga los datos ingresados en el formuario
        const postData = {
            txtid:$('#txtid').val(),
            txtdescripcion: $('#txtdescripcion').val(),
            txtcosto:$('#txtcosto').val()
      };
      
     let url='';
      
      if (edit==false){

           url='AddService.php';
      }

      if (edit==true){

           url='ServiceEdit.php';
      }
      
          console.log(postData, url);   
          //metodo de Jquery donde puedo agregarle en la supervariable $_POST
          //los valores cargados en el objeto postData   
          $.post(url, postData, (response) => {
          
          //console.log(response);  
              
            //aqui con este metodo de trigger reseteo el formulario
            $('#FormaService').trigger('reset');

             ViewServices(); //actualizo la tabla de los servicios a la derecha
          
          });

        
     }  


    });


 //FUNCION QUE REALIZA LA BUSQUEDA DE LOS SERVICIOS EN LA BD 
  function buscar(){
      
      //Si tiene algun valor  
      if($('#search').val()) {
        
        //le doy a esta variable lo que tecleo el usuario en el text search
        let search = $('#search').val();
         
         //metodo de jquery para hacer petivciones
        $.ajax({
          url: 'ServiceSearch.php',  // a que servidor le pedire
          data: { search: search }, // el dato q voy a enviar 
          type: 'post', //tipo de peticion
          success: function (response) { //si tiene exito
            
            if(!response.error) {
             
                          
              //Este metodo del objeto JSON convierte el string recibido 
              //por el servidor task-search.php a un objeto JSON y lo
              //almaceno en una variable 
              
              let services = JSON.parse(response);
        
              let template = ''; //como es una informacion de todas los servicios vamos a
              // crear una plantilla formando unas filas y columnas para rellenar la tabla
              //ue cree en el frontend. Uso los <TD> y los <TR> del tbody 
              services.forEach(service => {
                //aqui uso los `` para crear la tabla
                //y creo un boton para que el usuario pueda eliminar y se le 
                //identifica con una clase xq son multiples botones el id 
                // no se puede repetir
                //Y por ultimo, le agrego un atributo IdService al <tr>
                //que contiene el id en la tabla porque eso lo 
                //necesito al eliminar el servicio funcion eliminar 
              template += ` 
                      <tr IdService="${service.id}">
                      <td>${service.id}</td>
                      <td>
                      <a href="#" class="ItemService">
                        ${service.descripcion} 
                      </a> 
                      </td>
                      <td>${service.costo}</td>
                      <td>
                        
                        <button class="ServiceDelete btn btn-danger">
                         Delete 
                        </button>
                      </td>
                      </tr>
                    `
              });
            //despues que creo la plantilla se la paso al tbody "Tbservices" usando la
            //funcion html 
            $('#Tbservices').html(template);



            }
          } 
        });
      }

   }

  
  // esta funcion es para listar los datos en una tabla a la dereca
function ViewServices() {
   
    $.ajax({
      
      url: 'ServicesList.php', //la direccion o servidor q pido algo
      type: 'GET', // obtener los datos
     
      success: function(data) { //si recibo la respuesta

        console.log(data);
        //convierto la informacion a n OBJETO JSON
        const services = JSON.parse(data);
        
        let template = ''; //como es una informacion de todas los servicios vamos a
        // crear una plantilla formando unas filas y columnas para rellenar la tabla
        //ue cree en el frontend. Uso los <TD> y los <TR> del tbody 
        services.forEach(service => {
          //aqui uso los `` para crear la tabla
          //y creo un boton para que el usuario pueda eliminar y se le 
          //identifica con una clase xq son multiples botones el id 
          // no se puede repetir
          //Y por ultimo, le agrego un atributo IdService al <tr>
          //que contiene el id en la tabla porque eso lo 
          //necesito al eliminar el servicio funcion eliminar 
          template += ` 
                  <tr IdService="${service.id}">
                  <td>${service.id}</td>
                  <td>
                  <a href="#" class="ItemService">
                    ${service.descripcion} 
                  </a> 
                  </td>
                  <td>${service.costo}</td>
                  <td>
                    
                    <button class="ServiceDelete btn btn-danger">
                     Delete 
                    </button>
                  </td>
                  </tr>
                `
          });
        //despues que creo la plantilla se la paso al tbody "Tbservices" usando la
        //funcion html 
        $('#Tbservices').html(template);
      }
    });
  }

    // En mi documento vama escuchar a los elementos  le hacen click 
    //a los botones vamos a conseguir su id asociado al item para modificar 
  $(document).on('click', '.ItemService', (e) => {
      
      //solo dame de la primera propiedad los padres de ese boton 
      //osea si el boton esta en una tabla, los padres, son los td, los tr, 
      //tbody, table y asi. viendo hacia arriba
      const element = $(this)[0].activeElement.parentElement.parentElement;
      
      const id = $(element).attr('IdService');
      
      //funcion de jquery para enviar el id a mi servidor
      $.post('ServiceSingle.php', {id}, (response) => {
     
        const servicios = JSON.parse(response);
        
        $('#txtid').val(servicios.id);
        $('#txtdescripcion').val(servicios.descripcion);
        $('#txtcosto').val(servicios.costo);
        
        edit = true;
      
      });
      
      e.preventDefault();
    });


  // Con este evento del click podemos eliminar servicio seleccionada
  $(document).on('click', '.ServiceDelete', (e) => {
      
      if(confirm('Esta seguro que desea eliminar este servicio?')) {
         
        //ya que se que me trae la fila completa donde esta el botton
        //se la asigno a la variable const
        const element = $(this)[0].activeElement.parentElement.parentElement;
        
        //y aqui saco el id que contiene la fila, de la propiedad o 
        //atributo IdService
        const id = $(element).attr('IdService');
     
        //envio el id a mi servidor que me a procesar la fila
        $.post('DeleteService.php', {id}, (response) => {
          //muestro un mensaje con la informacion que recibimos
          alert(response);
          ViewServices();
        });
      }
    });


});//Document.ready();