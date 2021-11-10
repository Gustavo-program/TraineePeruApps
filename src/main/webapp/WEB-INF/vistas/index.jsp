<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    
     <!-- VALIDACIONES Y JQUERY -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/global.js"></script>
 	
	
       
 	<!-- bootstrap -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.css" />

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"></script>    
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
	      
    <link rel="shortcut icon" href="img/logo.png">
    
    <title>Inicio</title>
</head>
<body>
    <div class="cerrar">
        <div class="cerrar2">
            <a href="logout"><button type="button" class="btn-close" aria-label="Close"></button></a>
            
        </div>
    </div>
    <hr>
    <div class="logo">
        <img src="img/logotipo.svg" alt="">
    </div>
    <hr>
   
	<a href="verRegistroCliente" class="btn btn-outline-secondary">Crear Usuario</a>
	<br>

    <div class="container"><br>
        <div class="row align-items-start">
            <div class="table-responsive">
                <table id="id_table" class="table table-hover table-light table-striped text-center table-bordered">

                                    
						<thead class="table-dark">
							<tr class="text-center">
					
								<th style="width: 5%">ID</th>
								<th style="width: 20%">Nombre Completo</th>
								<th style="width: 15%">Correo</th>
								<th style="width: 15%">Fecha de Nacimiento</th>
								<th style="width: 10%">Edad</th>
								<th style="width: 5%">Editar</th>
								<th style="width: 5%">Eliminar</th>		
								
							</tr>
						</thead>
						<tbody>
						
						
						
						
						</tbody>
                                    
					</table>
            </div>
        </div>
    </div>
    
    
    
    
    
                   <!-- MODAL PARA ACTUALIZAR CLIENTES -->

<div class="modal fade" id="id_modal_actualiza" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">EDITAR DATOS</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="padding-bottom:100px;">
      
      <form id="form-act" method="post" enctype="multipart/form-data">
                        
                <div class="container-fluid px-4 d2">
                    <div class="row">
                    
                        <div class="col-lg-4 col-md-6 portfolio-item">
                              <img src="img/fondo.jpg"  class="img-reg" alt="...">
                          </div>
                          
                        <div class="col-lg-8 col-md-6 portfolio-item">
                          <div class="card-body">
                            
                            <!-- id de cliente -->
                            <input class="form-control" id="id_cliente" name="idCliente" maxlength="8" type="hidden"/>
                            
                                <div class="form-group mt-3">
                                	<label>Nombres completos</label>
                                    <input type="text" class="form-control" name="nombre" id="id_nombre" placeholder="Nombres Completos" required>
                                  </div>
                                  <div class="form-group mt-3">
                                  	<label>Correo</label>
                                    <input class="form-control" name="correo" id="id_correo" placeholder="Correo" required>
                                  </div>

                                  <div class="form-group mt-3">
                                  	<label>Contraseña</label>
                                    <input class="form-control" name="password" id="id_password" placeholder="Contraseña" required type="password">
                                  </div>

                                  <br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="inputState" class="form-label">Fecha de Nacimiento</label>
                                            <input  type="date" name="fechaNacimiento" id="id_fecha" class="form-control">
                                        </div>
                                    </div>
                                  <br>
                                  <br>
                                  
                              
                          </div>
                        </div>
                    </div>
                </div>
                
                
                </form>
	  
	  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="id_btn_actualiza">Actualizar</button>
      </div>
    </div>
  </div>
</div>
    
    

<script type="text/javascript">


window.onload=function listar(){
	$.getJSON("listaClientes", function (listado){
		agregarGrilla(listado);
	});
	
}





/* METODO PARA ACTUALZAR*/    
$("#id_btn_actualiza").click(function(e){
e.preventDefault();

var validator = $('#form-act').data('bootstrapValidator');
	validator.validate();

if (validator.isValid()) {
  
  var formData=new FormData();
  
  
  
  
  formData.append("idCliente", $("#id_cliente").val());
  formData.append("nombre", $("#id_nombre").val());
  formData.append("correo", $("#id_correo").val());
  formData.append("password", $("#id_password").val());
  formData.append("fechaNacimiento", $("#id_fecha").val());
  
  
  
  $.ajax({
    type: "POST",
    url: "actualizaCliente", 
    data: formData,
   
    contentType: false,
    processData: false,
    cache: false,
    success: function(data){
  	  agregarGrilla(data.lista);
  	  mostrarMensaje(data.MENSAJE);
  	  
  	  limpiar();
  	  validator.resetForm();
  	  
  	$('#id_modal_actualiza').modal("hide");
    },
    error: function(){
  	  mostrarMensaje(MSG_ERROR);
    }
  });
  
  return false;
};
return false;	
});


function limpiar(){				

	
	$("#id_nombre").val('');
	$("#id_correo").val('');	
	$("#id_password").val('');
	$("#id_fecha").val(' ');

}


<!-- EDITAR DATOS DE CLIENTES -->
function editar(idCliente,nombre,correo,password,fechaNacimiento){	
	
	$('#id_cliente').val(idCliente);
	$('#id_nombre').val(nombre);
	$('#id_correo').val(correo);
	$('#id_password').val(password);
	$('#id_fecha').val(fechaNacimiento);

	
	$('#id_modal_actualiza').modal("show");

}

function calcularEdad(fecha) {
    var hoy = new Date();
    var cumpleanos = new Date(fecha);
    var edad = hoy.getFullYear() - cumpleanos.getFullYear();
    var m = hoy.getMonth() - cumpleanos.getMonth();

    if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
        edad--;
    }

    return edad;
}



$('#id_modal_actualiza').on('hide.bs.modal', function (e) {
	var validator = $('#form-act').data('bootstrapValidator');
    validator.validate();
	
    validator.resetForm();
    limpiar();
	
});


//ELIMINAR

function eliminar(id){	
	mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminar,null,id);
}


function accionEliminar(id){	
	  $.ajax({
	        type: "POST",
	        url: "eliminaCliente", 
	        data: {"id":id},
	        success: function(data){
	      	  agregarGrilla(data.lista);
	      	  mostrarMensaje(data.mensaje);
	        },
	        error: function(){
	      	  mostrarMensaje(MSG_ERROR);
	        }
	   });
	}	    	    	



function agregarGrilla(lista){
  	 $('#id_table').DataTable().clear();
  	 $('#id_table').DataTable().destroy();
  	 $('#id_table').DataTable({
  			data: lista,
  			searching: false,
  			ordering: true,
  			processing: false,
  			responsive: true,
  			pageLength: 5,
  			lengthChange: false,
  			language: {
  		        "decimal": "",
  		        "emptyTable": "No hay información",
  		        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
  		        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
  		        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
  		        "infoPostFix": "",
  		        "thousands": ",",
  		        "lengthMenu": "Mostrar _MENU_ Entradas",
  		        "loadingRecords": "Cargando...",
  		        "processing": "Procesando...",
  		        "search": "Buscar:",
  		        "zeroRecords": "Sin resultados encontrados",
  		        "paginate": {
  		            "first": "Primero",
  		            "last": "Ultimo",
  		            "next": "Siguiente",
  		            "previous": "Anterior"
  		        }
  		    },
  			 
  			columns:[
  				{data: "idCliente"},
  				{data: "nombre"},
  				{data: "correo"},
  				{data: "fechaNacimiento"},
  				
  				{data: function(row, type, val, meta){
					var salida = calcularEdad(row.fechaNacimiento);
						
					return salida;
				},className:'text-center'},
  				{data: function(row, type, val, meta){
  					var salida='<button class="table-btn-crud" id="botoneditar" data-bs-toggle="modal" data-bs-target="#id_modal_actualiza" onclick="editar(\''+row.idCliente + '\',\'' + row.nombre + '\',\'' + row.correo+ '\',\'' +row.password+ '\',\'' +row.fechaNacimiento+ '\')" ><i class="bi bi-pencil"></i></button>';
  					
  				    <!--var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="eliminar(\'' + row.idAlumno + '\')">Eliminar</button>';-->
  					return salida;
  				},className:'table-sm m-5 table-borderless  caption-top'},
  				{data: function(row, type, val, meta){
  					var salida='<button class="table-btn-crud" id="botoneditar"  onclick="eliminar(\''+row.idCliente +'\')" ><i class="bi bi-trash"></i></button>';
  					
  				    <!--var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="eliminar(\'' + row.idAlumno + '\')">Eliminar</button>';-->
  					return salida;
  				},className:'table-sm m-5 table-borderless  caption-top'},	
  				
  			]                                     
  	    });
  	 
  	 
  	 $('#id_table').removeClass('dataTable');
  	 //$('#id_table').removeClass('dataTable');
  	 
  	 $("#id_table").removeAttr("style");
  	 
  	
  }


$('#form-act').bootstrapValidator({
	  message: 'This value is not valid',
	  feedbackIcons: {
	      valid: 'glyphicon glyphicon-ok',
	      invalid: 'glyphicon glyphicon-remove',
	      validating: 'glyphicon glyphicon-refresh'
	  },
	  fields: {
	  	nombre: {
	  		selector : '#id_nombre',
	          validators: {
	              notEmpty: {
	                  message: 'El nombre es un campo obligatorio'
	              },
	              stringLength :{
	              	message:'El nombre es de 2 a 100 caracteres',
	              	min : 2,
	              	max : 100
	              }
	          }
	      },
	      
	      correo : {
				selector : '#id_correo',
				validators : {
					notEmpty : {
						message : 'Ingrese su correo electrónico'
					},
					emailAddress : {
						message : 'El correo no es válido'
					}
				}
			},
			 password : {
					selector : '#id_password',
					validators : {
						 notEmpty: {
			                  message: 'Ingrese su contraseña'
			              },
			              stringLength :{
			              	message:'La contraseña es de 2 a 20 caracteres',
			              	min : 2,
			              	max : 20
			              }
					}
				},
	      
	      fechaNacimiento: {
				selector: '#id_fecha',
				validators: {
					notEmpty: {
						message: '*Seleccione la fecha de Nacimiento'
					}
				}
			}
			
			
	     
	    
	     
	  }   
	});





</script>

</body>
</html>