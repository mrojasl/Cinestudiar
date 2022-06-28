<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 27/06/2022
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<jsp:useBean id="Funciones" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BFuncion>"/>
<jsp:useBean id="listarFunciones" scope="request" type="java.lang.String"/> --%>

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
<body class='snippet-body' bgcolor="#191970">
<section class="administrador">
    <h3 class="mt-1 p-0 mb-0 ">Operador</h3>
</section>
<section>
    <ul class="navbar navbar-dark bg-dark">
        <li class="nav-item">
            <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe" class="navbar-brand" aria-current="page">Crear Película</a>
        </li>
        <li class="nav-item">
            <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearFu" class="navbar-brand" aria-current="page">Crear Función</a>
        </li>
        <li class="nav-item">
            <a  href="<%=request.getContextPath()%>/OperadorServlet?action=peliculas" class="navbar-brand">Películas</a>
        </li>
        <li class="nav-item">
            <a  href="<%=request.getContextPath()%>/OperadorServlet?action=funciones" class="navbar-brand">Funciones</a>
        </li>
    </ul>

</section>
<section>
    <div id="crear" class="container tab-pane active">
        <div class="col-lg-6 bg-indigo text-white ui-icon-background">
            <div class="p-5">
                <h3 class="fw-normal mb-5">Crear Película</h3>

                <div class="mb-4 pb-2">
                    <div class="form-outline form-white">
                        <input type="text" id="nombre_peli" class="form-control form-control-lg">
                        <label class="form-label" for="nombre_peli" style="margin-left: 0px;">Nombre de Película</label>
                        <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 70.4px;"></div><div class="form-notch-trailing"></div></div></div>
                </div>
                <div class="row">
                    <div class="col-md-5 mb-4 pb-2">

                        <div class="form-outline form-white">
                            <input type="text" id="duracion" class="form-control form-control-lg">
                            <label class="form-label" for="duracion" style="margin-left: 0px;">Duración</label>
                            <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 58.4px;"></div><div class="form-notch-trailing"></div></div></div>

                    </div>
                    <div class="col-md-7 mb-4 pb-2">

                        <div class="form-outline form-white">
                            <select type="text" id="form3Examplea5" class="form-control form-control-lg">
                                <option selected></option>
                                <option value="1">Two</option>
                                <option value="2">Three</option>
                                <option value="3">Four</option>
                            </select>
                            <label class="form-label" for="form3Examplea5" style="margin-left: 0px;">Género</label>
                            <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 40px;"></div><div class="form-notch-trailing"></div></div></div>

                    </div>
                </div>


                <div class="mb-2 pb-2">
                    <div class="form-outline form-white">
                        <input type="file" id="imagenpeliculas" class="btn btn-primary form-control form-control-lg">
                        <label class="form-label" for="imagenpeliculas" style="margin-left: 0px;">Foto</label>
                        <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 52.8px;"></div><div class="form-notch-trailing"></div></div></div>
                </div>


                <button type="button" class="btn btn-light btn-lg" data-mdb-ripple-color="dark">Crear</button>

            </div>
        </div>
    </div>
</section>
</body>
</html>
