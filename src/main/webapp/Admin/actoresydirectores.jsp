<%@ page import="com.example.cinestudiar.beans.BProfesional" %><%--
  Created by IntelliJ IDEA.
  User: Jon
  Date: 5/06/2022
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.cinestudiar.beans.BProfesional>" scope="request" id="listaProfesionales"/>
<html lang="en">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <head>
        <meta charset='utf-8'>
        <link rel="icon" href=
                "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
              type="image/x-icon">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>admin_actores</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="Admin/style_admin.css">
    </head>
    <body class='snippet-body' STYLE="  background-image: url('Imagenes/fondo.jpg'); background-size: cover;">

        <jsp:include page="cabecera_admin.jsp"/>

        <section class="administrador" style="background: #2b2e31" style="padding: 5rem;">
            <div style="padding: 0.4rem;">
                <h3 class="mt-1 p-0 mb-0 " align="center" style="color: white;margin-top: 20px;margin-bottom: 20px">Administrador</h3>
            </div>
        </section>
        <section>
            <ul class="nav nav-tabs topside" >

                    <li class="nav-item topsidetxt "style="margin-left: 350px">
                        <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/ServAdmin">Salas</a>
                    </li>
                    <li class="nav-item align-content-center"style="margin-left: 100px">
                        <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=operador">Operadores</a>
                    </li>
                    <li class="nav-item align-content-center" style="margin-left: 120px">
                        <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=cliente">Clientes</a>
                    </li>
                    <li class="nav-item align-content-center"style="margin-left: 80px">
                        <a class="nav-link active" href="<%=request.getContextPath()%>/ServAdmin?admin=profesional">Actores/Directores</a>
                    </li>

            </ul>
        </section>
        <div id="general">

            <br>

            <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=filtroprofesional">
                <div class="container">
                    <div class="supbarblue row">
                        <div class="input-group mb-3 col">
                            <h5  style="padding: 14px;color: white;width: 250px">Actores/Directores</h5>
                        </div>

                        <div class="input-group mb-3 col">
                        </div>

                        <div class="input-group mb-3 col">
                        </div>

                        <div class="input-group mb-3 col">
                            <h5 class="col" style="padding: 14px;color: white;">Filtrar por:</h5>
                        </div>
                        <div class="input-group mb-3 col" style="margin-top: 5px;margin-bottom: 10px;height: 15px">
                            <select name="filtroprof" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option selected>Todo</option>
                                <option>Director</option>
                                <option>Actor/Actriz</option>
                            </select>
                            <button type="submit" class="btn btn-secondary">Filtrar</button>

                        </div>
                        <div class="input-group mb-3 col">
                        </div>
                    </div>
                </div>
            </form>
            <br>
            <div class="container">


                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Crear Actor/Director</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=crearprofesional" enctype="multipart/form-data">
                                    <div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">Nombre</span>
                                            <input name="nombre" type="text" class="form-control" placeholder="Nombre"
                                                   aria-label="Sala 1"
                                                   aria-describedby="button-addon1" required="required">
                                            <span class="input-group-text">Apellido</span>
                                            <input name="apellido" type="text" class="form-control" placeholder="Apellido"
                                                   aria-label="Sala 1"
                                                   aria-describedby="button-addon1" required="required">
                                        </div>
                                        <div class="input-group mb-3">
                                            <select name="profesion" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                                <option selected>Actor</option>
                                                <option>Director</option>
                                            </select>
                                        </div>
                                        <div class="input-group mb-3 ">
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="inputGroupFile01">Foto de Perfil</label>
                                                <input name="fotoperfil" type="file" class="form-control" id="inputGroupFile01">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar
                                        </button>
                                        <button type="submit" class="btn btn-primary">Crear</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">

                <% if (session.getAttribute("borrarPro") != null){%>
                <div>
                    <div class="alert alert-success" role="alert">
                        <%=session.getAttribute("borrarPro")%>
                    </div>
                </div>
                <%session.removeAttribute("borrarPro");%>
                <%}%>

                <% if (session.getAttribute("crearProf") != null){%>
                <div>
                    <div class="alert alert-success" role="alert">
                        <%=session.getAttribute("crearProf")%>
                    </div>
                </div>
                <%session.removeAttribute("crearProf");%>
                <%}%>


                <div class="row ">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="dataTables_length" id="tableUp_length">
                                <label></label>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-info buttonmargin" data-bs-toggle="modal"
                                        data-bs-target="#staticBackdrop">
                                    Agregar nuevo profesional
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
                                <th class="text-white">Foto</th>
                                <th class="text-white">Nombre y Apellido</th>
                                <th class="text-white">Rol</th>
                                <th class="text-white">Editar foto</th>
                                <th class="text-white">Eliminar</th>


                            </tr>
                        </thead>

                        <tbody>




                                        <%for (BProfesional p: listaProfesionales){
                                        String rol;
                                        if (p.getRol().equalsIgnoreCase("a")){
                                            rol= "Actor";
                                        }else{rol= "Director";}%>
                                    <tr>


                                            <td>

                                                    <img class="crop" src="${pageContext.request.contextPath}/Image?action=profesionales&id=<%=p.getIdProfesional()%>" alt="perfil foto" style="width:30px;height:30px;"/>

                                            </td>

                                        <td class="text-white"><%=p.getNombre()%> <%=p.getApellido()%> </td>
                                        <td class="text-white"><%=rol%> </td>



                                                <td>


                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal2<%=p.getIdProfesional()%>">
                                                        Editar
                                                    </button>

                                                    <!-- Modal -->
                                                    <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=actualizarfoto" enctype="multipart/form-data">
                                                        <div class="modal fade" id="exampleModal2<%=p.getIdProfesional()%>" tabindex="-1" aria-labelledby="exampleModalLabel2<%=p.getIdProfesional()%>" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 style="color: black" class="modal-title" id="exampleModalLabel">Editar</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div style="color: black" class="modal-body">
                                                                        <input type="hidden" name="id" value="<%=p.getIdProfesional()%>"/>
                                                                        <label class="input-group-text" for="inputGroupFile01">Foto de Perfil</label>
                                                                        <input type="file" class="form-control" name="fotonueva">

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>


                                        </td>

                                                <td>
                                                    <%if (p.getEnPelicula()==0){%>
                                                    <a href="<%=request.getContextPath()%>/ServAdmin?admin=borrarprofesional&proid=<%=p.getIdProfesional()%>"><button type="button" class="btn btn-danger btn-sm" >Borrar
                                                    </button></a>
                                                    <%} else {%>
                                                    <button disabled type="button" class="btn btn-danger btn-sm" >No aplica
                                                    </button>
                                                    <%}%>

                                        </td>


                                    </tr>
                                        <%}%>


                        </tbody>



                    </table>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
                crossorigin="anonymous"></script>
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
</html>
