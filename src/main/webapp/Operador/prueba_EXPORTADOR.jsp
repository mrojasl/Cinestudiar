<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 16/07/2022
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page import="com.example.cinestudiar.beans.BSedeYSala" %>
<%@ page import="com.example.cinestudiar.beans.BEquipoLimpieza" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="Reporte" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BFuncion>" />

<html>
<head>
    <title>Exportar</title>
</head>
<body>
<table class="table" id = "tableUp2">
    <tr>
        <th class="text-white">Sala</th>
        <th class="text-white">Funcion</th>
        <th class="text-white">nombre</th>
        <th class="text-white">fecha</th>
        <th class="text-white">hora</th>
        <th class="text-white">aforo</th>

    </tr>
    <tbody>

        <%for (BFuncion repor : Reporte) { %>

    <tr>
        <td class="text-white"><%=repor.getIdSala()%></td>
        <td class="text-white"><%=repor.getIdFuncion()%> </td>
        <td class="text-white"><%=repor.getNombre()%></td>
        <td class="text-white"><%=repor.getFecha()%></td>
        <td class="text-white"><%=repor.getHora() %></td>
        <td class="text-white"><%=repor.getAforoOperador() %></td>

    </tr>
        <% } %>
</table>

</body>
</html>
