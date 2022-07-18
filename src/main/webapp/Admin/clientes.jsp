<%@ page import="com.example.cinestudiar.beans.BUser" %>
<%@ page import="com.example.cinestudiar.beans.BCompra" %>
<%--
  Created by IntelliJ IDEA.
  User: Jon
  Date: 5/06/2022
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.cinestudiar.beans.BUser>" scope="request" id="listaClientes"/>
<jsp:useBean type="java.util.ArrayList<com.example.cinestudiar.beans.BCompra>" scope="request" id="historialdecompracliente"/>
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<html lang="en">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <head>
        <meta charset='utf-8'>
        <link rel="icon" href=
                "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
              type="image/x-icon">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>admin_clientes</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
       <link rel="stylesheet" href="Admin/style_admin.css">
    </head>
    <body class='snippet-body' STYLE="  background-image: url('Imagenes/fondo.jpg'); background-size: cover;">
    <jsp:include page="cabecera_admin.jsp">
        <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
    </jsp:include>
        <style type="text/css">
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
        </style>

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
                    <a class="nav-link active" href="<%=request.getContextPath()%>/ServAdmin?admin=cliente">Clientes</a>
                </li>
                <li class="nav-item align-content-center"style="margin-left: 80px">
                    <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=profesional">Actores/Directores</a>
                </li>

            </ul>
        </section>
        <div id="general">
            <br>
            <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=filtrosede">
            <div class="container">
                <div class="supbarblue row">
                    <div class="input-group mb-3 col">
                        <h5 class="col" style="padding: 14px;color: white;width: 250px">Lista de Clientes</h5>
                    </div>

                    <div class="input-group mb-3 col">
                    </div>
                    <div class="input-group mb-3 col">
                    </div>
                    <div class="input-group mb-3 col">
                        <h5 class="col" style="padding: 14px;color: white;">Sede:</h5>
                    </div>
                    <div class="input-group mb-3 col" style="margin-top: 5px;margin-bottom: 10px;height: 15px">

                        <select name="filtrosede" class="form-select form-select-sm" aria-label=".form-select-sm example">
                            <option selected>Sin Filtro</option>
                            <option>Lima Cercado</option>
                            <option>Pueblo Libre</option>
                            <option>San Borja</option>
                            <option>San Miguel</option>
                        </select>
                        <button type="submit" class="btn btn-secondary">Filtrar</button>
                    </div>
                    <div class="input-group mb-3 col">
                    </div>
                </div>
            </div>
            </form>
            <br>
            <div class="container" >
            <section class="seccion-perfil-usuario">
                <div class="perfil-usuario-nuevo">

                <div class="row ">
                        <table class="table table-striped table-hover" id = "tableUp">
                            <thead>
                                <tr>
                                    <th class="text-black">Foto</th>
                                    <th class="text-black">Nombre y Apellido</th>
                                    <th class="text-black">Código PUCP</th>
                                    <th class="text-black">Correo PUCP</th>
                                    <th class="text-black">Celular</th>
                                    <th class="text-black">Historial</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%for (BUser cl : listaClientes) { %>

                                <tr>
                                    <td class="text-black">
                                        <img class="crop" src="${pageContext.request.contextPath}/Image?action=usuarios&id=<%=cl.getCodigoPucp()%>" alt="perfil foto" style="width:30px;height:30px;"/>
                                    </td>
                                    <td class="text-black"><%=cl.getNombres()%> </td>
                                    <td class="text-black"><%=cl.getCodigoPucp()%></td>
                                    <td class="text-black"><%=cl.getCorreo()%></td>
                                    <td class="text-black"><%=cl.getTelefono() %></td>
                                    <td>

                                        <!-- Button trigger modal -->
                                        <button style="" type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal<%=cl.getCodigoPucp()%>">
                                            Historial de compras
                                        </button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal<%=cl.getCodigoPucp()%>" tabindex="-1" aria-labelledby="exampleModalLabel<%=cl.getCodigoPucp()%>" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 style="color:black;" class="modal-title" id="exampleModalLabel2">Historia de compras</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div style="color: black" class="modal-body">

                                                        <%for (BCompra com : historialdecompracliente) {%>

                                                        <%if (cl.getCodigoPucp().equals(com.getCodigoPucp())) {%>

                                                        <h5><Strong>S/<%=com.getPago_total()%></Strong></h5>
                                                        <p><%=com.getFecha_compra()%> - <%=com.getHora_compra()%> - Tickets:<%=com.getCantidad_tikets()%></p>
                                                        <hr>
                                                        <%}
                                                        }%>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </td>


                                </tr>

                                <%
                                    } %>
                            </tbody>


                        </table>
                </div>
                </div>
            </section>
                <br>

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
                        search: "Buscar:",
                        lengthMenu: "Agrupar de _MENU_ ",
                        info: "",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "",
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
                    scrollY: 410,
                    lengthMenu: [ [7, 15, -1], [7, 15, "All"] ],
                });
            });
        </script>
    </body>
</html>