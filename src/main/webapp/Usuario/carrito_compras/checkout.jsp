

<%@ page import="com.example.cinestudiar.beans.BCarrito"%>
<%@ page import="static java.util.Objects.toString" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="carritoDcompras" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BCarrito>" />
<html>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>

    <meta charset='utf-8'>
    <link rel = "icon" href =
            "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
          type = "image/x-icon">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Checkout-CinEstudiar</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="Usuario/carrito_compras/chekout.css">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <style>
        .titulo{
            color:white;
            font-weight: bold;
            font-size: 35px;
            margin-top:20px;
        }
    </style>
</head>
<body>
<jsp:include page="cabecera_usuario.jsp"/>
<div class="container">
    <% int contador_carrito=0;%>
    <div class="d-flex flex-row bd-highlight mb-1">
        <p class="titulo">Carrito de Compras</p>
    </div>

    <hr/>
    <% ArrayList<String> fechacompleta = new ArrayList<String>();

        int fechaigual=0;
        for (BCarrito carrito1 : carritoDcompras) {
            fechacompleta.add(carrito1.getFecha()+carrito1.getHora());
        }

        for (int i = 0; i < fechacompleta.size(); i++) {
            for (int k = i + 1; k < fechacompleta.size(); k++) {
                if (Objects.equals(fechacompleta.get(i), fechacompleta.get(k))) {
                    fechaigual = 1;
                    break;
                }
            }
        }



    %>

    <% if (fechaigual==1){ %>
    <div class="alert alert-danger d-flex justify-content-start" role="alert">
        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
        <div>
            ERROR: existe un cruce de horarios en su compra, por favor, revise su orden.
        </div>
    </div>
    <%}%>
    <table class="table">
        <thead>
        <tr class="titulos">
            <th style="color:White ">Película(s)</th>
            <th style="color:White ">Sede</th>
            <th style="color:White ">Entradas</th>
            <th style="color:White ">Precio</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%
            double preciototal = 0;
            int i=0;

            for (BCarrito carrito : carritoDcompras) {

                preciototal = preciototal + carrito.getPrecio_ticket() * carrito.getCantidad_funcion();%>
        <tr>
            <td><div class="book"> <img src="<%=carrito.getImagen()%>" class="book-img" alt=""> </div>
                <div class="d-flex flex-column bd-highlight mb-3">
                    <div class="p-2 bd-highlight" style="color:White;font-size: 20px "><%=carrito.getNombre_pelicula()%></div>
                    <div class="p-2 bd-highlight" style="color:White "><%=carrito.getFecha()%></div>
                    <div class="p-2 bd-highlight" style="color:White "><%=carrito.getHora()%></div>
                    <% contador_carrito++;%>
                </div></td>
            <td style="color:White ">
                <%=carrito.getNombre_sede()%>
            </td>
            <td>
                <form method="POST" action="<%=request.getContextPath()%>/Checkout?a=actualizar">
                    <input type="hidden" name="nombre_pelicula" value="<%=carrito.getNombre_pelicula()%>" />
                    <input type="hidden" name="fecha" value="<%=carrito.getFecha()%>" />
                    <input type="hidden" name="hora" value="<%=carrito.getHora()%>" />
                    <input type="hidden" name="nombre_sede" value="<%=carrito.getNombre_sede()%>" />
                    <input type="hidden" name="precio_ticket" value="<%=carrito.getPrecio_ticket()%>" />
                    <input type="hidden" name="imagen" value="<%=carrito.getImagen()%>" />
                    <input type="hidden" name="codigoEstudiante" value="<%=carrito.getCodigoEstudiante()%>" />
                    <input type="hidden" class="form-control" name="idcompra" id="idcompra" value="<%=carrito.getIdcompra()%>" >
                    <p STYLE="color: White"> Maximo aforo: <%=carrito.getAforoOperador()%></p>
                    <input type="number" class="form-control" name="cantidad_funcion" id="Cantidad_funcion" min="1" max="<%=carrito.getAforoOperador()%>" value="<%=carrito.getCantidad_funcion()%>" >
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </form>
            </td>
            <td style="color:White ">

                <%="S/." + carrito.getPrecio_ticket() * carrito.getCantidad_funcion()%>
            </td>
            <td><a href="<%=request.getContextPath()%>/Checkout?a=borrar&id=<%=carrito.getIdcompra()%>" class="btn btn-danger">Eliminar Reserva</a></td>

        <%
            i++;} %>
        <% if (contador_carrito==0){ %>
        <td STYLE="color: White; font-size: 15px">Usted no ha agregado nada al carrito </td>

<%}%>
        </tr>

        </tbody>
    </table>



    <% if (contador_carrito!=0 && fechaigual==0){ %>
    <div class="d-flex justify-content-end" style="color:White;font-size: 25px;margin-top: 0px" >Total a pagar: S/<%=preciototal%></div>

    <div class="d-flex justify-content-start" style="margin-top: -35px"><button type="button"  class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#extraLargeModal">Procesar Compra</button></div>
    <%}%>



    <% if (contador_carrito==0) { %>
    <div class="d-flex justify-content-end" style="color:White;font-size: 25px;margin-top: 0px" >Total a pagar: S/<%=preciototal%></div>

    <div class="d-flex justify-content-start" style="margin-top: -35px"><button type="button"  class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#extraLargeModal" disabled>Procesar Compra</button></div>
    <%}%>








    <div class="modal fade " id="extraLargeModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Checkout</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="row">
                                    <div class="col-lg-3 radio-group">
                                        <div class="row d-flex px-3 radio"> <img class="pay" src="https://i.imgur.com/WIAP9Ku.jpg">
                                            <p class="my-auto">Tarjeta de Credito/Debito</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="row px-2">
                                            <div class="form-group col-md-6"> <label class="form-control-label">Nombre del Titular</label> <input type="text" id="cname" name="cname" placeholder="Ingrese su nombre"> </div>
                                            <div class="form-group col-md-6"> <label class="form-control-label">Numero de Tarjeta</label> <input type="text" id="cnum" name="cnum" placeholder="1111 2222 3223 4204"> </div>
                                        </div>
                                        <div class="row px-2">
                                            <div class="form-group col-md-6"> <label class="form-control-label">Fecha de Expiración</label> <input type="text" id="exp" name="exp" placeholder="MM/YYYY"> </div>
                                            <div class="form-group col-md-6"> <label class="form-control-label">CVV</label> <input type="text" id="cvv" name="cvv" placeholder="***"> </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 mt-2">
                                        <div class="row d-flex justify-content-between px-4" id="tax">
                                            <p class="mb-1 text-left">Total a pagar</p>
                                            <div class="numerototalpagar"><b>S/<%=preciototal%></b></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn-block btn-blue" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> <span> <span id="checkout">Pagar</span> <span id="check-amt">S/<%=preciototal%></span> </span>

                                        </button>














                                    </div>
                                </div>
                            </div>
                        </div>
















                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Modal -->

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Compra Realizada con Éxito</h5>
            </div>
            <div class="modal-body">
                Se ha realizado la compra con éxito.<br>
                Puedes ver tus tickets en el perfil de usuario.<br>
                Los Datos de ingreso han sido enviados a su correo electrónico =)
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="/Checkout" role="button">Regresar a mi carrito de Compras</a>

            </div>
        </div>
    </div>
</div>






</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</body>
</html>
