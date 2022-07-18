<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="perfilDusuario" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPerfil>" />

<%@ page import="com.example.cinestudiar.beans.BPerfil" %>
<%@ page import="java.net.URL" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mi perfil</title>
    <!--link-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel = "icon" href =
            "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
          type = "image/x-icon">


    <link href="header_style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

</head>



<body>

<style type="text/css">
    /*=====================================
    estilos
    =====================================*/

    .navbar{
        position: relative;
        width: 100%;
        padding: 20px 10px;
        background-color: #003f9e;
    }
    .navbar img{
        width:300px;
        height:80px;
    }
    .navbar a{
        position: relative;
        color:white;
        text-decoration: none;
        margin-right: 18px;
    }
    .navbar a[id=forgot]{
        position: relative;
        left:65%;
        color: #78261f;
        text-decoration: none;
    }

    body {
        background-color: #3C3C41FF;
    }
    header{
        background-color: #003f9e;
        width: auto;
        height: 11vh;
        color: white;
    }
    header h2{
        position: absolute;
        left: 10%;
        top:4%;
    }
    .elementos{
        position: absolute;
        left: 25%;
    }
    .elementos a{
        position: relative;
        left:65%;
        top:0%;
        color:white;
        text-decoration: none;
        margin-right: 5px;
    }
    .administrador{
        background-color: #7e7878;
        width: auto;
        height: 6vh;
    }
    .administrador h3{
        position: absolute;
        color: #ece9e9;
        left: 50%;
    }
    html {
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
        text-size-adjust: 100%;
        line-height: 1.4;
    }
    .nav b{
        position: relative;
        left:25%;
        text-decoration: none;
        margin-right: 10px;
    }

    * {
        margin: 0;
        padding: 0;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    body {
        color: #404040;
        font-family: "Arial", Segoe UI, Tahoma, sans-serifl, Helvetica Neue, Helvetica;
    }

    /*=====================================
    estilos de la utilidad

    =====================================*/
    .seccion-perfil-usuario .perfil-usuario-body,
    .seccion-perfil-usuario {
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
        align-items: center;
    }

    .seccion-perfil-usuario .perfil-usuario-header {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-bottom: 1.25rem;
    }

    .seccion-perfil-usuario .perfil-usuario-portada {
        display: block;
        position: relative;
        width: 90%;
        height: 17rem;

        border-radius: 0 0 20px 20px;

    }

    .seccion-perfil-usuario .perfil-usuario-portada .boton-portada {
        position: absolute;
        top: 1rem;
        right: 1rem;
        border: 0;
        border-radius: 8px;
        padding: 12px 25px;
        background-color: rgba(0, 0, 0, .5);
        color: #fff;
        cursor: pointer;
    }

    .seccion-perfil-usuario .perfil-usuario-portada .boton-portada i {
        margin-right: 1rem;
    }

    .seccion-perfil-usuario .perfil-usuario-avatar {
        display: flex;
        width: 140px;
        height: 140px;
        align-items: center;
        justify-content: center;
        border: rgba(213, 8, 8, 0.2);

        border-radius: 50%;

        position: absolute;
        bottom: 20px;
        left: calc(50% - 20px);
        z-index: 1;
    }

    .seccion-perfil-usuario .perfil-usuario-avatar img {
        width: 120%;
        position: relative;
        border-radius: 100%;
    }

    .seccion-perfil-usuario .perfil-usuario-avatar .boton-avatar {
        position: relative;
        left: -2px;
        top: -2px;
        border: 0;
        background-color: #fff;
        box-shadow: 0 0 12px rgba(0, 0, 0, .2);
        width: 45px;
        height: 45px;
        border-radius: 50%;
        cursor: pointer;
    }

    .seccion-perfil-usuario .perfil-usuario-body {
        width: 70%;
        position: relative;
        max-width: 750px;
    }

    .seccion-perfil-usuario .perfil-usuario-body .titulo {
        display: block;
        width: 100%;
        font-size: 1.75em;
        margin-bottom: 0.5rem;
    }

    .seccion-perfil-usuario .perfil-usuario-body .texto {
        color: #848484;
        font-size: 0.95em;
    }

    .seccion-perfil-usuario .perfil-usuario-footer,
    .seccion-perfil-usuario .perfil-usuario-bio {
        display: flex;
        flex-wrap: wrap;
        padding: 1.5rem 2rem;
        box-shadow: 0 0 12px rgba(0, 0, 0, .2);
        background-color: #fff;
        border-radius: 15px;
        width: 100%;
    }

    .seccion-perfil-usuario .perfil-usuario-bio {
        margin-bottom: 1.25rem;
        text-align: center;
    }

    .seccion-perfil-usuario .lista-datos {
        width: 50%;
        list-style: none;
    }

    .seccion-perfil-usuario .lista-datos li {
        padding: 5px 0;
    }

    .seccion-perfil-usuario .lista-datos li>.icono {
        margin-right: 1rem;
        font-size: 1.2rem;
        vertical-align: middle;
    }


    .supbarblue{
        background-color: #003f9e;
        height: 50px;
    }
    .supbarblack{
        background-color: #3C3C41FF;
        position: relative;
        height: 1600px;
        width: 1000px;
    }
    .topmargin{
        margin-top: 30px;
        color: white;
    }

    .container {
        width: 200px;
        height: 200px;
        overflow: hidden;
        margin: 10px;
        position: relative;
    }
    .container > .crop {
        position:absolute;
        left: -100%;
        right: -100%;
        top: -100%;
        bottom: -100%;
        margin: auto;
        min-height: 100%;
        min-width: 100%;
    }
    /* adactacion a dispositivos */
    @media (max-width: 750px) {
        .seccion-perfil-usuario .lista-datos {
            width: 100%;
        }

        .seccion-perfil-usuario .perfil-usuario-portada,
        .seccion-perfil-usuario .perfil-usuario-body {
            width: 95%;
        }

    }
</style>
<jsp:include page="cabecera_admin.jsp">
    <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
</jsp:include>
<% int puerto=request.getLocalPort();%>
<section class="seccion-perfil-usuario">

    <div class="perfil-usuario-header">

        <div class="perfil-usuario-portada">

            <div class="perfil-usuario-avatar">

                <% for (BPerfil foto: perfilDusuario){ %>

                <%String contextpath= request.getContextPath() ;%>
                <%String stringcode=foto.getCodigopucp(); %>
                <% String rutaImagen="http://localhost:"+puerto+contextpath+"/Image?action=usuarios&id="+stringcode;%>

                <% URL url=new URL(rutaImagen);
                    int cant=url.openConnection().getContentLength();%>

                <% if (cant==0 || cant==1291){ %>

                <img src="Imagenes/sin_foto.png" />
                <%}%>
                <% if (cant!=0 && cant!=1291){ %>
                <img class="crop" src="${pageContext.request.contextPath}/Image?action=usuarios&id=<%=foto.getCodigopucp()%>"/>
                <% }%>



                <form method="POST" action="<%=request.getContextPath()%>/PerfildeUsuario?a=actualizarfoto" enctype="multipart/form-data">
                    <div class="input-group mb-3">
                        <input type="hidden" name="codigopuke" value="<%=foto.getCodigopucp()%>" />
                        <input type="file" class="form-control btn-sm" name="fotonueva" id="fotonueva" accept=".jpg,.jpeg,.png" onchange="validateFileType()" required>
                        <button class="btn btn-secondary btn-sm" type="submit" >Actualizar</button>
                    </div>
                </form>


                <% } %>
            </div>


        </div>
    </div>
    <div class="perfil-usuario-body">
        <div class="perfil-usuario-bio">
            <h3 class="titulo">Mi perfil</h3>
        </div>
        <div class="perfil-usuario-footer">
            <ul class="lista-datos">
                <% for (BPerfil perfil: perfilDusuario){ %>
                <li><i class="icono fas fa-user-check"></i> Nombre y apellido:</li>

                <label><%=perfil.getNombre()%></label>

                <li><i class="icono fas fa-map-signs"></i> Codigo PUCP:</li>
                <label><%=perfil.getCodigopucp()%></label>

                <li><i class="icono fas fa-phone-alt"></i> Telefono:</li>
                <form method="POST" action="<%=request.getContextPath()%>/PerfildeUsuario?a=actualizartel">
                    <div class="input-group mb-3">
                        <input type="hidden" name="codigopuke" value="<%=perfil.getCodigopucp()%>" />
                        <input type="tel" class="form-control" name="numerotelefonico" id="numerotelefonico"  pattern="[0-9]{9}" title="9 dígitos" value="<%=perfil.getNumero()%>">
                        <button class="btn btn-outline-secondary" type="submit" >Actualizar</button>
                    </div>
                </form>
                <li><i class="icono fas fa-building"></i> DNI:</li>
                <label><%=perfil.getDni()%></label>

            </ul>
            <ul class="lista-datos">
                <li><i class="icono fas fa-map-marker-alt"></i> Direccion:</li>
                <form method="POST" action="<%=request.getContextPath()%>/PerfildeUsuario?a=actualizardir">
                    <div class="input-group mb-3">
                        <input type="hidden" name="codigopuke" value="<%=perfil.getCodigopucp()%>" />
                        <input type="text" class="form-control" name="direccionnueva" id="direccionnueva"  pattern=".{5,}" title="Direccion válida" value="<%=perfil.getDireccion()%>">
                        <button class="btn btn-outline-secondary" type="submit" >Actualizar</button>
                    </div>
                </form>
                <li><i class="icono fas fa-briefcase"></i> Correo:</li>
                <label><%=perfil.getCorreo()%></label>
                <li><i class="icono fas fa-calendar-alt"></i> Fecha nacimiento:</li>
                <label><%=usuario.getFechaNacimiento()%></label>
                <li><i class="icono fas fa-user-check"></i> Contraseña:</li>

                <button class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#demo1" aria-expanded="false">Actualizar Contraseña</button>
                <form method="POST" action="<%=request.getContextPath()%>/PerfildeUsuario?a=actualizarcon">

                    <div id="demo1" class="collapse">

                        <input type="hidden" name="codigopuke" value="<%=perfil.getCodigopucp()%>" />
                        <input type="hidden" id="antiguacontra" value="<%=perfil.getContrasenha()%>">

                        <input type="password" onkeyup='checkAntiguacontra();' name="contrasenha" id="contrasenha" class="form-control" placeholder="Ingrese la contraseña anterior" required="required"
                               title="La contraseña contiene, como mínimo, una mayúscula, un número y un carácter especial (#?!@$%^&*-)">

                        <input type="password" onkeyup='checkAntiguacontra();' required="required" placeholder="Ingrese la contraseña nueva" class="form-control" name="contranueva" id="contranueva" pattern="(?=.*\d)(?=.*[A-Z])(?=.*?[#?!@$%^&*-]).{3,}" title="La contraseña nueva debe contener, como mínimo, una mayúscula, un número y un carácter especial (#?!@$%^&*-)" >

                        <input type="password" onkeyup='checkAntiguacontra();' required="required" placeholder="Repita la contraseña nueva" class="form-control" name="confirmapassword" id="confirmapassword" pattern="(?=.*\d)(?=.*[A-Z])(?=.*?[#?!@$%^&*-]).{3,}" title="La contraseña nueva debe contener, como mínimo, una mayúscula, un número y un carácter especial (#?!@$%^&*-)" >



                        <span id='message'></span>
                        <div id="ocultocontra"> </div>



                    </div>







                </form>
                <% } %>

            </ul>
        </div>
        <br>
        <br>
        <br>
        <br>

    </div>



</section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--link-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
</body>

<script>

    var checkAntiguacontra = function() {
        var pruebas= CryptoJS.SHA256(document.getElementById('contrasenha').value);

        if ( (
            pruebas==document.getElementById('antiguacontra').value) && (document.getElementById('contranueva').value == document.getElementById('confirmapassword').value)) {
            document.getElementById('ocultocontra').innerHTML = '<button type="submit" class="btn btn-info ">Cambiar contraseña</button>';
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'Los datos coinciden';
        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'Los datos no coinciden';
            document.getElementById('ocultocontra').innerHTML = '<button type="submit" class="btn btn-info  " disabled>Cambiar contraseña</button>';
        }
    }
</script>
<script type="text/javascript">
    function validateFileType(){
        var fileName = document.getElementById("fotonueva").value;

        var idxDot = fileName.lastIndexOf(".") + 1;
        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
        if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){

        }else{
            alert("(Error) Selecciona un archivo de imagen!");
        }
    }
</script>
</html>