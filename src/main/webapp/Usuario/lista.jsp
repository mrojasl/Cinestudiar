<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 13/06/2022
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<html>
<head>
    <title>Lista Trabajos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
          crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="d-flex my-3">
            <a class="h2" href="<%=request.getContextPath()%>/JobServlet" style="text-decoration: none;">Lista de Trabajos</a>
            <a href="<%=request.getContextPath()%>/JobServlet?a=crear" class="btn btn-success ms-auto">Crear
                Trabajo</a>
        </div>
        <hr/>
        <form method="post" action="<%=request.getContextPath()%>/JobServlet?a=buscar">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Buscar por ID o título del trabajo"
                       aria-label="Buscar por ID o título del trabajo" aria-describedby="button-addon2"
                       name="textoBuscar" value="<%=textoBuscar%>" />
                <button class="btn btn-outline-info" type="button" id="button-addon2">Buscar</button>
            </div>
        </form>
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Job id</th>
                    <th>Job title</th>
                    <th>Min salary</th>
                    <th>Max salary</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1;
                    for (BJob job : listaTrabajos) { %>
                <tr>
                    <td><%=i %>
                    </td>
                    <td><%=job.getJobId() %>
                    </td>
                    <td><%=job.getJobTitle() %>
                    </td>
                    <td><%=job.getMinSalary() %>
                    </td>
                    <td><%=job.getMaxSalary() %>
                    </td>
                    <td><a href="<%=request.getContextPath()%>/JobServlet?a=editar&id=<%=job.getJobId() %>"
                           class="btn btn-primary">Editar</a></td>
                    <td><a href="<%=request.getContextPath()%>/JobServlet?a=borrar&id=<%=job.getJobId() %>"
                           class="btn btn-danger">Borrar</a></td>
                </tr>
                <% i++;
                } %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
</body>
</html>