<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page import="com.example.cinestudiar.beans.BSedeYSala" %>
<%@ page import="com.example.cinestudiar.beans.BEquipoLimpieza" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:useBean id="listapelicula1" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean id="listaSalas" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BSedeYSala>"/>
<jsp:useBean id="listaPersonal" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BEquipoLimpieza>"/>
<jsp:useBean id="Funciones" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BFuncion>"/>
<jsp:useBean id="listarFunciones" scope="request" type="java.lang.String"/>
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
        .checked {
            color: orange;
        }
        input[type="date"]::before {
            content: attr(placeholder);
            position: absolute;
            color: #000000;
        }

        input[type="date"] {
            color: #ffffff;
        }
        input[type="date"]:focus{
            color: #666666;
        }

        input[type="date"]:focus::before {
            content: "";
        }

    </style>

     <link rel="stylesheet" href="Operador/operador_style.css">
     <jsp:include page="cabecera_operador.jsp"/>
</head>
<body class='snippet-body' bgcolor="#191970" STYLE="  background-image: url('Imagenes/fondo.jpg'); background-size: cover;">



    <section class="administrador">
        <h3 class="mt-1 p-0 mb-0 ">Operador</h3>
    </section>
    <section>
        <ul class="navbar navbar-dark bg-dark">

            <li class="nav-item">
                <a  href="<%=request.getContextPath()%>/OperadorServlet?action=peliculas" class="navbar-brand">Películas</a>
            </li>
            <li class="nav-item">
                <a  href="<%=request.getContextPath()%>/OperadorServlet?action=funciones" class="navbar-brand">Funciones</a>
            </li>
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe" class="navbar-brand" aria-current="page">Profesionales</a>
            </li>
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearFu" class="navbar-brand" aria-current="page">Personal</a>
            </li>
        </ul>

    </section>
    <div class="container">

        <div class="d-flex justify-content-between">

            <div class="input-group mb-3 col">

                <!-- Button trigger modal -->
                <button style="height: 40px"
                        type="button" class="btn btn-success buttonmargin" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                    Crear Función
                </button>

            </div>
            <form class="d-flex justify-content-between" method="POST" name ="" action="<%=request.getContextPath()%>/OperadorServlet?action=filtro_func">

            <div class="input-group mb-3 col">


                <input name = "fecha_in" class="form-control" type="date"  placeholder="Desde:" aria-label="default input example">

            </div>
            <div class="input-group mb-3 col">


                <input
                        name="fecha_fin" class="form-control" type="date" placeholder="Hasta:"
                        aria-label="default input example">

            </div>
            <div class = "input-group mb-3 col">


                <select name="listarFunciones" class="form-control" aria-label="default input example" onchange="update()" >
                    <option selected value="defecto"<%=listarFunciones.equals("defecto")?"selected":""%>>Ordenar por:</option>
                    <option value="Funciones Disponibles" <%=listarFunciones.equals("Funciones Disponibles")?"selected":""%>>Funciones Disponibles</option>
                    <option value="Mejor calificado" <%=listarFunciones.equals("Mejor calificado")?"selected":""%>>Mejor calificado</option>
                    <option value="Mas visto"<%=listarFunciones.equals("Mas visto")?"selected":""%>>Más visto</option>
                    <option value="Menos visto"<%=listarFunciones.equals("Menos visto")?"selected":""%>>Menos visto</option>
                </select>

            </div>
            <div class ="input-group mb-3 col">

                <button style="height: 40px; background-color: #003f9e; text-decoration-color: #dedee1" class="btn btn-success buttonmargin" type = "submit">Filtrar</button>

            </div>
            </form>

            <div class="input-group mb-3 col">
                <button style="height: 40px; background-color: #6c6e7e; text-decoration-color: #dedee1" data-bs-toggle="modal" class = "btn btn-success buttonmargin" data-bs-target="#exporta_reporte">Exportar reporte</button>
                <div class="ms-auto p-2 bd-highlight botones">

                    <div class="modal fade" id="exporta_reporte" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Reporte de Sala</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form class="p-2 mx-2 mb-2 d-flex-row ">
                                        <div class="d-flex flex-column bd-highlight mb-3">
                                            <div class="p-2 bd-highlight">
                                                <label class="fw-bold">Sede:</label>
                                                <br>
                                                <select style="width: 30%" class="mx-1 custom-select my-1 mr-sm-2" id="sede" name="Sede">
                                                    <option value="San Miguel">San Miguel</option>
                                                    <option value="Miraflores">Miraflores</option>
                                                    <option value="Surco">Surco</option>
                                                    <option value="Pueblo Libre">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <label class="fw-bold">Sala</label><br>
                                                <select style="width: 30%" class="custom-select my-1 mr-sm-2" id="sala">
                                                    <option selected></option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <label class="fw-bold" for="fecha">Fecha:</label><br>
                                                <input class="mx-1 my-2" type="date" id="fecha" name="fecha">
                                            </div>
                                        </div>
                                    </form>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-secondary" data-bs-target="#reporte_exportado" >Exportar</button>
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
                            <h5 class="modal-title" id="staticBackdropLabel">Crear Función</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=crearFunciones"  enctype="multipart/form-data">
                                <div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Titulo</span> <!--RECIBIRÁ DE BASE -->
                                        <select type="text" id="pelicula" name="idPelicula" class="form-control form-control-lg">
                                            <option selected></option>
                                            <% for(BPeliculas peliculas: listapelicula1) { %>
                                            <option value="<%=peliculas.getIdpeliculas()%>"><%=peliculas.getNombre()%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Edad mínima</span>
                                        <input name="edad_minima" type="text" class="form-control" placeholder="Edad Mínima" required="required"
                                               aria-label="Sala 1"
                                               aria-describedby="button-addon1" autocomplete="on">

                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Sala</span><!--RECIBIRÁ DE BASE -->
                                        <select type="text" id="idSala" name="idSala" class="form-control form-control-lg">
                                            <option selected></option>
                                            <% for(BSedeYSala sala: listaSalas) { %>
                                            <option value="<%=sala.getIdSala()%>"><%=sala.getIdSala()%>: Sede= <%=sala.getSede()%> </option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Aforo</span><!--FALTA COLOCAR COMO AFORO MINIMO LO QU RECIBE DE ADMIN-->
                                        <input name="aforoOperador" type="number" class="form-control" placeholder="Aforo" required="required"
                                               aria-label="Sala 1" min="1" max ="50"
                                               aria-describedby="button-addon1">

                                    </div>


                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Fecha</span> <!--/FALTA COLOCAR COMO FECHA MÍNIMA TODAY-->
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
                                        <span class="input-group-text">Personal de Mantenimiento</span><!--RECIBIRÁ DE BASE lista -->
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

        <% if (session.getAttribute("errorCrear") != null){%>
        <div>
            <div class="alert alert-danger" role="alert">
                <%=session.getAttribute("errorCrear")%>
            </div>
        </div>
        <%session.removeAttribute("errorCrear");%>
        <%}%>

    <div class="container">
        <div class="row ">

            <table class="table" id = "tableUp">

                    <tr>
                        <th class="text-white">IdFunción</th>
                        <th class="text-white">Película</th>
                        <th class="text-white">Fecha</th>
                        <th class="text-white">Hora</th>
                        <th class="text-white">Sede</th>
                        <th class="text-white">Sala</th>
                        <th class="text-white">Precio de ticket</th>
                        <th class="text-white">Calificacion Promedio</th>
                        <th class="text-white">Editar</th>
                        <th class="text-white">Borrar</th>


                    </tr>
                <tbody>

                <%

                    for (BFuncion funcion : Funciones) { %>

                <tr>
                    <td class="text-white"><%=funcion.getIdFuncion()%></td>
                    <td class="text-white"><%=funcion.getPelicula()%> </td>
                    <td class="text-white"><%=funcion.getFecha()%></td>
                    <td class="text-white"><%=funcion.getHora()%></td>
                    <td class="text-white"><%=funcion.getSede() %></td>
                    <td class="text-white"><%=funcion.getIdSala()%></td>
                    <td class="text-white">S/. <%=funcion.getPrecioTicket()%></td>
                    <% int num= (int) funcion.getCalificacion();%>
                    <%if (num == 0){ %>
                    <td class="text-white">No tiene</td>
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

                    <td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=funcion.getIdFuncion()%>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
                            </svg>
                        </button>
                    </td>


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














                    <%if (funcion.getExisteCompra()==0){%>
                    <td>

                        <a onclick="return confirm('¿Estas seguro de borrar?');"
                           href="<%=request.getContextPath()%>/OperadorServlet?action=borrarfuncion&id=<%=funcion.getIdFuncion()%>"
                           type="button" class="btn btn-danger">

                            <i class="bi bi-trash"></i>
                        </a>
                    </td>
                    <%} else{%>
                    <td class="text-white">No aplica</td>
                    <%}%>










                </tr>

                <%
                } %>
                </tbody>

                <!-- Large modal -->

            </table>
        </div>
    </div>
    </div>



</body>
</html>