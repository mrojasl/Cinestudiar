<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="Funciones" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BFuncion>"/>
<jsp:useBean id="listarFunciones" scope="request" type="java.lang.String"/>
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

<div class="container">
  <div class="row ">

    <table class="table" id = "tableUp">
      <head>
        <tr>
          <th class="text-white">IdFunción</th>
          <th class="text-white">Película</th>
          <th class="text-white">Fecha</th>
          <th class="text-white">Hora</th>
          <th class="text-white">Sede</th>
          <th class="text-white">Sala</th>
          <th class="text-white">Precio de ticket</th>
          <th class="text-white">Calificacion Promedio</th>

        </tr>
      </head>
      <tbody>

      <%

        for (BFuncion funcion : Funciones) { %>

      <tr>
        <td class="text-white"><%=funcion.getIdFuncion()%></td>
        <td class="text-white"><%=funcion.getPelicula()%> </td>
        <td class="text-white"><%=funcion.getFecha()%></td>
        <td class="text-white"><%=funcion.getHora()%></td>
        <td class="text-white"><%=funcion.getSede() %></td>
        <td class="text-white"><%=funcion.getIdSala()%></td>
        <td class="text-white">S/. <%=funcion.getPrecioTicket()%></td>
        <% int num= (int) funcion.getCalificacion();%>
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
