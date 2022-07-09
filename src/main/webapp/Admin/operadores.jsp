<%@ page import="com.example.cinestudiar.beans.BUser" %>
<%@ page import="com.example.cinestudiar.servlets.AdminServlet" %>
<%@ page import="com.example.cinestudiar.beans.BUsuarioFuncion" %>
<%--
  Created by IntelliJ IDEA.
  User: Jon
  Date: 5/06/2022
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.cinestudiar.beans.BUser>" scope="request" id="listaOperadores"/>
<jsp:useBean type="java.lang.String" scope="request" id="txtbuscado" class="java.lang.String"/>
<html lang="en">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <head>
        <meta charset='utf-8'>
        <link rel="icon" href=
                "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
              type="image/x-icon">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>admin_operadores</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="Admin/style_admin.css">
    </head>
    <body class='snippet-body' STYLE="  background-image: url('Imagenes/fondo.jpg'); background-size: cover;">
        <jsp:include page="cabecera_admin.jsp"/>

        <ul class="nav nav-tabs topside">
            <li class="nav-item topsidetxt">
                <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/ServAdmin">Salas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<%=request.getContextPath()%>/ServAdmin?admin=operador">Operadores</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=cliente">Clientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=profesional">Actores/Directores</a>
            </li>
        </ul>
        <div id="general">
            <div>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary buttonmargin" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                    Asignar Operador
                </button>

                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Asignar Operador</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=crearoperador">
                                    <div>

                                        <div class="input-group mb-3">

                                            <span class="input-group-text">Codigo PUCP</span>
                                            <input name="operadorcodigo" type="text" class="form-control" placeholder="Código PUCP"
                                                   aria-label="Sala 1"
                                                   aria-describedby="button-addon1">

                                        </div>
                                        <div class="input-group mb-3 ">
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">Guardar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="supbarblue row">
                <div class="input-group mb-3 col">
                    <h5 class="col" style="padding: 14px;color: white;width: 250px">Lista de Operadores</h5>
                </div>
                <div class="input-group mb-3 col"style="margin-top: 6px;margin-right: 20px">
                </div>
                <div class="input-group mb-3 col"style="margin-top: 6px;margin-right: 20px">
                </div>
                <div class="input-group mb-3 col">
                    <h5 class="col" style="padding: 14px;color: white;width: 250px">Buscar por nombre:</h5>
                </div>
                <div class="input-group mb-3 col"style="margin-top: 6px;margin-right: 20px">
                    <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=buscaroperador">

                        <input name="txtbuscar" class="form-control" type="text" placeholder="Buscar por nombre"
                               aria-label="default input example" value="<%=txtbuscado%>">
                    </form>

                </div>
            </div>
            <div class="topmargin container" >

                <table class="table" id = "tableUp">

                    <tr>
                        <th class="text-white">Foto</th>
                        <th class="text-white">Nombre y Apellido</th>
                        <th class="text-white">Código PUCP</th>
                        <th class="text-white">Correo PUCP</th>
                        <th class="text-white">Celular</th>
                        <th class="text-white">Eliminar</th>


                    </tr>
                    <tbody>

                        <%
                            for (BUser op : listaOperadores) { %>

                        <tr>
                            <td class="text-white">
                                <img class="crop" src="${pageContext.request.contextPath}/Image?action=usuarios&id=<%=op.getCodigoPucp()%>" alt="perfil foto" style="width:30px;height:30px;"/>
                            </td>
                            <td class="text-white"><%=op.getNombres()%> </td>
                            <td class="text-white"><%=op.getCodigoPucp()%></td>
                            <td class="text-white"><%=op.getCorreo()%></td>
                            <td class="text-white"><%=op.getTelefono() %></td>
                            <td>
                                <a onclick="return confirm('¿Estas seguro de borrar?');"
                                   href="<%=request.getContextPath()%>/ServAdmin?admin=borraroperador&opcodigo=<%=op.getCodigoPucp()%>"
                                   type="button" class="btn btn-danger">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>


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