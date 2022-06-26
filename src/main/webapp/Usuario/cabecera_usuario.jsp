<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar ">
    <img src="Imagenes/cinestudiarlogo.png" href="<%=request.getContextPath()%>/inicio?action=registrado" >
    <div class="d-flex flex-row-revers">
        <a href="<%=request.getContextPath()%>/inicio?action=registrado">Inicio<i class="bi bi-house-fill"></i></a>

        <a href="<%=request.getContextPath()%>/Checkout">Carrito de compras<i class="bi bi-cart-fill"></i></a>
        <a href="<%=request.getContextPath()%>/PerfildeUsuario">Mi Perfil<i class="bi bi-person-circle"></i></a>
        <a href="<%=request.getContextPath()%>/inicio?action=cerrar">Cerrar Sesión⠀<i class="bi bi-box-arrow-right"></i></a>
    </div>

</div>
