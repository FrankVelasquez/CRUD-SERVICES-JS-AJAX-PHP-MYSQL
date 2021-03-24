$(document).ready(function() {
  console.log("Jquery ready");
  
  $('#respuesta').hide();

  $('#form-iniciar').submit(function (e) {
     
     e.preventDefault();  //evita que la pagina se recargue por comportamiento
                       //por defecto del formulario
     
     //condicion para que no este vacio los datos
     if (($('#txtusuario').val()) && ($('#txtclave').val())) {
      
      //creo un objeto ue contenga los datos ingresados en el formuario
        const postData = {
            txtusuario:$('#txtusuario').val(),
            txtclave: $('#txtclave').val()
        };
      
     
        const url = 'Inicio_Control.php';
      
        //console.log(postData, url);
        
          //metodo de Jquery donde puedo agregarle en la supervariable $_POST
          //los valores cargados en el objeto postData   
          $.post(url, postData, (response) => {
                     
           //AQUI SI TODO SALE BIEN MANDO A CARGAR LA PAGINA DE SERVICIOS
               if(!response.error) {
                  
                  let user = JSON.parse(response);
                  console.log(user);

                 if (user!="") { 
                  
                    if (($('#txtusuario').val()==user[0].Nom_Usu) && ($('#txtclave').val()==user[0].Cla_usu)) {
              
                       $(location).attr('href','Servicios.php');                  
                    
                    }

                  } 
                  
                 if (user=="") {
                      
                      let plantilla = '';

                      plantilla += `
                       
                       <a href="#" class="ItemService" >Los datos son incorectos</a> `;

                      $('#respuesta').show();

                      //el ul que esta en el respuesta llamado container le paso la plantilla
                      //convertida en html
                      $('#container-sm').html(plantilla);


                  } 




               }

        
          });  

   }


  });
});