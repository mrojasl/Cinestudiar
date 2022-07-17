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

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Exportar</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.1.3/minty/bootstrap.min.css"
    />
</head>
<body>
<table class="table" id = "example">
    <thead class="thead-dark">
        <tr>
            <th class="text-dark">Sala</th>
            <th class="text-dark">Funcion</th>
            <th class="text-dark">nombre</th>
            <th class="text-dark">fecha</th>
            <th class="text-dark">hora</th>
            <th class="text-dark">aforo</th>

        </tr>
    </thead>
    <tbody>

        <%for (BFuncion repor : Reporte) { %>

    <tr>
        <td class="text-dark"><%=repor.getIdSala()%></td>
        <td class="text-dark"><%=repor.getIdFuncion()%> </td>
        <td class="text-dark"><%=repor.getNombre()%></td>
        <td class="text-dark"><%=repor.getFecha()%></td>
        <td class="text-dark"><%=repor.getHora() %></td>
        <td class="text-dark"><%=repor.getAforoOperador() %></td>
        <% } %>
    </tr>

</table>
<button id="txt" class="btn btn-success">EXPORTAR</button>
<script
        src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"
></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.6/jspdf.plugin.autotable.min.js"></script>
<script src="./tableHTMLExport.js"></script>
<script>
    $("#json").on("click", function () {
        $("#example").tableHTMLExport({
            type: "json",
            filename: "sample.json",
        });
    });
    $("#csv").on("click", function () {
        $("#example").tableHTMLExport({ type: "csv", filename: "sample.csv" });
    });
    $("#pdf").on("click", function () {
        $("#example").tableHTMLExport({ type: "pdf", filename: "sample.pdf" });
    });
    $("#txt").on("click", function () {
        $("#example").tableHTMLExport({ type: "txt", filename: "sample.txt" });
    });
</script>
</body>
</html>
