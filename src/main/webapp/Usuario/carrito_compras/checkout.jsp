<%@ page import="com.example.cinestudiar.beans.BCarrito" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<jsp:useBean type="java.util.ArrayList<com.example.cinestudiar.beans.BCarrito>" scope="request" id="carritoCliente"/>




<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>




    <meta charset='utf-8'>
    <link rel = "icon" href =
            "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
          type = "image/x-icon">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Checkout-CinEstudiar</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
    <link rel="stylesheet" href="chekout.css" media="screen" title="no title" charset="utf-8">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">









</head>
<body oncontextmenu='xd' class='snippet-body'>
<jsp:include page="cabecera_usuario.jsp"/>

<div class="tabla">
    <table class="table table-dark table-transparent table-hover">
        <thead>
        <th>ID</th>
        <th>Nombre</th>
        <th>Categorias</th>
        <th>Peliculas</th>
        </thead>
        <%
            for (BCarrito x : carritoCliente) {
        %>
        <tr>
            <td><%=x.getNombres()%>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
