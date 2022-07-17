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
<html style="position:relative;min-height: 100%;padding-bottom: 160px">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
    <meta charset='utf-8'>

    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Registrarse-Cinestudiar</title>

    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>


    <style>

        a {
            text-decoration: none !important;
        }

        @font-face { font-family: "Akzidenz-Grotesk"; src: url('<%=request.getContextPath()%>/Imagenes/akzidenz.otf'); }
    </style>

    <jsp:include page="/Usuario/headerSesionNoIniciada.jsp"/>

</head>
<body onload="disabledButton()" class="d-flex flex-column min-vh-100">
<!-- Navbar -->

<%if (session.getAttribute("indicador2").equals("error")){%>



<div class="alert alert-info alert-dismissible fade show" role="alert">
    <i class="bi bi-info-circle-fill"></i> Registrado con Éxito!!, ahora puedes loguearte dando click a "iniciar sesion"
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%session.removeAttribute("indicador2");%>
<%}%>

<%if (session.getAttribute("indicador").equals("error")){%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <i class="bi bi-exclamation-triangle-fill"></i> Error al registrarse: El código o el correo PUCP que se han ingresado ya se encuentran registrados.
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%session.removeAttribute("indicador");%>
<%}%>



<br>
<br>
<br>

<section class="vh-100 bg-image">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="card-body p-5">
                            <div class="text text-center mb-5">
                                <i class="bi bi-people fa-3x me-3" style="color: #0e0e6b;"></i>
                                <span class="h1 fw-bold mb-0" STYLE="font-family: Akzidenz-Grotesk">Crea una cuenta<hr></span>

                            </div>

                            <form class="user" method="POST" action="<%=request.getContextPath()%>/registro?action=añadir" enctype="multipart/form-data" >

                                <!-- Nombre completo-->
                                <div class="form-outline mb-4">

                                    <input type="text" placeholder="Nombre"  style="" class="form-control" id="nombre" name="nombre" pattern="^[a-zA-Z][\sa-zA-Z]*" title="Ingrese solo letras" required="required">

                                </div>
                                <!-- Apellido completo-->
                                <div class="form-outline mb-4">

                                    <input type="text" placeholder="Apellido" class="form-control form-control-user" pattern="^[a-zA-Z][\sa-zA-Z]*" title="Ingrese solo letras" id="apellidos"
                                           name="apellido" required="required">

                                </div>
                                <!-- DNI--->
                                <div class="form-outline mb-4">

                                    <input type="text" placeholder="DNI" class="form-control" id="exampleDNI" name="dni" pattern="[0-9]{8}" title="Debe ingresar 8 dígitos numericos" required="required" maxlength="8" >

                                </div>
                                <!-- Código-->
                                <div class="form-outline mb-4">

                                    <input type="text" placeholder="Codigo PUCP" class="form-control" id="exampleCodigo" pattern="[0-9]{8}" title="Debe ingresar 8 dígitos numericos" required="required" name="codigo_pucp" maxlength="8" >

                                </div>
                                <!-- Correo-->
                                <div class="form-outline mb-4">
                                    <input type="email" placeholder="Correo" class="form-control form-control-user" id="exampleInputEmail"  name="correo" title="Debe ingresar un correo válido" required="required">

                                </div>
                                <!-- Dirección de domicilio-->
                                <div class="form-outline mb-4">
                                    <input type="text" placeholder="Dirección" class="form-control form-control-user" id="exampleFirstName"  name="direccion" pattern="^[a-zA-Z0-9][\sa-zA-Z0-9]*" title="Ingrese direccion válida"required="required">

                                </div>
                                <!-- Número de Celular-->
                                <div class="form-outline mb-4">
                                    <input type="text" placeholder="Celular" class="form-control form-control-user" id="exampleInputNumber"  name="telefono" pattern="[0-9]*" minlength="9" maxlength = "9" title="Debe ingresar 9 dígitos numericos" required="required">

                                </div>
                                <!-- Fecha de nacimiento-->
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="start">Fecha de nacimiento &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                                    <input type="date" id="start" name="fecha_nacimiento" required="required"
                                           value="--/--/--"
                                           min="1980-01-01" max="2005-12-31">

                                </div>
                                <!-- Foto-->
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="start">Foto (opcional) &nbsp;&nbsp; </label>
                                    <input type="file" name="picture">
                                </div>

                                <!-- Contraseña-->
                                <div class="form-outline mb-4">

                                    <input type="password" placeholder="Contraseña" onkeyup='check();' class="form-control form-control-user" pattern="(?=.*\d)(?=.*[A-Z])(?=.*?[#?!@$%^&*-]).{3,}" title="La contraseña debe tener, como mínimo, una mayúscula, un número y un carácter especial (#?!@$%^&*-)"
                                           id="exampleInputPassword" name="password" required="required">

                                </div>

                                <!-- Confirmar Contraseña-->
                                <div class="form-outline mb-4">
                                    <input type="password" placeholder="Confirmar contraseña" onkeyup='check();' class="form-control form-control-user"
                                           id="confirmPassword"  name="confirmPassword" required="required">

                                </div>
                                <span id='message'></span>






                                <div id="ocultocontra"> </div>
                                <!--<button type="submit" class="btn btn-primary" >Crear Usuario</button>-->
                                <hr>





                                <p  class="text-center text-muted mt-5 mb-0">¿Ya tienes una cuenta? <a style="text-decoration: none" href="<%=request.getContextPath()%>/loguin"
                                                                                                      > <span style="color:rgba(1,86,224,0.82)">Ingresa aquí</span>    </a></p>



                            </form>
                        </div>
                    </div>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </div>
</section>


<script>

    var disabledButton=function (){
        document.getElementById('ocultocontra').innerHTML = '<button class="btn btn-dark btn-lg btn-block" type="submit" role="button" disabled>Registrarse</button>';
    }

    var check = function() {
        if ((document.getElementById('exampleInputPassword').value ==
            document.getElementById('confirmPassword').value) && document.getElementById('exampleInputPassword').value!="") {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'Las contraseñas coinciden';
            document.getElementById('ocultocontra').innerHTML = '<button class="btn btn-dark btn-lg btn-block" type="submit" role="button">Registrarse</button>';

        } else if ((document.getElementById('exampleInputPassword').value !=
            document.getElementById('confirmPassword').value)) {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'Las contraseñas no coinciden';
            document.getElementById('ocultocontra').innerHTML = '<button class="btn btn-dark btn-lg btn-block" type="submit" role="button" disabled>Registrarse</button>';
        }
        else if ((document.getElementById('exampleInputPassword').value ==
            "") || (document.getElementById('confirmPassword').value=="")) {
            document.getElementById('message').innerHTML = '';
            document.getElementById('ocultocontra').innerHTML = '<button class="btn btn-dark btn-lg btn-block" type="submit" role="button" disabled>Registrarse</button>';
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
<br><br><br><br><br><br><br>
<footer class="mt-auto" style="background-color: #D6D7DA;position: relative;bottom: -160px;width: 100%">
    <div class="container"  style="background-color: #D6D7DA">
        <%--            <div class="d-flex justify-content-start"><p class="text-muted">© 2022 Proyecto CinEstudiar</p></div>--%>
        <div class="d-flex bd-highlight">
            <div class="p-2 flex-grow-1 bd-highlight"><img style="width: 320px;height: 95px"  src="${pageContext.request.contextPath}/Imagenes/footer_logo.png"></div>
            <div class="p-2 bd-highlight"><p style="margin-top: 30px;margin-left: -40px" class="text-muted">© 2022 Proyecto CinEstudiar</p></div>
        </div>

    </div>
</footer>

</body>
</html>
