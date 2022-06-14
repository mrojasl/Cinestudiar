<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
    <meta charset='utf-8'>
    <link rel="icon" href=
            "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
          type="image/x-icon">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Inicio-Cinestudiar</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
    <link rel="stylesheet" href="carritocomprasvacio.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="inicio_style.css">
</head>
<body background="fondo_registro.jpg">
<!-- Navbar -->
<header class="header">
    <h2>Cinestudiar</h2>
    <div class="nav">
        <a href="../Inicio_new/in_sin_sesion.html">Inicio⠀<i class="bi bi-house-fill"></i> </a>
        <a href="#"  onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Inicio de sesión⠀<i class="bi bi-person-fill"></i></a>

        <div id="id01" class="modal">

            <form class=" modal-content animate" action="/action_page.php" method="post">
                <div class=" imgcontainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                </div>
                <div class="container align-content-center w-75 mt-5 rounded">
                    <p class=" text-center" style="color: black; font-size: 40px" ><b>Iniciar sesión</b></p>
                    <label for="uname"><b>Username</b></label>
                    <input type="text" placeholder="Ingrese usuario" name="uname" required>

                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Ingrese contraseña" name="psw" required>

                    <a href="../Inicio_new/in_con_sesion.html"><button type="button" class="btn btn-success">Ingresar</button></a><br>
                    <label>
                        <input id="rememberme" type="checkbox" checked="checked" name="remember"> Recuérdame
                    </label>
                </div>

                <div class="container" style="background-color:#f1f1f1" >
                    <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancelar</button>
                    <a id="forgot" href="#" ><b>¿Olvidaste la contraseña?</b></a>
                </div>
            </form>

        </div>



        <a href="#">Registrarse⠀<i class="bi bi-book"></i></a>

    </div>
</header><br>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6">

                            <div class="p-5">

                                <div class="text-center">
                                    <a class="" href="#"><b>REGISTRO</b></a>
                                </div>
                                <br>

<<<<<<< HEAD
                                <form method="POST" class="user" action="<%=request.getContextPath()%>/UsuarioServlet?a=crear"  >
=======
                                <form class="user" action="<%=request.getContextPath()%>/UsuarioServlet?a=crear" >
>>>>>>> ad2fab7e9936de993eb18746b169818e62302b4a
                                    <!-- Nombre completo-->
                                    <label for="start">Nombre:</label>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="nombre">
                                    </div>
                                    <!-- Apellido completo-->
                                    <label for="start">Apellido:</label>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="apellido">
                                    </div>
                                    <!-- DNI--->
                                    <label for="start">DNI:</label>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" dni="dni">
                                    </div>
                                    <!-- Código-->
                                    <label for="start">Codigo:</label>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="codigoPucp">
                                    </div>
                                    <!-- Correo-->
                                    <label for="start">Correo:</label>
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user" name="correo">
                                    </div>
                                    <!-- Dirección de domicilio-->
                                    <label for="start">Direccion de domicilio:</label>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="direccion">
                                    </div>
                                    <!-- Número de Celular-->
                                    <label for="start">Numero de Celular:</label>
                                    <div class="form-group">
                                        <input type="integrity" class="form-control form-control-user"
                                             name="telefono">
                                    </div>
                                    <!-- Fecha de nacimiento-->
                                    <label for="start">Fecha de Nacimiento:</label>

                                    <input type="date" id="start" name="fechaNacimiento"
                                           value="--/--/--"
                                           min="1950-01-01" max="2003-01-01">
                                    <!-- Contraseña-->
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="exampleInputPassword" placeholder="Contraseña" name="contrasena">
                                    </div>
                                    <!-- Repetir contraseña-->
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               name="contrasena">
                                    </div>
<<<<<<< HEAD
                                    <button type="submit" class="btn btn-primary">Crear Trabajo</button>a>
=======
                                    <a href="<%=request.getContextPath()%>/UsuarioServlet" class="btn btn-primary btn-user btn-block">
                                        Crear usuario
                                    </a>
>>>>>>> ad2fab7e9936de993eb18746b169818e62302b4a
                                    <hr>
                                </form>
                                <hr>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

</body>
</html>
