 <!-- uso el metodo de rejilla de bootstrap 12 columnas x cada fila -->
<div class="container">
     
  <!-- 1 fila -->
      <div class="row p-4">
    
     <!-- 5 columnas -->
        <div class="col-md-5">
          <div class="card">
            <div class="card-body">
             
              <form id="FormaService">
                
                <div class="form-group">
                  <input name="txtid" type="text"  id="txtid" placeholder="Id Servicio" class="form-control">
                </div>


                <div class="form-group">
                  <input name="txtdescripcion" type="text" id="txtdescripcion" class="form-control" placeholder="Descripción">
                </div>
                

                <div class="form-group">
                  <input name="txtcosto" id="txtcosto" type="text" class="form-control" placeholder="Costo del servicio">
                </div>


                <input type="hidden" id="IdService">
                
                <button type="submit" class="btn btn-primary btn-block text-center">
                  Guardar Servicio
                </button>
              
                
              </form>
            
            </div>
          </div>
        </div>

     <!-- + 7 columnas -->
        <div class="col-md-7">
          
          <div class="card my-4" id="ResultSearch">
            
            <div class="card-body">
                  <ul id="container"></ul>
            </div>
          
          </div>

          <table class="table table-bordered table-sm">
            <thead>
              <tr>
                <td>Id</td>
                <td>Descripcion</td>
                <td>Costo</td>
                <td>Accion</td>
              </tr>
            </thead>
            <tbody id="Tbservices"></tbody>
          </table>
        </div>
      </div>
</div>