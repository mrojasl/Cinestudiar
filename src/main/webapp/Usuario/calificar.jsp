
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BProfesional" %>




<jsp:useBean id="historial" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="listaProfesionales" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BProfesional>"/>


<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <form class="form-login" method="POST" action="<%=request.getContextPath()%>/calificacion?a=calificar">
            <input type="hidden" name="historial" value="<%=historial%>">
            <div class="mb-3 mt-3 ms-4 me-4">
                <input type="number" class="form-control" name="funcion" placeholder="funcion" required>
            </div>
            <%if (listaProfesionales.size()!=0 ){%>

            <%for (BProfesional pf : listaProfesionales){%>
            <%if (pf.getRol().equals("d")){%>
            <div class="mb-3 mt-3 ms-4 me-4">
                <label >Calificacion Director:</label>
            </div>
            <tr><%=pf.getNombre() + pf.getApellido()%></tr>
            <div class="mb-3 mt-3 ms-4 me-4">
                <input type="number" max="5" min="0" class="form-control" name="director<%=pf.getIdProfesional()%>" placeholder="director" required>
                <input type="hidden" name="idprofesionaldirector<%=pf.getIdProfesional()%>" value="<%=pf.getIdProfesional()%>">
            </div>
            <%}%>
            <%}%>
            <label >Calificacion Actores:</label>
            <%for (BProfesional pf : listaProfesionales){%>
            <%if (pf.getRol().equals("a")){%>
            <tr><%=pf.getNombre() + pf.getApellido()%></tr>
            <div class="mb-3 mt-3 ms-4 me-4">
                <input type="number" class="form-control" max="5" min="0" name="actor<%=pf.getIdProfesional()%>" placeholder="actor" required>
                <input type="hidden" name="idprofesionalactor<%=pf.getIdProfesional()%>" value="<%=pf.getIdProfesional()%>">
            </div>
            <%}%>
            <%}%>

            <%}%>
            <div class="mb-3 mt-4">
                <button type="submit" class="btn btn-outline-info rounded">Calificar</button>
            </div>
        </form>

    </body>
</html>
