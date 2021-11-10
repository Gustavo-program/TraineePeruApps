<!DOCTYPE html>
<html lang="es">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    
   
    <link rel="stylesheet" href="css/style.css">
    <!-- CSS only -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="shortcut icon" href="img/logo.png">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	
 	<script type="text/javascript" src="js/jquery.min.js"></script>
 	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="js/global.js"></script>
	
	
	
	<link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" /><!-- para que funcione el mensaje -->

    <title>Registrar Cliente</title>
</head>
<body>
    

    <div class="cerrar">
        <div class="cerrar2">
            <a href="verLogin"><button type="button" class="btn-close" aria-label="Close"></button></a>
            
        </div>
    </div>
    <hr>
    <div class="logo">
        <img src="img/logotipo.svg" alt="">
    </div>
    <hr>
    

    <div class="container"><br>
        <div class="row align-items-start">
            
            
            <form id="form-reg" method="post" enctype="multipart/form-data">
                        
                <div class="container-fluid px-4 d2">
                    <div class="row">
                    
                        <div class="col-lg-4 col-md-6 portfolio-item">
                              <img src="img/fondo.jpg"  class="img-reg" alt="...">
                          </div>
                          
                        <div class="col-lg-8 col-md-6 portfolio-item">
                          <div class="card-body">
                            
                                <div class="form-group mt-3">
                                    <input type="text" class="form-control" name="nombre" id="id_nombre" placeholder="Nombres Completos" required>
                                  </div>
                                  <div class="form-group mt-3">
                                    <input class="form-control" name="correo" id="id_correo" placeholder="Correo" required>
                                  </div>

                                  <div class="form-group mt-3">
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
                                  <div class="b3">
                                    <a href="verIndex"><button type="button" class="btn btn-secondary">Cancelar</button></a>  
                                    <button type="submit" class="btn btn-primary" id="id_registrar">Guardar</button>    
                                  </div>
                              
                          </div>
                        </div>
                    </div>
                </div>
                
                
                </form>
                


        </div>
    </div>



<script type="text/javascript">

$("#id_registrar").click(function(e){
	e.preventDefault();
	
	var validator = $('#form-reg').data('bootstrapValidator');
	validator.validate();
	
	
	if (validator.isValid()){	
	  var formData=new FormData();
	  
	  formData.append("nombre", $("#id_nombre").val());
	  formData.append("correo", $("#id_correo").val());
	  formData.append("password", $("#id_password").val());
	  formData.append("fechaNacimiento", $("#id_fecha").val());
	
	  
      $.ajax({
        type: "POST",
        url: "insertaCliente", 
        data: formData,
        contentType: false,
        processData: false,
        cache: false,
        success: function(data){
        	//window.location.href = data.inicio;
        	limpiar();
        	validator.resetForm();
        	mostrarMensaje(data.MENSAJE,data.inicio);
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





$('#form-reg').bootstrapValidator({
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