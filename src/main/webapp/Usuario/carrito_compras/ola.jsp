<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BCarrito"%>
<jsp:useBean id="carritodecompras" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BCarrito>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Example of Auto Loading Bootstrap Modal on Page Load</title>
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
        hitsCount = 3;
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
        hitsCountresta = 1000;
    }
    else
    {
        hitsCountresta += 1;
    }
    application.setAttribute("hitCounterresta", hitsCountresta);
%>
<p STYLE="font-size: 50px"> <%=hitsCountresta%>></p>
<!-- Button trigger modal -->
<script>
    $(document).ready(function(){
        $("#staticBackdrop").modal('show');
    });
</script>
<% int contador= carritodecompras.size(); %>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Compra Realizada con Éxito</h5>

            </div>

            <div class="modal-footer">


                <% if (contador!=0) {%>
                <div class="modal-body">
                    Se está procesando su orden, NO CIERRE ESTA VENTANA!!
                </div>
                <% } %>
                <% if (contador==0) {%>

                <div class="modal-body">
                    --Orden Procesada--
                    <% hitsCountresta=0;%>
                    <br>
                    <%=hitsCountresta%>
                    Se ha realizado la compra con éxito.<br>
                    Puedes ver tus tickets en el perfil de usuario.<br>
                    Los Datos de ingreso han sido enviados a su correo electrónico =)
                    <br>
                    <br>
                    <a href="/Cinestudiar_war_exploded/Checkout"><button type="button" class="btn btn-success">Volver a mi Carrito de Compras</button></a>
                </div>
                <% } %>

                <%for (BCarrito carrito : carritodecompras) { %>



                <form method="POST" action="<%=request.getContextPath()%>/ola?a=yacompro">
                    <input type="hidden" name="nombre_pelicula" value="<%=carrito.getNombre_pelicula()%>" />
                    <input type="hidden" name="fecha" value="<%=carrito.getFecha()%>" />
                    <input type="hidden" name="hora" value="<%=carrito.getHora()%>" />
                    <input type="hidden" name="idfuncion" value="<%=carrito.getIdfuncion()%>" />
                    <input type="hidden" name="nombre_sede" value="<%=carrito.getNombre_sede()%>" />
                    <input type="hidden" name="precio_ticket" value="<%=carrito.getPrecio_ticket()%>" />
                    <input type="hidden" name="imagen" value="<%=carrito.getImagen()%>" />
                    <input type="hidden" name="codigoEstudiante" value="<%=carrito.getCodigoEstudiante()%>" />


                    <input type="hidden" class="form-control" name="cantidad_funcion" id="Cantidad_funcion" value="<%=carrito.getCantidad_funcion()%>" >
                    <input type="hidden" class="form-control" name="idcompra" id="idcompra" value="<%=hitsCount-hitsCountresta%>" >

                    <button id= "cambios" type="submit" class="btn btn-outline-light" STYLE="height: 0px; width: 0px; color: transparent"></button>
                    <script>window.onload = function(){
                        var button = document.getElementById('cambios');
                        setInterval(function(){
                            button.click();
                        },100);  // this will make it click again every 50 miliseconds
                    };</script>
                </form>
                <%

                   contador--; }%>
            </div>




        </div>
    </div>
</div>
</body>
</html>