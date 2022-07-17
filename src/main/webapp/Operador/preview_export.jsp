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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.1.3/minty/bootstrap.min.css"/>
</head>
<body>
<table class="table" id = "dataTable">
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
<button id="btnExportToCsv" class="btn btn-success">EXPORTAR</button>
<script>
    const dataTable = document.getElementById("dataTable");
    const btnExportToCsv = document.getElementById("btnExportToCsv");

    btnExportToCsv.addEventListener("click", () => {
        const exporter = new TableCSVExporter(dataTable);
        const csvOutput = exporter.convertToCSV();
        const csvBlob = new Blob([csvOutput], { type: "text/csv" });
        const blobUrl = URL.createObjectURL(csvBlob);
        const anchorElement = document.createElement("a");

        anchorElement.href = blobUrl;
        anchorElement.download = "reporte.txt";
        anchorElement.click();

        setTimeout(() => {
            URL.revokeObjectURL(blobUrl);
        }, 500);
    });
</script>
<script>
    class TableCSVExporter {
        constructor (table, includeHeaders = true) {
            this.table = table;
            this.rows = Array.from(table.querySelectorAll("tr"));

            if (!includeHeaders && this.rows[0].querySelectorAll("th").length) {
                this.rows.shift();
            }
        }

        convertToCSV () {
            const lines = [];
            const numCols = this._findLongestRowLength();

            for (const row of this.rows) {
                let line = "";

                for (let i = 0; i < numCols; i++) {
                    if (row.children[i] !== undefined) {
                        line += TableCSVExporter.parseCell(row.children[i]);
                    }

                    line += (i !== (numCols - 1)) ? "," : "";
                }

                lines.push(line);
            }

            return lines.join("\n");
        }

        _findLongestRowLength () {
            return this.rows.reduce((l, row) => row.childElementCount > l ? row.childElementCount : l, 0);
        }

        static parseCell (tableCell) {
            let parsedValue = tableCell.textContent;

            // Replace all double quotes with two double quotes
            parsedValue = parsedValue.replace(/"/g, `""`);

            // If value contains comma, new-line or double-quote, enclose in double quotes
            parsedValue = /[",\n]/.test(parsedValue) ? `"${parsedValue}"` : parsedValue;

            return parsedValue;
        }
    }

</script>
</body>
</html>
