<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="indicador" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="indicador2" scope="session" type="java.lang.String" class="java.lang.String"/>





<!DOCTYPE html>
<html lang="en">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
    <meta charset='utf-8'>

    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Inicio-Cinestudiar</title>

    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>


    <style>

        .buttonswipe{
            text-align: right;
        }
        .rigthup{
            float:left;
        }
        .leftfinal{
            text-align: center;
            color: white;
        }
        .spaceleft{
            margin-left: 25px;
            color: #989898;
        }
        .leftrighttext{
            margin-left: 270px;
        }
        .leftlefttext{
            width: 200px;
            height: 20px;float: left;
        }
        .textchoosereserv{
            color: white;
            margin-left: 20px;
        }
        .centradoleftstar{
            margin-left: 105px;
        }
        .centradoleft{
            margin-left: 75px;
        }
        .buttonsize{
            width: 250px;
            height: 40px;
            margin-bottom: 10px;

        }
        .boxfuncion{
            color: white;
            text-align: center;
            background-color: #111523;
            width: 250px;
        }
        .funcionestxt{
            height: 80px;
            color: white;
            padding:20px;
            margin-left: 40px;
        }
        .sugerencia {
            background-color: #111523;
            height: 80px;
            color: white;
            text-align: center;
            padding: 20px;
        }
        .rightside{
            float: right;
            height: 1100px;
            width: 1200px;
        }
        .leftside{
            float: left;
            background-color: #012154;
            height: 1100px;
            width: 400px;
        }
        .general{
            margin: auto;
            width: 1600px;
            height: 1000px;
        }




        p.emptytxt{
            margin-top: 45px;
            font-size:20px;
            color:white;
            font-weight: bold;

        }
        /* Full-width input fields */

        input[id=rememberme]{
            font-family: Arial, Helvetica, sans-serif;
            color: #2b2e31;
            text-decoration-color: black;
        }

        /* Extra styles for the cancel button */
        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            margin-right: 5px;
            background-color: #f44336;
        }

        /* Center the image and position the close button */
        .imgcontainer {
            text-align: center;
            margin: 6px 0 3px 0;
            width: 30%;
            height: 10%;
            position: center;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
            long: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
            color: blue;
        }

        /* The Modal (background) */
        .modalh1 {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }

        /* Modal Content/Box */
        .modal-contenth1 {
            background-color: #fefefe;
            margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */
        }

        /* The Close Button (x) */
        .close {
            position: absolute;
            right: 25px;
            top: 0;
            color: #000;
            font-size: 35px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: red;
            cursor: pointer;
        }

        /* Add Zoom Animation */
        .animate {
            -webkit-animation: animatezoom 0.6s;
            animation: animatezoom 0.6s
        }

        @-webkit-keyframes animatezoom {
            from {-webkit-transform: scale(0)}
            to {-webkit-transform: scale(1)}
        }

        @keyframes animatezoom {
            from {transform: scale(0)}
            to {transform: scale(1)}
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
            .cancelbtn {
                width: 100%;
            }
        }
        button {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 4px 0;
            border: none;
            cursor: pointer;

        }


    </style>

    <jsp:include page="/Usuario/headerSesionNoIniciada.jsp"/>

</head>
<body STYLE="  background-image: url('Imagenes/fondo.jpg'); background-size: cover;" >
<!-- Navbar -->

<%if (session.getAttribute("indicador2").equals("error")){%>


<div class="d-inline-flex p-2" style="margin-top: 15px">
    <div class="alert alert-success" role="alert">Registrado con Éxito!!, ahora puedes loguearte dando click a "iniciar sesion"
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</div>


<%session.removeAttribute("indicador2");%>
<%}%>

<br>
<br>
<br>
<div class="container my-10">
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6">

                            <div class="p-5">

                                <div class="text-center">
                                    <b STYLE="color: #2f7cff;font-size: 25px">Registro de Usuario</b>
                                </div>
                                <br>

                                <style>


                                </style>

                                <form class="user" method="POST" action="<%=request.getContextPath()%>/inicio?action=añadir" enctype="multipart/form-data">







                                    <!-- Nombre completo-->
                                    <div class="form-group">
                                        <input type="text" style="" class="form-control" id="nombre" name="nombre" pattern="^[a-zA-Z][\sa-zA-Z]*"  required="required"
                                               placeholder="Nombre(Solo se permiten letras)" >

                                    </div>
                                    <!-- Apellido completo-->
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" pattern="^[a-zA-Z][\sa-zA-Z]*" id="apellidos"
                                               placeholder="Apellidos(Solo se permiten letras)" name="apellido" required="required">
                                    </div>
                                    <!-- DNI--->
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="exampleDNI" name="dni" pattern="[0-9]*" required="required" placeholder="DNI"  minlength="8" maxlength = "8">
                                    </div>
                                    <!-- Código-->
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="exampleCodigo" pattern="[0-9]*" required="required" placeholder="Código PUCP" name="codigo_pucp" minlength="8" maxlength = "8">
                                    </div>
                                    <!-- Correo-->
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Correo" name="correo" required="required">
                                    </div>
                                    <!-- Dirección de domicilio-->
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="Dirección de domicilio" name="direccion" pattern="^[a-zA-Z0-9][\sa-zA-Z0-9]*" required="required">
                                    </div>
                                    <!-- Número de Celular-->
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="exampleInputNumber" placeholder="Numero de Celular" name="telefono" pattern="[0-9]*" minlength="9" maxlength = "9" required="required">
                                    </div>
                                    <!-- Fecha de nacimiento-->
                                    <label for="start">Fecha de Nacimiento:</label>

                                    <input type="date" id="start" name="fecha_nacimiento" required="required"
                                           value="--/--/--"
                                           min="1950-01-01" max="2003-01-01">

                                    <div class="form-group">
                                        <input type="file" name="picture">
                                    </div>




                                    <!-- Contraseña-->
                                    <div class="form-group">
                                        <input type="password" onkeyup='check();' class="form-control form-control-user" pattern="(?=.*\d)(?=.*[A-Z])(?=.*?[#?!@$%^&*-]).{3,}" title="La contraseña debe tener, como mínimo, una mayúscula, un número y un carácter especial (#?!@$%^&*-)"
                                               id="exampleInputPassword" placeholder="Contraseña" name="password" required="required">
                                    </div>

                                    <!-- Confirmar Contraseña-->
                                    <div class="form-group">
                                        <input type="password" onkeyup='check();' class="form-control form-control-user"
                                               id="confirmPassword" placeholder="Confirmar contraseña" name="confirmPassword" required="required">
                                    </div>
                                    <span id='message'></span>





                                    <%if (session.getAttribute("indicador").equals("error")){%>
                                    </br>
                                    <div class="text-danger nb-2">
                                        Error código Pucp o correo!!!
                                    </div>
                                    <%session.removeAttribute("indicador");%>
                                    <%}%>
                                    <div id="ocultocontra"> </div>
                                    <!--<button type="submit" class="btn btn-primary" >Crear Usuario</button>-->
                                    <hr>
                                </form>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    var check = function() {
        if (document.getElementById('exampleInputPassword').value ==
            document.getElementById('confirmPassword').value) {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'Las contraseñas coinciden :)';
            document.getElementById('ocultocontra').innerHTML = '<button type="submit" class="btn btn-primary btn-lg">Registrarse</button>';
        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'Las contraseñas no coinciden';
            document.getElementById('ocultocontra').innerHTML = '<button type="submit" class="btn btn-primary btn-lg " disabled>Registrarse</button>';
        }
    }
</script>



<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
            crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
            crossorigin="anonymous"></script>

</body>
</html>
