<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page import="com.example.cinestudiar.beans.BProfesional" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="listaProfesionales" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BProfesional>"/>
<jsp:useBean type="java.lang.String" scope="request" id="txtbuscado" class="java.lang.String"/>

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
                    <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe" class="navbar-brand" aria-current="page">Profesionales</a>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearFu" class="navbar-brand" aria-current="page">Personal</a>
                </li>
            </ul>

        </section>


        <div class="container">



            <div class="row">


                <div class="input-group mb-3 col">


                </div>

                <div class="input-group mb-3 col">
                </div>
                <div class="input-group mb-3 col">
                </div>



                <div class="input-group mb-3 col">


                    <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=buscarProf">

                        <input
                                name="txtbuscar" class="form-control" type="text" placeholder="Buscar por nombre"
                                aria-label="default input example" value="<%=txtbuscado%>">
                    </form>
                </div>



            </div>




            <div class="row ">

                <table class="table" id = "tableUp">

                    <tr>
                        <th class="text-white">Rol</th>
                        <th class="text-white">Nombre</th>
                        <th class="text-white">Apellido</th>
                        <th class="text-white">Calificación</th>
                        <th class="text-white">Asignar Pelicula</th>


                    </tr>



                    <%

                        for (BProfesional p : listaProfesionales) { %>

                    <tr>
                        <%if (p.getRol().equals("a")) {%>
                        <td class="text-white">Actor</td>
                        <%}else{%>
                        <td class="text-white">Director</td>
                        <%}%>
                        <td class="text-white"><%=p.getNombre()%> </td>
                        <td class="text-white"><%=p.getApellido()%></td>


                        <!-- ModalDescripcion -->
                        <div class="modal fade" id="descripcion<%=p.getIdProfesional()%>" tabindex="-1" aria-labelledby="descripcion<%=p.getIdProfesional()%>" aria-hidden="true">
                            <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=editarDesc">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Descripción</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            uahd9uashdiuasd
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>






                        <% int num= (int) p.getCalificacion();%>
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






                        <td class="text-white">
                            <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#profesionales<%=p.getIdProfesional()%>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"></path>
                                </svg>

                            </button>
                            <button style="margin-left: 25px" type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#retirar<%=p.getIdProfesional()%>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"></path>
                                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"></path>
                                </svg>
                            </button>
                        </td>




                    </tr>

                    <%
                        } %>


                    <!-- Large modal -->

                </table>
            </div>
        </div>



    </body>
</html>

