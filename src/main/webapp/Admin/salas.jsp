<%@ page import="com.example.cinestudiar.beans.BSedeYSala" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.cinestudiar.funciones.Operaciones" %>
<%@ page import="com.example.cinestudiar.daos.AdminDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.cinestudiar.beans.BSedeYSala>" scope="request" id="listaSedes"/>

<html lang="es">
    <head>
        <meta charset='utf-8'>
        <link rel="icon" href=
                "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
              type="image/x-icon">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>admin_salas</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="Admin/style_admin.css">
    </head>
    <body class='snippet-body' STYLE="  background-image: url('Imagenes/fondo.jpg'); background-size: cover;">
        <jsp:include page="cabecera_admin.jsp"/>

        <ul class="nav nav-tabs topside" >

            <li class="nav-item topsidetxt "style="margin-left: 350px">
                <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/ServAdmin">Salas</a>
            </li>
            <li class="nav-item align-content-center"style="margin-left: 100px">
                <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=operador">Operadores</a>
            </li>
            <li class="nav-item align-content-center" style="margin-left: 120px">
                <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=cliente">Clientes</a>
            </li>
            <li class="nav-item align-content-center"style="margin-left: 80px">
                <a class="nav-link" href="<%=request.getContextPath()%>/ServAdmin?admin=profesional">Actores/Directores</a>
            </li>

        </ul>
        <div class="container" id="general">
            <div>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-info buttonmargin" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                    Crear Nueva Sala
                </button>

                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Crear Sala</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=crearsala">
                                    <div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">Aforo</span>
                                            <input placeholder="1-100" type="number" name="aforo" min="1" max="100" required="required">
                                        </div>
                                        <div class="input-group mb-3 ">
                                            <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                            <select name="sede" class="form-select" id="inputGroupSelect01">

                                                <option>Lima Cercado</option>
                                                <option>Pueblo Libre</option>
                                                <option>San Borja</option>
                                                <option>San Miguel</option>

                                            </select>
                                        </div>
                                        <div class="input-group mb-3 ">

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
                <div class="margintopsala">



                        <div class="accordion" id="accordionPanelsStayOpenExample">
                            <%int i = 0;%>
                            <%for (BSedeYSala se : listaSedes) {%>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingOne<%=i%>">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne<%=i%>" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne<%=i%>">
                                        <%=se.getSede()%>
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseOne<%=i%>" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne<%=i%>">
                                    <div class="accordion-body">

                                        <div>

                                            <%AdminDao adminDao = new AdminDao();
                                            ArrayList<BSedeYSala> listaSalas = adminDao.obtenerSaladeSede(se.getSede());%>

                                            <%for (BSedeYSala sa : listaSalas) {%>
                                            <form method="post" action="<%=request.getContextPath()%>/ServAdmin?admin=editaroborrarsala&id=<%=sa.getIdSala()%>">
                                                <div class="row">
                                                        <h4 class="shortwidth">Sala</h4>

                                                        <h4 class="shortwidth"><%=sa.getIdSala()%></h4>

                                                            <div class="input-group mb-3 col">
                                                                <span class="input-group-text">Aforo</span>
                                                                <input value="<%=sa.getAforoAdministrador()%>" type="number" name="aforo2" min="1"
                                                                       max="100">
                                                            </div>

                                                            <div class="input-group mb-3 col">
                                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                                <select name="sede2" class="form-select">
                                                                    <option selected><%=se.getSede()%></option>
                                                                    <%for (BSedeYSala se2 : listaSedes) {%>
                                                                    <%if (!se.getSede().equals(se2.getSede())) {%>
                                                                    <option><%=se2.getSede()%></option>
                                                                    <%}}%>
                                                                </select>
                                                            </div>

                                                            <div class="input-group mb-3 col">

                                                            </div>

                                                            <div class="input-group mb-3 col">
                                                                <button name="editar" type="submit" class="btn btn-success">Guardar</button>
                                                            </div>


                                                            <div class="input-group mb-3 col">
                                                                <%if (sa.getExisteFuncion()==0){%>
                                                                <button name="borrar" type="submit" class="btn btn-danger">Borrar</button>
                                                                <%} else{%>
                                                                <button disabled name="borrar" type="submit" class="btn btn-danger">No aplica</button>

                                                                <%}%>

                                                            </div>



                                                    <hr>
                                                </div>

                                            </form>


                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%i++;
                            }%>
                        </div>

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
