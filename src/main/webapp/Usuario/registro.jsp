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


<jsp:useBean id="usuarionolog" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>



<!DOCTYPE html>
<html style="position:relative;min-height: 100%;padding-bottom: 160px">

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
    <meta charset='utf-8'>

    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Registrarse-CinEstudiar</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <style>
        html {
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100%;
        }

        footer {
            margin-top: auto;
        }
        a {
            text-decoration: none !important;
        }

        @font-face { font-family: "Akzidenz-Grotesk"; src: url('<%=request.getContextPath()%>/Imagenes/akzidenz.otf'); }
    </style>

    <jsp:include page="/Usuario/headerSesionNoIniciada.jsp"/>

</head>
<body onload="disabledButton()" class="d-flex flex-column min-vh-100">


<!-- VALIDACIONES -->
<% if (session.getAttribute("errorNombre") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%=session.getAttribute("errorNombre")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorNombre");%>
<%}%>

<% if (session.getAttribute("errorApellido") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">

        <%=session.getAttribute("errorApellido")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorApellido");%>
<%}%>

<% if (session.getAttribute("errorDni") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%=session.getAttribute("errorDni")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorDni");%>
<%}%>

<% if (session.getAttribute("errorCodigo") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%=session.getAttribute("errorCodigo")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorCodigo");%>
<%}%>

<% if (session.getAttribute("errorEmail") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%=session.getAttribute("errorEmail")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorEmail");%>
<%}%>

<% if (session.getAttribute("errorDireccion") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%=session.getAttribute("errorDireccion")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorDireccion");%>
<%}%>

<% if (session.getAttribute("errorCel") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%=session.getAttribute("errorCel")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorCel");%>
<%}%>

<% if (session.getAttribute("errorNacimiento") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%=session.getAttribute("errorNacimiento")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorNacimiento");%>
<%}%>

<% if (session.getAttribute("errorContra") != null){%>
<div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%=session.getAttribute("errorContra")%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%session.removeAttribute("errorContra");%>
<%}%>







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
        <div class="container h-100" >
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 1rem;position: relative;" align="center">
                        <div class="card-body p-5">
                            <div class="text text-center mb-5">
                                <i class="bi bi-people fa-3x me-3" style="color: #0e0e6b;"></i>
                                <span class="h1 fw-bold mb-0" STYLE="font-family: Akzidenz-Grotesk">Crea una cuenta<hr></span>

                            </div>

                            <form class="user" method="POST" action="<%=request.getContextPath()%>/registro?action=añadir" enctype="multipart/form-data" >

                                <!-- Nombre completo-->

                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="Este campo no acepta números ni caracteres especiales, excepto ( '- ç ,etc  ). Puede escribir un máximo de 45 caracteres. "><i class="bi bi-info-circle-fill"></i> Nombre: </div>

                                        <input type="text" placeholder="Nombre"  style="" class="form-control" id="nombre" name="nombre"  title="Ingrese su nombre"  maxlength="45" required>
                                    </div>
                                </div>

                                <!-- Apellido completo-->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="Este campo no acepta números ni caracteres especiales, excepto ( '- ç ,etc  ). Puede escribir un máximo de 45 caracteres. "><i class="bi bi-info-circle-fill"></i> Apellido: </div>
                                        <input type="text" placeholder="Apellido" class="form-control form-control-user" required title="Ingrese su apellido" id="apellidos" maxlength="45"
                                               name="apellido" >
                                    </div>
                                </div>
                                <!-- DNI--->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="Ingrese su DNI de 8 dígitos."><i class="bi bi-info-circle-fill"></i> DNI: </div>
                                        <input type="text" placeholder="DNI" class="form-control" id="exampleDNI" required name="dni" minlength="8"  maxlength="8" >

                                    </div>
                                </div>
                                <!-- Código-->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="Ingrese su codigo PUCP de 8 dígitos."><i class="bi bi-info-circle-fill"></i> Código PUCP: </div>
                                        <input type="text" placeholder="Codigo PUCP" class="form-control" id="exampleCodigo" required minlength="8"  maxlength="8" title="Debe ingresar 8 dígitos numericos"  name="codigo_pucp"  >
                                    </div>
                                </div>
                                <!-- Correo-->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="Ingrese su correo PUCP. Formato: email@ejemplo.com"><i class="bi bi-info-circle-fill"></i> Correo: </div>
                                        <input type="text" placeholder="Correo" class="form-control form-control-user" required  id="exampleInputEmail"  name="correo" title="Debe ingresar un correo válido" maxlength="45" >
                                    </div>

                                </div>
                                <!-- Dirección de domicilio-->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="Ingrese su direccion.Puede escribir un máximo de 45 caracteres."><i class="bi bi-info-circle-fill"></i> Correo: </div>
                                        <input type="text" placeholder="Dirección" class="form-control form-control-user" required id="exampleFirstName"  name="direccion" title="Ingrese direccion válida" maxlength="45">
                                    </div>

                                </div>
                                <!-- Número de Celular-->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="Ingrese su número de celular de 9 dígitos."><i class="bi bi-info-circle-fill"></i> Celular: </div>
                                        <input type="text" placeholder="Celular" class="form-control form-control-user" required minlength="9"  maxlength="9" id="exampleInputNumber"  name="telefono"  title="Debe ingresar 9 dígitos numericos" >
                                    </div>

                                </div>
                                <!-- Fecha de nacimiento-->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="Ingrese su fecha de nacimiento. Solo se permiten personas con edad mayor o igual a 15 años"><i class="bi bi-info-circle-fill"></i> Fecha de nacimiento: </div>
                                        <input style="margin-left: 40px" type="date" id="start" name="fecha_nacimiento"
                                               value="1900-05-01" required
                                               >
                                    </div>

                                </div>
                                <!-- Foto-->
                                <div hidden class="form-outline mb-4">
                                    <div class="input-group">
                                        <input hidden style="margin-left: 20px" type="file" name="picture">
                                    </div>
                                </div>

                                <!-- Contraseña-->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="La contraseña debe tener, como mínimo, una mayúscula, un número y un carácter especial (#?!@$%^&*-)"><i class="bi bi-info-circle-fill"></i> Contraseña: </div>
                                        <input type="password" placeholder="Contraseña"  class="form-control form-control-user"  title=""
                                               id="exampleInputPassword" name="password" required minlength="5" >
                                    </div>

                                </div>

                                <!-- Confirmar Contraseña-->
                                <div class="form-outline mb-4">
                                    <div class="input-group">
                                        <div class="input-group-text" data-bs-toggle="tooltip" title="La contraseña debe tener, como mínimo, una mayúscula, un número y un carácter especial (#?!@$%^&*-)"><i class="bi bi-info-circle-fill"></i> Confirmar Contraseña: </div>
                                        <input type="password" placeholder="Confirmar contraseña"  class="form-control form-control-user"
                                               id="confirmPassword"  name="confirmPassword" required minlength="5" >
                                    </div>


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
                    <br>
                    <br>
                </div>
                <br>
                <br>
            </div>
            <br>
            <br>
        </div>
    </div>
</section>


<script>

    var disabledButton=function (){
        document.getElementById('ocultocontra').innerHTML = '<button class="btn btn-dark btn-lg btn-block" type="submit" role="button" >Registrarse</button>';
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



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
</script>



<br><br><br><br><br><br><br>
<footer class="mt-auto" style="background-color: #D6D7DA;position: absolute;bottom: -38rem;width: 100%">
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
