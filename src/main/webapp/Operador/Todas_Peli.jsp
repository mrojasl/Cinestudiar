<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page import="com.example.cinestudiar.beans.BProfesional" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="Peliculas" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean type="java.lang.String" scope="request" id="txtbuscado" class="java.lang.String"/>
<jsp:useBean id="directores" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BProfesional>"/>
<jsp:useBean id="actores" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BProfesional>"/>

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
                    <a  href="<%=request.getContextPath()%>/OperadorServlet?action=peliculas" class="navbar-link active">Películas</a>
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
                <li class="nav-item">
                    <a ></a>
                </li>
            </ul>

        </section>


        <div class="container">



            <div class="row">


                <div class="input-group mb-3 col">



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
                            <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=crearpeli" enctype="multipart/form-data">
                                <div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Titulo</span>
                                        <input name="titulo" type="text" class="form-control" placeholder="Título" required="required"
                                               aria-label="Sala 1"
                                               aria-describedby="button-addon1">
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Duracion</span>
                                        <input name="duracion" type="number" class="form-control" placeholder="Duración" required="required"
                                               aria-label="Sala 1" min="0" max="400"
                                               aria-describedby="button-addon1">
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Genero</span>
                                        <select type="text" id="genero" name="genero" class="form-control form-control-lg">
                                            <option selected></option>
                                            <option value="accion">accion</option>
                                            <option value="animación">animación</option>
                                            <option value="aventura">aventura</option>
                                            <option value="ciencia_ficcion">ciencia ficcion</option>
                                            <option value="comedia">comedia</option>
                                            <option value="drama">drama</option>>
                                            <option value="misterio">misterio</option>
                                            <option value="suspenso">suspenso</option>
                                            <option value="terror">terror</option>
                                        </select>
                                    </div>
                                    <label>Descripción</label>
                                    <div class="input-group mb-3">

                                        <textarea name="descripcion" style="height:300px;font-size:14pt;" maxlength="1000" class="form-control"></textarea>

                                    </div>
                                    <div class="input-group mb-3 ">
                                        <div class="input-group mb-3">
                                            <label class="input-group-text" for="inputGroupFile01">Portada</label>
                                            <input name="fotopeli" type="file" class="form-control" id="inputGroupFile01">
                                        </div>
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




            <div class="row ">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <div class="dataTables_length" id="tableUp_length">
                            <label></label>
                            <!-- Button trigger modal -->
                            <button style="height: 40px"
                                    type="button" class="btn btn-success buttonmargin" data-bs-toggle="modal"
                                    data-bs-target="#staticBackdrop">
                                Crear Película
                            </button>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <div id="tableUp_filter" class="dataTables_filter">
                            <label class="text-white" style="margin-left: 20px">Buscar: </label>
                        </div>
                    </div>
                </div>
                <table class="table" id = "tableUp">
                    <thead>
                        <tr>
                            <th class="text-white">ID</th>
                            <th class="text-white">Título</th>
                            <th class="text-white">Duración (minutos)</th>
                            <th class="text-white">Género</th>
                            <th class="text-white">Calificación Promedio</th>
                            <th class="text-white">Profesionales</th>
                            <th class="text-white">Descripción</th>
                            <th class="text-white">Portada</th>
                            <th class="text-white">Borrar</th>

                        </tr>
                    </thead>


                    <%

                        for (BPeliculas pelicula : Peliculas) { %>

                    <tr>
                        <td class="text-white"><%=pelicula.getIdpeliculas()%></td>
                        <td class="text-white"><%=pelicula.getNombre()%> </td>
                        <td class="text-white"><%=pelicula.getDuracion()%></td>
                        <td class="text-white"><%=pelicula.getGenero()%></td>



                        <!-- ModalDescripcion -->
                        <div class="modal fade" id="descripcion<%=pelicula.getIdpeliculas()%>" tabindex="-1" aria-labelledby="descripcion<%=pelicula.getIdpeliculas()%>" aria-hidden="true">
                            <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=editarDesc">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Descripción</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input name="id" hidden type="text" value="<%=pelicula.getIdpeliculas()%>">
                                            <div class="input-group">
                                                <textarea name="descripcion" style="height:500px;font-size:14pt;" maxlength="1000" class="form-control"><%=pelicula.getInformación()%></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>


                        <!-- ModalPortada -->
                        <div class="modal fade" id="foto<%=pelicula.getIdpeliculas()%>" tabindex="-1" aria-labelledby="foto<%=pelicula.getIdpeliculas()%>" aria-hidden="true">
                            <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=editarPort" enctype="multipart/form-data">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel2">Descripción</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input name="id" hidden type="text" value="<%=pelicula.getIdpeliculas()%>">
                                            <div class="input-group">
                                                <img class="crop" src="${pageContext.request.contextPath}/Image?action=peliculas&id=<%=pelicula.getIdpeliculas()%>" alt="portada" style="width:250px;height:380px;margin-left: 100px "/>

                                            </div>
                                            <div style="margin-top: 20px">
                                                <label class="input-group-text" for="inputGroupFile01">Editar Portada</label>
                                                <input type="file" class="form-control" name="fotonueva">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>




                        <!-- ModalProfesionales -->
                        <div class="modal fade" id="profesionales<%=pelicula.getIdpeliculas()%>" tabindex="-1" aria-labelledby="profesionales<%=pelicula.getIdpeliculas()%>" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel3">Descripción</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Director:
                                            <br>
                                            <%for (BProfesional dir : directores){%>
                                            <%if (dir.getIdPelicula()==pelicula.getIdpeliculas()){%>
                                            <%=dir.getNombre()%> <%=dir.getApellido()%>
                                            <br>
                                            <%}%>
                                            <%}%>
                                            <br>
                                            Actores:
                                            <br>
                                            <%for (BProfesional act : actores){%>
                                            <%if (act.getIdPelicula()==pelicula.getIdpeliculas()){%>
                                            <%=act.getNombre()%> <%=act.getApellido()%>
                                            <br>
                                            <%}%>
                                            <%}%>


                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                        </div>






                        <% int num= (int) pelicula.getCalificacion();%>
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
                            <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#profesionales<%=pelicula.getIdpeliculas()%>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"></path>
                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"></path>
                                </svg>
                            </button>
                        </td>





                        <td class="text-white">
                            <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#descripcion<%=pelicula.getIdpeliculas()%>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"></path>
                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"></path>
                                </svg>
                            </button>
                        </td>




                        <td>
                            <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#foto<%=pelicula.getIdpeliculas()%>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"></path>
                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"></path>
                                </svg>
                            </button>
                        </td>


                        <%if (pelicula.getExisteCompra()==0){%>
                        <td>

                            <a onclick="return confirm('¿Estas seguro de borrar?\nSe eliminarán todas las funciones que contengan esta película');"
                               href="<%=request.getContextPath()%>/OperadorServlet?action=borrarpeli&id=<%=pelicula.getIdpeliculas()%>"
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
                    scrollY: 520,
                    lengthMenu: [ [8, 15, -1], [8, 15, "All"] ],
                });
            });
        </script>

    </body>
</html>




