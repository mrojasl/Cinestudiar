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
        <jsp:include page="cabecera_admin.jsp"/>

        <ul class="nav nav-tabs topside">
            <li class="nav-item topsidetxt">
                <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/ServAdmin">Salas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=operador">Operadores</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<%=request.getContextPath()%>/ServAdmin?admin=cliente">Clientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=profesional">Actores/Directores</a>
            </li>
        </ul>
        <div id="general">
            <br>
            <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=filtrosede">

                <div class="supbarblue row">
                    <div class="input-group mb-3 col">
                        <h5 class="col" style="padding: 14px;color: white;width: 250px">Lista de Clientes</h5>
                    </div>

                    <div class="input-group mb-3 col">
                    </div>
                    <div class="input-group mb-3 col">
                        <h5 class="col" style="padding: 14px;color: white;width: 250px">Filtrar por sede:</h5>
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

            </form>

            <div class="topmargin container">

                <table class="table" id = "tableUp">

                    <tr>
                        <th class="text-white">Foto</th>
                        <th class="text-white">Nombre y Apellido</th>
                        <th class="text-white">Código PUCP</th>
                        <th class="text-white">Correo PUCP</th>
                        <th class="text-white">Celular</th>
                        <th class="text-white">Historial</th>

                    </tr>
                    <tbody>

                        <%for (BUser cl : listaClientes) { %>

                        <tr>
                            <td class="text-white">
                                <img class="crop" src="${pageContext.request.contextPath}/Image?action=usuarios&id=<%=cl.getCodigoPucp()%>" alt="perfil foto" style="width:30px;height:30px;"/>
                            </td>
                            <td class="text-white"><%=cl.getNombres()%> </td>
                            <td class="text-white"><%=cl.getCodigoPucp()%></td>
                            <td class="text-white"><%=cl.getCorreo()%></td>
                            <td class="text-white"><%=cl.getTelefono() %></td>
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
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
                crossorigin="anonymous"></script>
    </body>
</html>