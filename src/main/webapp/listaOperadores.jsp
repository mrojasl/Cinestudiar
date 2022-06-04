<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.cinestudiar.beans.BUser" %><%--
  Created by IntelliJ IDEA.
  User: Jon
  Date: 4/06/2022
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%ArrayList<BUser> listaOperadores=(ArrayList<BUser>) request.getAttribute("listaOperadores");%>
<!DOCTYPE html>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
      <table>
        <tr>
          <th>Codigo PUCP</th>
          <th>Nombres</th>
          <th>Apellidos</th>
          <th>DNI</th>
        </tr>
        <%for (BUser u : listaOperadores){%>
        <tr>
          <td><%=u.getCodigoPucp()%></td>
          <td><%=u.getNombres()%></td>
          <td><%=u.getApellidos()%></td>
          <td><%=u.getDni()%></td>
        </tr>
        <%}%>
      </table>
    </body>
</html>
