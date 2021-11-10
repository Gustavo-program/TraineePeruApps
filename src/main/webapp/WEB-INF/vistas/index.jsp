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
    <title>Inicio</title>
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
   
	<a href="verRegistroCliente" class="btn btn-outline-secondary">Crear Usuario</a>
	<br>

    <div class="container"><br>
        <div class="row align-items-start">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Correo electrónico</th>
                        <th scope="col">Fecha de nacimiento</th>
                        <th scope="col">Edad</th>
                        <th scope="col">Estado</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>PE02</td>
                        <td>Mark</td>
                        <td>Mark@peru.pe</td>
                        <td>10/10/1989</td>
                        <td>32</td>
                        <td>
                            <button type="button" class="btn btn-secondary"><i class="bi bi-pencil-square"></i></button>
                            <button type="button" class="btn btn-secondary"><i class="bi bi-x-circle"></i></button>
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>PE03</td>
                        <td>Jacob</td>
                        <td>Jacob@peru.pe</td>
                        <td>23/02/1996</td>
                        <td>25</td>
                        <td>
                            <button type="button" class="btn btn-secondary"><i class="bi bi-pencil-square"></i></button>
                            <button type="button" class="btn btn-secondary"><i class="bi bi-x-circle"></i></button>
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>PE04</td>
                        <td>Jesus</td>
                        <td>Jesus@peru.pe</td>
                        <td>01/07/1990</td>
                        <td>31</td>
                        <td>
                            <button type="button" class="btn btn-secondary"><i class="bi bi-pencil-square"></i></button>
                            <button type="button" class="btn btn-secondary"><i class="bi bi-x-circle"></i></button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>
    </div>


</body>
</html>