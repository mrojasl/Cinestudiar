<%--
  Created by IntelliJ IDEA.
  User: 124349
  Date: 26/06/2022
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page import="com.example.cinestudiar.beans.BFuncionUsuario" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.example.cinestudiar.beans.BCarrito" %>
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="lista_profesionales" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean id="listafunciones" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BFuncionUsuario>"/>
<jsp:useBean id="pelicula" class="com.example.cinestudiar.beans.BPeliculas" scope="request" type="com.example.cinestudiar.beans.BPeliculas"/>

<jsp:useBean id="usuarioLogueado" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>

<jsp:useBean id="indicadorNologin" scope="session" type="java.lang.String" class="java.lang.String"/>





<jsp:useBean id="carritodeCliente" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BCarrito>"  />




<html style="position:relative;min-height: 100%;padding-bottom: 160px">
    <head>
        <meta charset='utf-8'>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png" type="image/x-icon">
        <title>Detalles de Pelicula-Cinestudiar</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <style>
            .desc1back{
                color: white;
                background-color: #45698a;
                height: auto;
            }
            .container {
                padding-right: 0 !important;
                padding-left: 0 !important;
            }
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
                padding:10px;
                margin-left: 20px;
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
            }
            .leftside{
                background-color: #012154;
            }
            div#general{
                margin: auto;
                width: 1600px;
                height: 1000px;
            }

            .navbar{
                position: fixed;
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

            p.emptytxt{
                margin-top: 45px;
                font-size:20px;
                color:white;
                font-weight: bold;

            }
            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
                color: #2d2e33;
                position: center;
            }
            input[id=rememberme]{
                font-family: Arial, Helvetica, sans-serif;
                color: #2b2e31;
                text-decoration-color: black;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                margin-right: 0px;
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
            left2{
                margin-right: 75px;
            }
        </style>
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



        .seccion-perfil-usuario .perfil-usuario-body {
            width: 70%;
            position: relative;
            max-width: 750px;
            margin-bottom: 0.5rem;
            margin-top: 0.5rem;
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
            margin-top: 0.5rem;
        }

        .seccion-perfil-usuario .perfil-usuario-body .texto {
            color: #848484;
            font-size: 0.95em;
        }

        .seccion-perfil-usuario .perfil-usuario-footer,
        .seccion-perfil-usuario .perfil-usuario-bio {
            display: flex;
            flex-wrap: wrap;
            padding: 0.75rem 1rem;
            box-shadow: 0 0 12px rgba(0, 0, 0, .2);
            background-color: #fff;
            border-radius: 15px;
            width: 100%;
        }

        .seccion-perfil-usuario .perfil-usuario-bio {
            margin-bottom: 1rem;
            text-align: center;
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


        a {
            text-decoration: none !important;
        }
    </style>






        <%if (usuario!=null && usuario.getNombres()!=null){%>

        <jsp:include page="headerSesionIniciada.jsp">
            <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
        </jsp:include>

        <%} else {%>
        <jsp:include page="headerSesionNoIniciada.jsp"/>
        <%}%>



        <%if (session.getAttribute("indicadorNologuin") !=null){%>
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <i class="bi bi-info-circle-fill"></i><%=session.getAttribute("indicadorNologuin")%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <%session.removeAttribute("indicadorNologuin");%>
        <%}%>




    <% if (session.getAttribute("indicadorReserva") != null){%>
    <div class="alert alert-info alert-dismissible fade show" role="alert">
        <i class="bi bi-info-circle-fill"></i>Función Reservada con Éxito. Recuerda que se ha reservado un solo ticket, la cual se añadió a su carrito de compras, ahi podrá agregar mas tickets.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <%session.removeAttribute("indicadorReserva");%>
    <%}%>


    <% if (session.getAttribute("indicadorReservaFallida") != null){%>
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <i class="bi bi-info-circle-fill"></i>Error al reservar. Por favor, intente de nuevo.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <%session.removeAttribute("indicadorReservaFallida");%>
    <%}%>



        <section class="seccion-perfil-usuario">

            <br>
            <br>
        <div class="perfil-usuario-nuevo">

            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Detalles de la obra</th>
                    <th scope="col" size="100px"></th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/Image?action=peliculas&id=<%=pelicula.getIdpeliculas()%>" alt="poster_movie" width="285px" height="400px" style="margin-top: 20px;margin-left: 20px;margin-right: 20px">
                    </td>
                    <td style="width:20%;margin-right: 20px"><H6 style="margin-top: 15px;margin-right: 30px">Título:</H6>
                        <hr>
                        <p><%=pelicula.getNombre()%></p>
                        <H6>Duración:</H6>
                        <hr>
                        <p><%=pelicula.getDuracion()%> minutos</p>
                        <H6>Género:</H6>
                        <hr>
                        <p><%=pelicula.getGenero()%></p>
                            <%int i =1;%>
                            <%int j=1;%>
                            <%for(BPeliculas bPeliculas : lista_profesionales) {%>
                            <% if (bPeliculas.getProfesional().getRol().equals("d")){ %>
                            <% if(i==1){%>
                        <H6>Elenco:</H6>
                        <hr>
                            <%}%>
                            <p><%=bPeliculas.getProfesional().getNombre()%> <%=bPeliculas.getProfesional().getApellido()%> (Director(a))</p>
                            <%i=2;%>
                            <%}%>
                            <% if (bPeliculas.getProfesional().getRol().equals("a")){%>
                            <%if (j==1){%>
                            <%}%>
                            <%j=2;%>
                            <p> <%=bPeliculas.getProfesional().getNombre()%> <%=bPeliculas.getProfesional().getApellido()%></p >
                            <%}%>
                            <%}%>
                        </td>
                    <td><h6 class="mb-4"style="margin-left: 40px;margin-top: 15px">Sinopsis:</h6>
                        <hr style="margin-left: 40px;margin-right: 40px">
                        <%if (pelicula.getInformación()!=null){%>
                        <p style="margin-left: 40px;margin-right: 40px"><%=pelicula.getInformación()%></p>
                        <%}else{%>
                        <p style="margin-left: 40px">Todavía no contamos con una descripción disponible</p>
                        <%}%></td>
                </tr>
                </tbody>
            </table>
        </div>
            <br>
            <br>

            <div class="perfil-usuario-nuevo">

                <br>

                                        <H2>Horarios disponibles</H2>

                                        <H7>(Al darle en "Agregar" la funcion se añadirá a su carrito de compras, ahi podrá agregar mas tickets)</H7>
                                         <br>
                <br>
                <br>
                                        <table id="tablax" class="table table-striped " style="background-color:#cbe4f1">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="color: black">Día</th>
                                                    <th scope="col" style="color: black">Hora</th>
                                                    <th scope="col" style="color: black">Precio</th>
                                                    <th scope="col" style="color: black">Edad Minima</th>
                                                    <th scope="col" style="color: black">Sede</th>
                                                    <th scope="col" style="color: black"># Tickets Disponibles</th>
                                                    <th scope="col" style="color: black"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%for (BFuncionUsuario bFuncionUsuario: listafunciones) {%>
                                                <tr>
                                                    <td scope="row"><p> <%=bFuncionUsuario.getFecha()%></p> </td>
                                                    <td><p>  <%=bFuncionUsuario.getHora()%></p> </td >
                                                    <td><p>  <%=bFuncionUsuario.getPrecioTicket()%></p> </td >
                                                    <%if (bFuncionUsuario.getEdadMinima()==0){%>
                                                    <td>No hay</td>
                                                    <%}else{%>
                                                    <td><p>  <%=bFuncionUsuario.getEdadMinima()%></p> </td >
                                                    <%}%>
                                                    <td><p>  <%=bFuncionUsuario.getbSedeUsuario().getSede()%></p> </td >
                                                    <%%>
                                                    <td><p>  <%=bFuncionUsuario.getbSedeUsuario().getAforoOperador()%></p> </td >
                                                    <td>
                                                        <form class="user" method="POST" action="<%=request.getContextPath()%>/detalles?action=agregar" >
                                                            <input type="hidden" name="id" value="<%=pelicula.getIdpeliculas()%>">
                                                            <input type="hidden" name="idFuncion" value="<%=bFuncionUsuario.getIdFuncion()%>">
                                                            <%boolean coincidencia=false; %>
                                                            <%for (BCarrito carrito : carritodeCliente) {%>

                                                            <%
                                                                if (carrito.getIdfuncion() == bFuncionUsuario.getIdFuncion()) {
                                                                    coincidencia = true;
                                                                    break;
                                                                }%>

                                                            <%}%>

                                                            <%int disponibilidad= Integer.parseInt(bFuncionUsuario.getbSedeUsuario().getAforoOperador());%>

                                                            <%if (!coincidencia && disponibilidad>0){%>
                                                            <button class="btn btn-outline-info" type="submit">Agregar</button>

                                                            <%}else{%>
                                                            <button class="btn btn-info disabled" type="submit">Agregar</button>
                                                            <%}%>

                                                        </form>
                                                    </td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
            </div>
            </div>
        </section>
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
                    search: "Buscar:",
                    lengthMenu: "Agrupar de _MENU_ ",
                    info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                    infoEmpty: "No existen datos",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu busqueda",
                    emptyTable: "No hay datos disponibles",
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
                scrollY: 250.5,
                lengthMenu: [ [4, 8, -1], [4, 8, "All"] ],
            });
        });
    </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
                crossorigin="anonymous"></script>

        <script>
            // Get the modal
            var modalh1 = document.getElementById('id01');

            // When the user clicks anywhere outside of the modal, close dt
            window.onclick = function(event) {
                if (event.target == modalh1) {
                    modalh1.style.display = "none";
                }
            }
        </script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <br><br><br><br><br><br>


    </body>
</html>
