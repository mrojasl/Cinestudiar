<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


    <div class="cruzahorario001">
        <div class="row d-flex justify-content-center border-top">
            <div class="col-5">
                <div class="row d-flex">
                    <div class="book"> <img src="https://pics.filmaffinity.com/Wi_aypacha-927144275-large.jpg" class="book-img"> </div>
                    <div class="col-5">
                        <br>
                        <h6 class="mob-text" >Wi??aypacha</h6>

                        <p>??scar Catacora</p>
                        <p>Mi??rcoles 20/04/2022</p>
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





    <div class="cruzahorario001">
        <div class="row d-flex justify-content-center border-top">
            <div class="col-5">
                <div class="row d-flex">
                    <div class="book"> <img src="https://production-tailoy-repo-magento-statics.s3.amazonaws.com/imagenes/872x872/productos/i/l/i/libro-piratas-en-el-callao-santillana-10878-default-1.jpg" class="book-img"> </div>
                    <div class="col-5">
                        <br>
                        <h6 class="mob-text" >Piratas en el Callao</h6>

                        <p>Eduardo Schuldt</p>
                        <p>Mi??rcoles 20/04/2022</p>
                        <p>13:45 - 15:00</p>
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
                        <h6 class="mob-text">S/60<br><br><button type="button" class="btn btn-danger">Borrar Reserva</button></h6>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="cruzahorario001">
        <div class="row d-flex justify-content-center border-top">

            <h4 class="heading" style="color:rgb(255, 255, 255); font-size:25px;background-color:rgba(218, 47, 47, 0.678);width:97.3%;margin-top:-14px">Advertencia:</h4>
            <p style="color:black; font-size:20px">???Se han detectado funciones cuyos horarios se cruzan:</p>
            <p style="color:black; font-size:18px">???Piratas en el Callao: 13:45 - 15:00</p>
            <p style="color:black; font-size:18px">???Wi??aypacha: 14:00 - 16:30</p>


        </div>
    </div>










    <div class="row d-flex justify-content-center border-top">


        <h6 class="sumatotal">???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Total a pagar: S/155</h6>


    </div>










    <div class="procedepago">


    <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Disabled popover">
        <button class="btn btn-success btn-lg" type="button" disabled>Procesar Compra</button>
      </span>

    </div>

</body>
</html>
