<%--
  Created by IntelliJ IDEA.
  User: 124349
  Date: 30/06/2022
  Time: 03:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="indicador" scope="session" type="java.lang.String" class="java.lang.String"/>


<html>
    <head>
        <title>registros</title>
    </head>
    <body>
        <%=usuario.getCodigoPucp()%>
        <form method="post" action="<%=request.getContextPath()%>/loguin">
            <input type="number" name="codigo">
            <input type="password" name="password">
            <button type="submit" role="button"> iniciar</button>
        </form>
        <%if (session.getAttribute("indicador").equals("error")){%>
        </br>
        <div class="text-danger nb-2">
            Error en usuario o contraseña!!!
        </div>
        <%session.removeAttribute("indicador");%>
        <%}%>


    </body>
</html>
