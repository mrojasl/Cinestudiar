<%@ page import="com.example.cinestudiar.beans.BPerfil" %>
<%@ page import="com.example.cinestudiar.beans.BUsuarioFuncion" %><%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.Collections" %>



<jsp:useBean id="perfilDusuario" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPerfil>" />
<jsp:useBean id="usuarioFunciones" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BUsuarioFuncion>" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cinestudiar</title>
    <!--link-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--link-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel = "icon" href =
            "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
          type = "image/x-icon">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link href="header_style.css" rel="stylesheet">

</head>
<body>
<jsp:include page="cabecera_usuario.jsp"/>

</body>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinestudiar</title>

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
        width: 180px;
        height: 180px;
        align-items: center;
        justify-content: center;
        border: 7px solid #FFFFFF;
        background-color: #DFE5F2;
        border-radius: 50%;
        box-shadow: 0 0 12px rgba(0, 0, 0, .2);
        position: absolute;
        bottom: -40px;
        left: calc(50% - 90px);
        z-index: 1;
    }

    .seccion-perfil-usuario .perfil-usuario-avatar img {
        width: 120%;
        position: relative;
        border-radius: 100%;
    }

    .seccion-perfil-usuario .perfil-usuario-avatar .boton-avatar {
        position: absolute;
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

<section class="seccion-perfil-usuario">

    <div class="perfil-usuario-header">

        <div class="perfil-usuario-portada">

            <div class="perfil-usuario-avatar">

                <% for (BPerfil foto: perfilDusuario){ %>
                <img class="mb-4" src="${pageContext.request.contextPath}/Image?id=<%=foto.getCodigopucp()%>" alt="">

                <button type="button" class="boton-avatar">
                    <i class="far fa-image"></i>
                </button>
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
                <label>05/04/2001</label>
                <li><i class="icono fas fa-user-check"></i> Contraseña:</li>
                <form method="POST" action="<%=request.getContextPath()%>/PerfildeUsuario?a=actualizarcon">
                    <div class="input-group mb-3">
                        <input type="hidden" name="codigopuke" value="<%=perfil.getCodigopucp()%>" />
                        <input type="password" class="form-control" name="contranueva" id="contranueva"value="<%=perfil.getContrasenha()%>">
                        <button class="btn btn-outline-secondary" type="submit" >Actualizar</button>
                    </div>
                </form>
                <% } %>

            </ul>
        </div>
        <br>
        <br>
        <div class="perfil-usuario-bio">
            <h3 class="titulo" type ="button">Mis tickets</h3>
        </div>

    </div>
    <div id="general">
        <br>
        <div class="supbarblue row">

            <div class="input-group mb-3 col">
                <h5 class="col" style="padding: 14px;color: white;width: 250px">Ordenar por:</h5>
            </div>
            <div class="input-group mb-3 col">
            </div>
            <div class="input-group mb-3 col">
            </div>

            <div class="col" style="padding: 7px">
                <form method="POST" action="<%=request.getContextPath()%>/PerfildeUsuario?a=actualizarcon">
                    <div class="input-group mb-3">
                        <button class="btn btn-light" type="submit" >Más antiguos</button>
                    </div>
                </form>

            </div>
            <div class="col" style="padding: 7px">

                <form method="POST" action="<%=request.getContextPath()%>/PerfildeUsuario?a=actualizarcon">
                    <div class="input-group mb-3">
                        <button class="btn btn-light" type="submit" >Más recientes</button>
                    </div>
                </form>
            </div>
            <!--<div class="input-group mb-3 col">
                <h5 class="col" style="padding: 14px;color: white;width: 250px">Filtar por sede:</h5>
            </div>
            <div class="input-group mb-3 col"style="margin-top: 10px;height: 20px">
                <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                    <option selected>San Miguel</option>
                    <option value="1">Miraflores</option>
                    <option value="2">Surco</option>
                    <option value="3">Pueblo Libre</option>
                </select>
            </div>-->
        </div>
        <div class="topmargin">

            <div >
                <div class="supbarblack row">
                    <% Collections.reverse(usuarioFunciones); %>
                    <% for (BUsuarioFuncion funciones: usuarioFunciones){ %>

                    <div class="row">
                        <div class="input-group mb-3 col">
                            <img src="Usuario/cine.jpeg" alt="perfil foto" style="width:100px;height:100px;">
                        </div>

                        <div class="input-group mb-3 col">
                            <h6>Nombre:<br><%=funciones.getNombrepelicula()%><br><br>Fecha:<br><%=funciones.getFechapelicula()%><br><br>Cantidad de tickets:<br><%=funciones.getCantidadtickets()%></h6>
                        </div>
                        <div class="input-group mb-3 col">
                            <h6>Sede:<br><%=funciones.getSede()%> <br><br>Hora:<br><%=funciones.getHorapelicula()%></h6>
                        </div>

                        <% String[] split = funciones.getFechapelicula().split("-");
                            String[] split2 = funciones.getHorapelicula().split(":");%>
                        <%  LocalDate date1 = LocalDate.now();
                            LocalDate date2 = LocalDate.of(Integer. parseInt(split[0]), Integer. parseInt(split[1]), Integer. parseInt(split[2]));
                            LocalTime time1 = LocalTime.now();
                            LocalTime time2 = LocalTime.of(Integer. parseInt(split2[0]), Integer. parseInt(split2[1]), Integer. parseInt(split2[2]));
                            // compareTo() method
                            int diff = date1.compareTo(date2);
                            int diff2 = time1.compareTo(time2);%>

                        <% if(diff > 0) {%>
                        <div class="input-group mb-3 col">
                            <button type="button" class="btn btn-danger" style="margin-top: 30px;height: 40px" disabled>Caducado
                            </button>
                        </div>

                        <%} else if (diff < 0) {%>
                        <div class="input-group mb-3 col">
                            <button type="button" class="btn btn-success" style="margin-top: 30px;height: 40px" disabled>Vigente
                            </button>
                        </div>
                        <%} else {
                                /*System.out.println(date1 + " is equal to " + date2);*/
                            if(diff2 > 0) {%>
                            <div class="input-group mb-3 col">
                                <button type="button" class="btn btn-danger" style="margin-top: 30px;height: 40px" disabled>Caducado
                                </button>
                            </div>

                            <%} else if (diff2 < 0) {%>
                            <div class="input-group mb-3 col">
                                <button type="button" class="btn btn-success" style="margin-top: 30px;height: 40px" disabled>Vigente
                                </button>
                            </div>
                            <%}%>
                        <%}%>

                        <hr>
                    </div>

                    <% } %>


                </div>

            </div>
        </div>
    </div>
    </div>
    </div>
</section>
</body>

</html>