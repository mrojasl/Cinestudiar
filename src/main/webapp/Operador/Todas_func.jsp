<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page import="com.example.cinestudiar.beans.BSedeYSala" %>
<%@ page import="com.example.cinestudiar.beans.BEquipoLimpieza" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>

<jsp:useBean id="listapelicula1" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean id="listaSalas" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BSedeYSala>"/>
<jsp:useBean id="listaPersonal" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BEquipoLimpieza>"/>
<jsp:useBean id="Funciones" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BFuncion>"/>
<jsp:useBean id="listarFunciones" scope="request" type="java.lang.String"/>
<jsp:useBean id="listaSalasAforo" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BSedeYSala>"/>

<html>
<head>
    <meta charset="UTF-8">
    <title>Ordenar Funciones</title>

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

    <!--link--stars-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
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
            border-radius: 5px;
            padding: 1.5rem 2rem;

        }
        .seccion-perfil-usuario .perfil-usuario-nuevo2{
            width: 95%;
            position: relative;
            background-color: #fff;
            max-width: 1200px;
            border-radius: 5px;
            padding: 0.5rem 0.5rem;

        }
        .checked {
            color: orange;
        }
        input[type="date"]::before {
            content: attr(placeholder);
            position: absolute;
            color: #000000;
        }

        <%--input[type="date"] {
            color: #ffffff;
        }--%>
        input[type="date"]:focus{
            color: #666666;
        }

        input[type="date"]:focus::before {
            content: "";
        }

    </style>

     <link rel="stylesheet" href="Operador/operador_style.css">
     <jsp:include page="cabecera_operador.jsp">
         <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
     </jsp:include>
</head>
<body class='snippet-body' bgcolor="#191970" STYLE="  background-image: url('<%=request.getContextPath()%>/Imagenes/fondo.jpg'); background-size: cover;">
    <section class="administrador">
        <h3 class="mt-1 p-0 mb-0 ">Operador</h3>
    </section>
    <section>
        <ul class="navbar navbar-dark bg-dark">
            <li class="nav-item">
                <a ></a>
            </li>
            <li class="nav-item">
                <a  href="<%=request.getContextPath()%>/OperadorServlet?action=peliculas" class="navbar-brand">Pel??culas</a>
            </li>
            <li class="nav-item">
                <a  href="<%=request.getContextPath()%>/OperadorServlet?action=funciones" class="navbar-link active">Funciones</a>
            </li>
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe" class="navbar-brand" aria-current="page">Profesionales</a>
            </li>
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearFu" class="navbar-brand" aria-current="page">Personal</a>
            </li>
            <li class="nav-item">
                <a ></a>
            </li>
        </ul>

    </section>
    <div class="container">
        <section class="seccion-perfil-usuario">
            <div class="perfil-usuario-nuevo2">

                <div class="d-flex justify-content-between">

                    <div class="input-group mb-3 col">

                        <!-- Button trigger modal -->
                        <button style="height: 40px;margin-top: 10px"
                                type="button" class="btn btn-success buttonmargin" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop">
                            Crear Funci??n
                        </button>

                    </div>

                    <div class="input-group mb-3 col">
                        <button style="height: 40px; background-color: #6c6e7e; text-decoration-color: #dedee1;margin-top: 10px;margin-left: 300px;" data-bs-toggle="modal" class = "btn btn-success buttonmargin" data-bs-target="#exporta_reporte">Exportar reporte</button>
                        <div class="ms-auto p-2 bd-highlight botones">

                            <div class="modal fade" id="exporta_reporte" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Reporte de Sala</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="post" class="p-2 mx-2 mb-2 d-flex-row " action="<%=request.getContextPath()%>/OperadorServlet?action=reporte">
                                                <div class="d-flex flex-column bd-highlight mb-3">
                                                    <div class="p-2 bd-highlight">
                                                        <label class="fw-bold">Sala-Sede:</label>
                                                        <br>
                                                        <select name="filtro_sala"  style="width: 30%" name = "sede" class="mx-1 custom-select my-1 mr-sm-2" id="sede" name="Sede">
                                                            <% for(BSedeYSala sala: listaSalas) { %>
                                                            <option value="<%=sala.getIdSala()%>">Sala <%=sala.getIdSala()%>-<%=sala.getSede()%> </option>
                                                            <% } %>
                                                        </select>

                                                    </div>
                                                    <div class="p-2 bd-highlight">
                                                        <label class="fw-bold" for="fecha">Fecha:</label><br>
                                                        <input name="filtro_fecha" class="mx-1 my-2" type="date" id="fecha" name="fecha">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="btn btn-secondary" data-bs-target="#reporte_exportado">Previsualizar</button>
                                                </div>
                                            </form>

                                        </div>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Crear Funci??n</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=crearFunciones"  enctype="multipart/form-data">
                                        <div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Titulo</span> <!--RECIBIR?? DE BASE -->
                                                <select type="text" id="pelicula" name="idPelicula" class="form-control form-control-lg">
                                                    <option selected></option>
                                                    <% for(BPeliculas peliculas: listapelicula1) { %>
                                                    <option value="<%=peliculas.getIdpeliculas()%>"><%=peliculas.getNombre()%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Edad m??nima(M??ximo:25)</span>
                                                <input name="edad_minima" type="number" class="form-control" placeholder="Escribir 0 si no hay restricci??n"
                                                       min="0"
                                                       max="25"
                                                       required="required"
                                                       aria-label="Sala 1"
                                                       aria-describedby="button-addon1" autocomplete="on">

                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Sala</span><!--RECIBIR?? DE BASE -->
                                                <select type="text" id="idSala" name="idSala"   class="form-control form-control-lg">
                                                    <% for(BSedeYSala sala: listaSalas) { %>
                                                    <option id="Sala<%=sala.getIdSala()%>" value="<%=sala.getIdSala()%>"><%=sala.getIdSala()%>: Sede:<%=sala.getSede()%>;Aforo M??ximo: <%=sala.getAforoAdministrador()%> </option>
                                                    <% } %>
                                                </select>

                                            </div>
                                            <div class="input-group mb-3">





                                                <span class="input-group-text">Aforo</span><!--FALTA COLOCAR COMO AFORO MINIMO LO QU RECIBE DE ADMIN-->
                                                <input name="aforoOperador"   type="number" class="form-control" placeholder="Aforo" required="required"
                                                       aria-label="Sala 1" min="1"  id="aforoDelOperador"
                                                       aria-describedby="button-addon1">
                                                <br>



                                            </div>


                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Fecha</span> <!--/FALTA COLOCAR COMO FECHA M??NIMA TODAY-->
                                                <input style="color: black" name="fecha" type="date" class="form-control"  required="required"
                                                       aria-label="Sala 1" min="<%=java.time.LocalDate.now()%>"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Hora</span>
                                                <input name="hora" type="time" class="form-control"  required="required"
                                                       aria-label="Sala 1" min="<%=java.time.LocalTime.now()%>"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Personal de Mantenimiento</span><!--RECIBIR?? DE BASE lista -->
                                                <select type="text" id="idPersonal" name="idPersonal" class="form-control form-control-lg">
                                                    <option selected></option>
                                                    <% for(BEquipoLimpieza limpieza: listaPersonal) { %>
                                                    <option value="<%=limpieza.getIdpersonal()%>"><%=limpieza.getIdpersonal()%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Costo de Ticket</span>
                                                <input name="precio_ticket" type="number" class="form-control" placeholder="Costo de Ticket" required="required"
                                                       aria-label="Sala 1" min="1"
                                                       aria-describedby="button-addon1">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar
                                            </button>
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <br>
        <% if (session.getAttribute("errorRolesPeli") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("errorRolesPeli")%>
            </div>
        </div>
        <%session.removeAttribute("errorRolesPeli");%>
        <%}%>

        <% if (session.getAttribute("errorCrear") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("errorCrear")%>
            </div>
        </div>
        <%session.removeAttribute("errorCrear");%>
        <%}%>


        <% if (session.getAttribute("errorAforo") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("errorAforo")%>
            </div>
        </div>
        <%session.removeAttribute("errorAforo");%>
        <%}%>

        <% if (session.getAttribute("errorIDSala") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("errorIDSala")%>
            </div>
        </div>
        <%session.removeAttribute("errorIDSala");%>
        <%}%>

        <% if (session.getAttribute("errorEdad") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("errorEdad")%>
            </div>
        </div>
        <%session.removeAttribute("errorEdad");%>
        <%}%>

        <% if (session.getAttribute("errorFechas") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("errorFechas")%>
            </div>
        </div>
        <%session.removeAttribute("errorFechas");%>
        <%}%>

        <% if (session.getAttribute("success") != null){%>
        <div>
            <div class="alert alert-primary" role="alert">
                <%=session.getAttribute("success")%>
            </div>
        </div>
        <%session.removeAttribute("success");%>
        <%}%>

        <% if (session.getAttribute("fueradelimite") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("fueradelimite")%>
            </div>
        </div>
        <%session.removeAttribute("fueradelimite");%>
        <%}%>

        <% if (session.getAttribute("errorPersonal") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("errorPersonal")%>
            </div>
        </div>
        <%session.removeAttribute("errorPersonal");%>
        <%}%>





        <section class="seccion-perfil-usuario">
            <div class="perfil-usuario-nuevo">

                <div class="container">
                    <div class="row ">
                        <div class="row">
                            <form class="d-flex justify-content-between" method="POST" name ="" action="<%=request.getContextPath()%>/OperadorServlet?action=filtro_func">
                                <div class="col-sm-12 col-md-6">
                                    <label style="margin-left: 20px">Filtrar por fecha:</label>
                                    <div class="dataTables_length" id="tableUp_length">


                                        <div class="input-group mb-3 col">
                                            <input name = "fecha_in" class="form-control" type="date"  placeholder="" aria-label="">
                                        </div>
                                        <div class="input-group mb-3 col">
                                            <input name="fecha_fin" class="form-control" type="date" placeholder="" aria-label="">
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div id="tableUp_filter" class="dataTables_filter">
                                        <label class="text-black" style="margin-left: 20px">Ordenar por: </label>
                                        <div class = "input-group mb-3 col">
                                            <select name="listarFunciones" class="form-control" aria-label="default input example" onchange="update()" >
                                                <option selected value="defecto"<%=listarFunciones.equals("defecto")?"selected":""%>>Todas las funciones</option>
                                                <option value="Funciones Disponibles" <%=listarFunciones.equals("Funciones Disponibles")?"selected":""%>>Funciones Disponibles</option>
                                                <option value="Mejor calificado" <%=listarFunciones.equals("Mejor calificado")?"selected":""%>>Mejor calificado</option>
                                                <option value="Mas visto"<%=listarFunciones.equals("Mas visto")?"selected":""%>>M??s vistos</option>
                                                <option value="Menos visto"<%=listarFunciones.equals("Menos visto")?"selected":""%>>Menos vistos</option>
                                            </select>
                                        </div>
                                        <div class ="input-group mb-3 col">

                                            <button style="height: 40px; background-color: #003f9e; text-decoration-color: #dedee1" class="btn btn-success buttonmargin" type = "submit">Aplicar filtros</button>

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <table class="table table-striped table-hover" id = "tableUp">
                            <thead>
                            <tr>
                                    <th HIDDEN class="text-white">ID</th>
                                    <th class="text-black">ID Funci??n</th>
                                    <th class="text-black">Pel??cula</th>
                                    <th class="text-black">Fecha</th>
                                    <th class="text-black">Hora</th>
                                    <th class="text-black">Sede</th>
                                    <th class="text-black">Sala</th>
                                    <th class="text-black">Precio</th>
                                    <th class="text-black">Porcentaje de compra</th>
                                    <th class="text-black">Calificacion Promedio</th>
                                    <th class="text-black">Editar</th>
                                    <th class="text-black">Borrar</th>
                                </tr>
                            </thead>
                            <tbody>

                            <%for (BFuncion funcion : Funciones) { %>

                            <tr>
                                <td hidden class="text-white">a</td>
                                <td class="text-black"><%=funcion.getIdFuncion()%></td>
                                <td class="text-black"><%=funcion.getPelicula()%> </td>
                                <td class="text-black"><%=funcion.getFecha()%></td>
                                <td class="text-black"><%=funcion.getHora()%></td>
                                <td class="text-black"><%=funcion.getSede() %></td>
                                <td class="text-black"><%=funcion.getIdSala()%></td>
                                <td class="text-black">S/. <%=funcion.getPrecioTicket()%></td>
                                <td class="text-black"> <%=Math.round(funcion.getAsistencia()*100.0)/100.0%>%</td>
                                <% int num= (int) funcion.getCalificacion();%>
                                <%if (num == 0){ %>
                                <td class="text-black">No tiene</td>
                                <%}%>
                                <%if (num == 1){ %>
                                <td>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </td>
                                <%}%>
                                <%if(num==2){%>
                                <td>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </td>
                                <%}%>
                                <%if(num==3){%>
                                <td>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </td>
                                <%}%>
                                <%if(num==4){%>
                                <td>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star"></i>
                                </td>
                                <%}%>
                                <%if(num==5){%>
                                <td>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                </td>
                                <%}%>

                                <%if(funcion.getAsistencia()==0){%>
                                <td>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=funcion.getIdFuncion()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
                                        </svg>
                                    </button>
                                </td>
                                <%}else{%>
                                <td class="text-black">No aplica</td>
                                <%}%>


                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal<%=funcion.getIdFuncion()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=editarFuncion&id=<%=funcion.getIdFuncion()%>">

                                            <div class="modal-body">

                                                    <div class="mb-3">
                                                        <input name="idSala" hidden type="text" value="<%=funcion.getIdSala()%>">
                                                        <input name="idPelicula" hidden type="text" value="<%=funcion.getIdPelicula()%>">

                                                        <label class="form-label">Fecha</label>
                                                    <input style="color: black" type="date" id="fechafunc" name="fecha" required="required"
                                                           value="<%=funcion.getFecha()%>"
                                                           min="<%=java.time.LocalDate.now()%>">
                                                    </div>
                                                    <div class="mb-3">
                                                    <label class="form-label">Hora</label>
                                                    <input style="color: black" type="time" id="horafunc" name="hora" required="required"
                                                           value="<%=funcion.getHora()%>"
                                                           min="<%=java.time.LocalTime.now()%>">
                                                    </div>
                                                    <div class="mb-3">
                                                    <label class="form-label">Precio S/</label>
                                                    <input style="color: black" type="number" id="preciofunc" name="precio" required="required"
                                                           value="<%=funcion.getPrecioTicket()%>" min="1">
                                                    </div>


                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Guardar</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <%if ( (funcion.getAsistencia()==0)){%>
                                <td>
                                    <a onclick="return confirm('??Estas seguro de borrar?');"
                                       href="<%=request.getContextPath()%>/OperadorServlet?action=borrarfuncion&id=<%=funcion.getIdFuncion()%>"
                                       type="button" class="btn btn-danger">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                                <%} else{%>
                                <td class="text-black">No aplica</td>
                                <%}%>
                            </tr>
                            <%}%>
                            </tbody>
                            <!-- Large modal -->
                        </table>
                    </div>
                </div>
            </div>
        </section>
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
            $('#tableUp').DataTable({
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar:",
                    lengthMenu: "Agrupar de _MENU_ ",
                    info: "",
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
                scrollY: 495,
                lengthMenu: [ [7, 15, -1], [7, 15, "All"] ],
            });
        });
    </script>


</body>





</html>