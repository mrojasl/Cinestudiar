<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page import="com.example.cinestudiar.beans.BProfesional" %>
<%@ page import="com.example.cinestudiar.beans.BEquipoLimpieza" %>
<%@ page import="com.example.cinestudiar.daos.OperadorDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="listaPersonal" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BEquipoLimpieza>"/>
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
        <jsp:include page="cabecera_operador.jsp">
            <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
        </jsp:include>
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



                    <!-- Button trigger modal -->
                    <button style="height: 40px"
                            type="button" class="btn btn-success buttonmargin" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop">
                        Crear Equipo de Personal
                    </button>

                </div>






                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Crear Película</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=crearpersonal" enctype="multipart/form-data">
                                    <div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">Jefe</span>
                                            <input name="jefe" type="text" class="form-control" placeholder="Nombre Completo" required="required"
                                                   aria-label="Sala 1"
                                                   aria-describedby="button-addon1">
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">Personal 1</span>
                                            <input name="p1" type="text" class="form-control" placeholder="Nombre Completo" required="required"
                                                   aria-label="Sala 1"
                                                   aria-describedby="button-addon1">
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">Personal 2</span>
                                            <input name="p2" type="text" class="form-control" placeholder="Nombre Completo" required="required"
                                                   aria-label="Sala 1"
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

                <div class="input-group mb-3 col">
                </div>
                <div class="input-group mb-3 col">
                </div>



                <div class="input-group mb-3 col">


                    <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=buscarpersonal">

                        <input
                                name="txtbuscar" class="form-control" type="text" placeholder="Buscar por nombre"
                                aria-label="default input example" value="<%=txtbuscado%>">
                    </form>
                </div>



            </div>




            <div class="row ">

                <table class="table" id = "tableUp">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="dataTables_length" id="tableUp_length">
                                <label></label>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div id="tableUp_filter" class="dataTables_filter">
                                <label class="text-white" style="margin-left: 20px">Buscar: </label>
                            </div>
                        </div>
                    </div>
                    <thead>
                        <tr>
                            <th class="text-white">ID</th>
                            <th class="text-white">Jefe</th>
                            <th class="text-white">Personal 1</th>
                            <th class="text-white">Personal 2</th>
                            <th class="text-white">Funciones</th>


                        </tr>
                    </thead>


                    <%

                        for (BEquipoLimpieza p : listaPersonal) { %>




                    <tr>

                        <td class="text-white"><%=p.getIdpersonal()%> </td>
                        <td class="text-white"><%=p.getJefe()%></td>

                        <td class="text-white"><%=p.getLimpiador1()%></td>
                        <td class="text-white"><%=p.getLimpiador2()%></td>

                        <td>
                            <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop<%=p.getIdpersonal()%>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"></path>
                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"></path>
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
                        search: "",
                        lengthMenu: "",
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
                    scrollY: 480,
                    lengthMenu: [ [8, 15, -1], [8, 15, "All"] ],
                });
            });
        </script>


    </body>


<%for (BEquipoLimpieza p : listaPersonal) { %>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop<%=p.getIdpersonal()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel<%=p.getIdpersonal()%>" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel<%=p.getIdpersonal()%>">Funciones</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <%OperadorDao operadorDao = new OperadorDao();
                        ArrayList<BFuncion> lista = operadorDao.listaFuncionesdeunPersonal(p.getIdpersonal());%>







                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Id Función</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Hora</th>
                                <th scope="col">Id Sala</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (BFuncion f : lista){%>
                            <tr>
                                <th scope="row"><%=f.getIdFuncion()%></th>
                                <td><%=f.getFecha()%></td>
                                <td><%=f.getHora()%></td>
                                <td><%=f.getIdSala()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>




                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <%}%>




</html>

