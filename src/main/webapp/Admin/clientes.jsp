<%@ page import="com.example.cinestudiar.beans.BUser" %>
<%--
  Created by IntelliJ IDEA.
  User: Jon
  Date: 5/06/2022
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.cinestudiar.beans.BUser>" scope="request" id="listaClientes"/>
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
        <title>admin_clientes</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="Admin/style_admin.css">
    </head>
    <body class='snippet-body'>
        <jsp:include page="cabecera_admin.jsp"/>

        <ul class="nav nav-tabs topside">
            <li class="nav-item topsidetxt">
                <a class="nav-link" aria-current="page" href="adminsalas">Salas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="adminoperador">Operadores</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="admincliente">Clientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="adminprofesionales">Actores/Directores</a>
            </li>
        </ul>
        <div id="general">
            <br>
            <div class="supbarblue row">
                <div class="input-group mb-3 col">
                    <h5 class="col" style="padding: 14px;color: white;width: 250px">Lista de Clientes</h5>
                </div>
                <div class="input-group mb-3 col">
                    <h5 class="col" style="padding: 14px;color: white;width: 250px">Ordenar por:</h5>
                </div>
                <div class="input-group mb-3 col"style="margin-top: 10px;height: 20px">
                    <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                        <option selected>Más compras</option>
                        <option value="1">Más antiguos</option>
                        <option value="2">Más recientes</option>
                    </select>
                </div>
                <div class="input-group mb-3 col">
                </div>
                <div class="input-group mb-3 col">
                    <h5 class="col" style="padding: 14px;color: white;width: 250px">Filtar por sede:</h5>
                </div>
                <div class="input-group mb-3 col"style="margin-top: 10px;height: 20px">
                    <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                        <option selected>San Miguel</option>
                        <option value="1">Miraflores</option>
                        <option value="2">Surco</option>
                        <option value="2">Pueblo Libre</option>
                    </select>
                </div>
            </div>
            <div class="topmargin">

                <div>
                    <%for (BUser cl : listaClientes) {%>
                    <div class="row">
                        <div class="input-group mb-3 col">
                            <img src="perfil_foto.png" alt="perfil foto" style="width:100px;height:100px;">
                        </div>

                        <div class="input-group mb-3 col">
                            <h6>Nombre:<br><%=cl.getNombres()+""+cl.getApellidos()%> <br><br>Código PUCP:<br><%=cl.getCodigoPucp()%></h6>
                        </div>
                        <div class="input-group mb-3 col">
                            <h6>Correo PUCP:<br><%=cl.getCorreo()%> <br><br>Celular:<br><%=cl.getTelefono()%></h6>
                        </div>
                        <div class="input-group mb-3 col">
                        </div>
                        <div class="input-group mb-3 col">

                            <!-- Button trigger modal -->
                            <button style="height: 40px;margin-top: 30px" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                                Historial de compras
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 style="color:black;" class="modal-title" id="exampleModalLabel2">Historia de compras</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div style="color: black" class="modal-body">
                                            <h5><Strong>NombreFuncion1</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion2</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion3</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion4</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion5</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion6</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion7</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion8</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion9</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion10</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion11</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion12</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion13</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion14</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion15</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                            <h5><Strong>NombreFuncion16</Strong></h5>
                                            <p>01/02/2022 - 17:00-19:00 - Tickets:1 -<strong> TOTAL: S/30.00</strong></p>
                                            <hr>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>









                        </div>
                        <hr>
                    </div>
                    <%}%>




                </div>
            </div>
        </div>
    </body>
</html>