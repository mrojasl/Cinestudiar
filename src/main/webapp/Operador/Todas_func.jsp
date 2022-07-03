<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe" class="navbar-brand" aria-current="page">Actores</a>
            </li>
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearFu" class="navbar-brand" aria-current="page">Directores</a>
            </li>
        </ul>

    </section>
    <section>
        <div class="d-flex justify-content-evenly">
            <div class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/OperadorServlet?action=crearFu">Crear Función</a>
            </div>

            <div class="ms-auto p-2 bd-highlight botones">
                <button data-bs-toggle="modal" class = "btn btn-secondary" data-bs-target="#exporta_reporte">Exportar reporte</button>
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
    </section>
    <form method="POST" class = "d-flex justify-content-around" action="<%=request.getContextPath()%>/OperadorServlet?action=filtro_func">
    <div class="d-flex justify-content-around">
        <div  class="form-outline form-white w-25">
            <label class="fw-bold mx-1 my-2 text-white" >Fecha de inicio:</label>
            <input name = "fecha_in" class="form-control form-control-lg" type="date" id="fechainicio">
        </div>

        <div class="form-outline form-white w-25">
            <label class="fw-bold mx-1 my-2 text-white" >Fecha de fin:</label>
            <input name = "fecha_fin" class="form-control form-control-lg" type="date" id="fechafin">
        </div>
        <div class="form-outline form-white">
            <label class="fw-bold mx-1 my-2 text-white" >Ordenar por:</label>
               <select id ="selection_option" name="listarFunciones" class=" form-control form-control-lg" onchange="update()" >
                    <option selected value="defecto"<%=listarFunciones.equals("defecto")?"selected":""%>>Selecione su opción</option>
                    <option value="Funciones Disponibles" <%=listarFunciones.equals("Funciones Disponibles")?"selected":""%>>Funciones Disponibles</option>
                    <option value="Mejor calificado" <%=listarFunciones.equals("Mejor calificado")?"selected":""%>>Mejor calificado</option>
                    <option value="Mas visto"<%=listarFunciones.equals("Mas visto")?"selected":""%>>Más visto</option>
                    <option value="Menos visto"<%=listarFunciones.equals("Menos visto")?"selected":""%>>Menos visto</option>
                </select>
        </div>
        <div class="outline">
            <button type = "submit" class = "form-control form-control-lg text-white" style="background-color: #003f9e; text-decoration-color: #dedee1">Filtrar</button>
        </div>
    </div>
    </form>
    <div class="container">
        <div class="row ">

            <table class="table" id = "tableUp">
                <head>
                    <tr>
                        <th class="text-white">IdFunción</th>
                        <th class="text-white">Película</th>
                        <th class="text-white">Fecha</th>
                        <th class="text-white">Hora</th>
                        <th class="text-white">Sede</th>
                        <th class="text-white">Sala</th>
                        <th class="text-white">Precio de ticket</th>
                        <th class="text-white">Calificacion Promedio</th>

                    </tr>
                </head>
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
                </tr>

                <%
                } %>
                </tbody>

                <!-- Large modal -->

            </table>
        </div>
    </div>



</body>
</html>