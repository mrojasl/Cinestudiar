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
<style type="text/css">
    /*=====================================
    estilos
    =====================================*/

    .navbar{
        position: relative;
        width: 100%;
        padding: 20px 10px;
        background-color: #003f9e;
    }
    .navbar img{
        width:300px;
        height:80px;
    }
    .navbar a{
        position: relative;
        color:white;
        text-decoration: none;
        margin-right: 18px;
    }
    .navbar a[id=forgot]{
        position: relative;
        left:65%;
        color: #78261f;
        text-decoration: none;
    }

    body {
        background-color: #3C3C41FF;
    }
    header{
        background-color: #003f9e;
        width: auto;
        height: 11vh;
        color: white;
    }
    header h2{
        position: absolute;
        left: 10%;
        top:4%;
    }
    .elementos{
        position: absolute;
        left: 25%;
    }
    .elementos a{
        position: relative;
        left:65%;
        top:0%;
        color:white;
        text-decoration: none;
        margin-right: 5px;
    }
    .administrador{
        background-color: #7e7878;
        width: auto;
        height: 6vh;
    }
    .administrador h3{
        position: absolute;
        color: #ece9e9;
        left: 50%;
    }
    html {
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
        text-size-adjust: 100%;
        line-height: 1.4;
    }
    .nav b{
        position: relative;
        left:25%;
        text-decoration: none;
        margin-right: 10px;
    }

    * {
        margin: 0;
        padding: 0;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    body {
        color: #404040;
        font-family: "Arial", Segoe UI, Tahoma, sans-serifl, Helvetica Neue, Helvetica;
    }

    /*=====================================
    estilos de la utilidad

    =====================================*/
    .seccion-perfil-usuario .perfil-usuario-body,
    .seccion-perfil-usuario {
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
        align-items: center;
    }



    .seccion-perfil-usuario .perfil-usuario-body {
        width: 70%;
        position: relative;
        max-width: 750px;
        margin-bottom: 0.5rem;
        margin-top: 0.5rem;
    }
    .seccion-perfil-usuario .perfil-usuario-nuevo{
        width: 95%;
        position: relative;
        background-color: #fff;
        max-width: 1200px;
        border-radius: 15px;
        padding: 1.5rem 2rem;

    }

    .seccion-perfil-usuario .perfil-usuario-body .titulo {
        display: block;
        width: 100%;
        font-size: 1.75em;
        margin-bottom: 0.5rem;
        margin-top: 0.5rem;
    }

    .seccion-perfil-usuario .perfil-usuario-body .texto {
        color: #848484;
        font-size: 0.95em;
    }

    .seccion-perfil-usuario .perfil-usuario-footer,
    .seccion-perfil-usuario .perfil-usuario-bio {
        display: flex;
        flex-wrap: wrap;
        padding: 0.75rem 1rem;
        box-shadow: 0 0 12px rgba(0, 0, 0, .2);
        background-color: #fff;
        border-radius: 15px;
        width: 100%;
    }

    .seccion-perfil-usuario .perfil-usuario-bio {
        margin-bottom: 1rem;
        text-align: center;
    }






    .container > .crop {
        position:absolute;
        left: -100%;
        right: -100%;
        top: -100%;
        bottom: -100%;
        margin: auto;
        min-height: 100%;
        min-width: 100%;
    }
    /* adactacion a dispositivos */
    @media (max-width: 750px) {
        .seccion-perfil-usuario .lista-datos {
            width: 100%;
        }

        .seccion-perfil-usuario .perfil-usuario-portada,
        .seccion-perfil-usuario .perfil-usuario-body {
            width: 95%;
        }

    }
</style>
<br>
<br>
<br>
<section class="seccion-perfil-usuario">
    <br>
    <br>
    <div class="perfil-usuario-nuevo">
        <div align="center">
        <h2>Reporte en formato txt</h2>
        </div>
        <br>
        <div class="container" style="color: #89e2c2">
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
        </div>

<br>
<div align="center">
<button id="btnExportToCsv" class="btn btn-success" >EXPORTAR</button>
</div>
    </div>
</section>
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
