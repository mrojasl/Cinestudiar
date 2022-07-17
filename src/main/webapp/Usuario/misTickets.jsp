

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BPerfil" %>
<%@ page import="com.example.cinestudiar.beans.BUsuarioFuncion" %>

<%@ page import="com.example.cinestudiar.daos.ProfesionalesDao" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.example.cinestudiar.beans.BProfesional" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="usuarioFunciones" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BUsuarioFuncion>" />

<% ProfesionalesDao profesionalesDao = new ProfesionalesDao() ;%>

<html style="position:relative;min-height: 100%;padding-bottom: 160px">
<head>
    <meta charset="UTF-8">
    <title>Mis Tickets</title>

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
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

</head>



<body class="d-flex flex-column min-vh-100">


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
        width: 160px;
        height: 160px;
        align-items: center;
        justify-content: center;
        border: rgba(213, 8, 8, 0.2);

        border-radius: 50%;

        position: absolute;
        bottom: -20px;
        left: calc(50% - 35px);
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
    .seccion-perfil-usuario .perfil-usuario-nuevo{
        width: 95%;
        position: relative;
        background-color: #fff;
        max-width: 1200px;
        border-radius: 15px;
        padding: 1.5rem 2rem;

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
<jsp:include page="headerSesionIniciada.jsp">
    <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
</jsp:include>
<section class="seccion-perfil-usuario">


    <div class="perfil-usuario-body">
        <br>
        <br>
        <div class="perfil-usuario-bio">
            <h1 class="titulo" type ="button">Mis tickets</h1>
        </div>

    </div>

    <div class="perfil-usuario-nuevo">


                <table id="tablax" class="table table-striped table-hover">

                    <thead>
                    <tr>
                        <th scope="col">Imagen</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Sede</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Hora</th>
                        <th scope="col"># Tickets</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Calificar</th>
                    </tr>
                    </thead>

                    <tbody>
                    <% for (BUsuarioFuncion funciones: usuarioFunciones){ %>
                        <tr>

                            <td scope="row">  <img class="crop" src="${pageContext.request.contextPath}/Image?action=peliculas&id=<%=funciones.getIdpelicula()%>" alt="poster_movie" width="60px" height="90px"/></td>

                            <td><p style="font-size: 20px;margin-top: 20px"><%=funciones.getNombrepelicula()%></p></td>
                            <td><p style="font-size: 18px;margin-top: 20px"><%=funciones.getSede()%> </p></td>
                            <td><p style="font-size: 18px;margin-top: 20px"><%=funciones.getFechapelicula()%> </p></td>
                            <td><p style="font-size: 18px;margin-top: 20px"><%=funciones.getHorapelicula()%> </p></td>
                            <td><p style="font-size: 18px;margin-top: 20px" align="center"><%=funciones.getCantidadtickets()%> </p></td>

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
                            <td><button type="button" class="btn btn-danger" style="margin-top: 20px" disabled>Caducado
                            </button></td>
                            <td> <a type="button" class="btn btn-info" href="<%=request.getContextPath()%>/calificacion?historial=<%=funciones.getHistorialcompra()%>&nombre=<%=funciones.getNombrepelicula()%>"style="margin-top: 20px"> Calificar </a></td>
                            <%} else if (diff < 0) {%>
                            <td><button type="button" class="btn btn-success" style="margin-top: 20px" disabled>Vigente
                            </button></td>
                            <td><p style="font-size: 17px;margin-top: 15px" align="left">Aún no<br> disponible</p></td>

                            <%} else {
                                /*System.out.println(date1 + " is equal to " + date2);*/
                                if(diff2 > 0) {%>

                            <td><button type="button" class="btn btn-danger" style="margin-top: 20px" disabled>Caducado
                            </button></td>
                            <td> <a type="button" class="btn btn-btn btn-info" href="<%=request.getContextPath()%>/calificacion?historial=<%=funciones.getHistorialcompra()%>&nombre=<%=funciones.getNombrepelicula()%>"style="margin-top: 20px;"> Calificar </a></td>

                            <%} else if (diff2 < 0) {%>

                            <td><button type="button" class="btn btn-success" style="margin-top: 20px" disabled>Vigente
                            </button></td>
                            <td><p style="font-size: 17px;margin-top: 15px" align="left">Aún no<br> disponible</p></td>

                            <%}%>
                            <%}%>


                        </tr>
                    <% } %>
                    </tbody>
                </table>



    </div>
    <br>

    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
    </script>
    <!-- DATATABLES -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
    </script>
    <!-- BOOTSTRAP -->
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
    </script>
    <script>
        $(document).ready(function () {
            $('#tablax').DataTable({
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Agrupar de _MENU_ items",
                    info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu busqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
                scrollY: 400,
                lengthMenu: [ [3, 8, -1], [3, 8, "All"] ],
            });
        });
    </script>
</section>


<br><br>
<footer class="mt-auto" style="background-color: #D6D7DA;position: relative;bottom: 0;width: 100%">
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