<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>



<%@ page import="com.example.cinestudiar.beans.BCarrito" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean type="java.util.ArrayList<com.example.cinestudiar.beans.BCarrito>" scope="request" id="carritoCliente"/>
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
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
    <link rel="stylesheet" href="chekout.css" media="screen" title="no title" charset="utf-8">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">









</head>
<body oncontextmenu='xd' class='snippet-body'>



<jsp:include page="cabecera_usuario.jsp"/>



<div class="container px-4 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-5">
            <h4 class="heading" style="color:white">Carrito de Compras</h4>
        </div>
        <div class="col-7">
            <div class="row text-right">
                <div class="col-4">
                    <h6 class="mt-2" style="color:white">Sede</h6>
                </div>
                <div class="col-4">
                    <h6 class="mt-2" style="color:white">Entradas</h6>
                </div>
                <div class="col-4">
                    <h6 class="mt-2" style="color:white">Precio</h6>
                </div>
            </div>
        </div>
    </div>
    <div class="row d-flex justify-content-center border-top">
        <div class="col-5">
            <div class="row d-flex">
                <div class="book"> <img src="https://pics.filmaffinity.com/Wi_aypacha-927144275-large.jpg" class="book-img"> </div>
                <div class="col-5">
                    <br>
                    <h6 class="mob-text" >Wiñaypacha</h6>

                    <p>Óscar Catacora</p>
                    <p>Miércoles 20/04/2022</p>
                    <p>14:00 - 16:30</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-7">
            <div class="row text-right">
                <div class="col-4">
                    <p class="mob-text">San Miguel</p>
                </div>
                <div class="col-4">
                    <div class="row d-flex justify-content-end px-3">

                        <div class="input-group">

                            <input value="1" type="number" name="ticket" min="1" max="999">
                        </div>



                    </div>
                </div>
                <div class="col-4">
                    <h6 class="mob-text">S/60<br><br><button type="button" class="btn btn-danger">Borrar Reserva</button></h6>
                </div>
            </div>
        </div>
    </div>







    <div class="row d-flex justify-content-center border-top">
        <div class="col-5">
            <div class="row d-flex">
                <div class="book"> <img src="https://image.tmdb.org/t/p/w500/2rMFY3ubIQFqPLVWO9N9Sg6vm48.jpg" class="book-img"> </div>
                <div class="col-5">
                    <br>

                    <h6 class="mob-text">Paloma de Papel</h6>
                    <p>Fabrizio Aguilar</p>
                    <p>Jueves 21/04/2022</p>
                    <p>18:00 - 19:30</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-7">
            <div class="row text-right">
                <div class="col-4">
                    <p class="mob-text">Miraflores</p>
                </div>
                <div class="col-4">
                    <div class="row d-flex justify-content-end px-3">
                        <div class="input-group">

                            <input value="1" type="number" name="ticket" min="1" max="999">

                        </div>

                    </div>
                </div>
                <div class="col-4">
                    <h6 class="mob-text">S/35<br><br><button type="button" class="btn btn-danger">Borrar Reserva</button></h6>
                </div>
            </div>
        </div>
    </div>






    <div class="row d-flex justify-content-center border-top">


        <h6 class="sumatotal">⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀Total a pagar: S/95</h6>


    </div>












































    <div class="procedepago">

        <button type="button"  class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#extraLargeModal">Procesar Compra</button>
    </div>

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
                                            <div class="numerototalpagar"><b>S/95</b></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn-block btn-blue" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> <span> <span id="checkout">Pagar</span> <span id="check-amt">S/95</span> </span>

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
                <a class="btn btn-primary" href="compras_menuresumenvacio.html" role="button">Regresar a mi carrito de Compras</a>

            </div>
        </div>
    </div>
</div>








</body>
</html>
