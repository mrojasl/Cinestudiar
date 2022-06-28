
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header" >
        <h2>Cinestudiar</h2>
        <div class="nav">
            <a href="/Cinestudiar_war_exploded/Usuario/in_con_sesion.jsp" class="my-1 mx-1">Inicio⠀<i class="bi bi-house-fill"></i> </a>
            <a href="/Cinestudiar_war_exploded/PerfildeUsuario" class="my-1 mx-1">Mi perfil⠀<i class="bi bi-person-circle"></i></a>
            <a href="/Cinestudiar_war_exploded/Usuario/in_sin_sesion.jsp" class="my-1 mx-1">Cerrar Sesión⠀<i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</header>

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
