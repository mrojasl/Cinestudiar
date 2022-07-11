<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BCarrito"%>
<%@ page import="java.util.Objects" %>

<jsp:useBean id="indicadorCompraexitosa" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="indicadorComprafallida" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="Borrarboton" scope="session" type="java.lang.String" class="java.lang.String"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Gracias por tu Compra :D</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

<% int contador_carrito=0;
    Integer hitsCount = (Integer)application.getAttribute("hitCounter");
    Integer hitsCountresta = (Integer)application.getAttribute("hitCounterresta"); %>


<%

    if( hitsCount ==null || hitsCount == 0 )
    {
        /* First visit */
        hitsCount = 2;
    }
    else
    {
        hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
%>

<%

    if( hitsCountresta ==null || hitsCountresta == 0 )
    {
        /* First visit */
        hitsCountresta = 1;
    }
    else
    {
        hitsCountresta += 1;
    }
    application.setAttribute("hitCounterresta", hitsCountresta);
%>
<!-- Button trigger modal -->
<script>
    $(document).ready(function(){
        $("#staticBackdrop").modal('show');
    });
</script>



<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"></h5>

            </div>

            <div class="modal-footer">
<%--                <%if (session.getAttribute("indicadorCompraexitosa") !="xd"){%>--%>


                <%if (Objects.equals(session.getAttribute("indicadorCompraexitosa"), "BuenaCompra")) {%>
                    <script>
                        document.getElementById('staticBackdropLabel').innerHTML = 'Compra Realizada con Éxito';
                    </script>
                <div class="modal-body">


                    <p> Se ha realizado la compra con éxito.<br>
                        Puedes ver tus tickets en el perfil de usuario.<br>
                        Los Datos de ingreso han sido enviados a su correo electrónico ;)</p>
                    <a href="<%=request.getContextPath()%>/Checkout"><button type="button" class="btn btn-success">Volver a mi Carrito de Compras</button></a>
                </div>
                <%session.removeAttribute("indicadorCompraexitosa");%>
                <%session.removeAttribute("Borrarboton");%>
                <%}%>

<%--                <%if (session.getAttribute("indicadorComprafallida") !=null){%>--%>

                <%if (Objects.equals(session.getAttribute("indicadorComprafallida"), "CompraFallida")) {%>
                    <script>
                         document.getElementById('staticBackdropLabel').innerHTML = 'Proceso de Compra Fallido';
                    </script>

                <div class="modal-body">
                    <p>Proceso de compra fallido, existe una o más funciones<br>
                       Las cuales ya no cuentan con el stock requerido. Por favor<br>
                       Verifica la cantidad de tickets nuevamente en la página del<br>
                       Carrito de compras.</p>
                    <a href="<%=request.getContextPath()%>/Checkout"><button type="button" class="btn btn-success">Volver a mi Carrito de Compras</button></a>
                </div>
                <%session.removeAttribute("indicadorComprafallida");%>
                <%session.removeAttribute("Borrarboton");%>
               <%}%>

                <%if (session.getAttribute("Borrarboton") !=null ) {%>
                    <script>
                        document.getElementById('staticBackdropLabel').innerHTML = 'Procesando compra...';
                    </script>
                <div class="modal-body">
                    <p>Se está procesando su orden y comprobando su cantidad de tickets requeridos con el sistema<br>
                        Espere, por favor.</p>
                    <form id="formularioenvio"  method="POST" action="<%=request.getContextPath()%>/ola?a=yacompro">
<%--                        <button id= "cambios" type="submit" class="btn btn-outline-info" >COMPRACOMPRACOMPRACOMPRACOMPRA</button>--%>
                    </form>
                    <script type="text/javascript">
                        function formAutoSubmit () {
                            var frm = document.getElementById("formularioenvio");
                            frm.submit();
                        }
                        window.onload = formAutoSubmit;
                    </script>
                </div>
                <%}%>





<%--                <div class="modal-body">--%>
<%--                    --Orden Procesada----%>
<%--                    <% hitsCountresta=0;%>--%>
<%--                    <br>--%>
<%--                    Se ha realizado la compra con éxito.<br>--%>
<%--                    Puedes ver tus tickets en el perfil de usuario.<br>--%>
<%--                    Los Datos de ingreso han sido enviados a su correo electrónico =)--%>
<%--                    <br>--%>
<%--                    <br>--%>
<%--                    --%>
<%--                </div>--%>



            </div>



        </div>
    </div>
</div>
</body>

<%--<script>window.onload = function(){--%>
<%--    var button = document.getElementById('cambios');--%>
<%--    setInterval(function(){--%>
<%--        button.click();--%>
<%--    },100);  // this will make it click again every 50 miliseconds--%>
<%--};</script>--%>



</html>