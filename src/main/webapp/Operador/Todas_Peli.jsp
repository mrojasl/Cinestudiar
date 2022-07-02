<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="Peliculas" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean id="listarPeliculas" scope="request" type="java.lang.String"/>
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
      <a  href="<%=request.getContextPath()%>/OperadorServlet?action=peliculas" class="navbar-brand">Películas</a>
    </li>
    <li class="nav-item">
      <a  href="<%=request.getContextPath()%>/OperadorServlet?action=funciones" class="navbar-brand">Funciones</a>
    </li>
    <li class="nav-item">
      <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe" class="navbar-brand" aria-current="page">Actores</a>
    </li>
    <li class="nav-item">
      <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearFu" class="navbar-brand" aria-current="page">Directores</a>
    </li>
  </ul>

</section>
<section>
  <div class="d-flex justify-content-start">
    <div class="navbar navbar-expand-lg navbar-dark bg-primary">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe">Crear Película</a>
    </div>
  </div>
</section>
<form method="POST" class = "d-flex justify-content-around" action="<%=request.getContextPath()%>/OperadorServlet?action=filtro_peli">
  <div class="d-flex justify-content-around">


    <div class="form-outline form-white">
      <label class="fw-bold mx-1 my-2 text-white" >Ordenar por:</label>
      <select id ="selection_option" name="listarPeliculas" class=" form-control form-control-lg" onchange="update()" >
        <option selected value="defecto"<%=listarPeliculas.equals("defecto")?"selected":""%>>Selecione su opción</option>
        <option value="Mejor calificado" <%=listarPeliculas.equals("Mejor calificado")?"selected":""%>>Mejor calificado</option>
         </select>
    </div>
    <div class="outline">
      <button type = "submit" class = "form-control form-control-lg text-white" style="background-color: #003f9e; text-decoration-color: #dedee1">Filtrar</button>
    </div>
  </div>
</form>
<div class="container">
  <div class="row ">

    <table class="table" id = "tableUp">
      <head>
        <tr>
          <th class="text-dark">IdPelícula</th>
          <th class="text-dark">Película</th>
          <th class="text-dark">Duración</th>
          <th class="text-dark">Género</th>
          <th class="text-dark">Calificacion Promedio</th>

        </tr>
      </head>
      <tbody>

      <%

        for (BPeliculas peliculas : Peliculas) { %>

      <tr>
        <td class="text-dark"><%=peliculas.getIdpeliculas()%></td>
        <td class="text-dark"><%=peliculas.getNombre()%> </td>
        <td class="text-dark"><%=peliculas.getDuracion()%> minutos</td>
        <td class="text-dark"><%=peliculas.getGenero()%></td>
        <% int num= (int) peliculas.getCalificacion();%>
        <%if (num == 1){ %>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star"></td>
        <td class="fa fa-star"></td>
        <td class="fa fa-star"></td>
        <td class="fa fa-star"></td>
        <%}%>
        <%if(num==2){%>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star"></td>
        <td class="fa fa-star"></td>
        <td class="fa fa-star"></td>
        <%}%>
        <%if(num==3){%>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star"></td>
        <td class="fa fa-star"></td>
        <%}%>
        <%if(num==4){%>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star"></td>
        <%}%>
        <%if(num==5){%>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <td class="fa fa-star checked"></td>
        <%}%>
      </tr>

      <%
        } %>
      </tbody>

      <!-- Large modal -->

    </table>
  </div>
</div>



</body>
</html>





