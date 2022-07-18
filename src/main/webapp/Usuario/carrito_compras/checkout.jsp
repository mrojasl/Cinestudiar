

<%@ page import="com.example.cinestudiar.beans.BCarrito"%>
<%@ page import="static java.util.Objects.toString" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="carritoDcompras" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BCarrito>" />
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" />
<jsp:useBean id="usuarioLogueado" class="com.example.cinestudiar.beans.BUser" scope="session" type="com.example.cinestudiar.beans.BUser"/>


<jsp:useBean id="Carritofallido" scope="session" type="java.lang.String" class="java.lang.String"/>


<html style="position:relative;min-height: 100%;padding-bottom: 160px">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
    <jsp:include page="/Usuario/headerSesionIniciada.jsp">

        <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
    </jsp:include>

    <meta charset='utf-8'>

    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Carrito-CinEstudiar</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="Usuario/carrito_compras/chekout.css">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <style>
        html {
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100%;
        }

        footer {
            margin-top: auto;
        }
        .titulox{
            color:white;
            font-weight: bold;
            font-size: 35px;
            margin-top:17px;
        }


        .navbar{
            position: relative;
            width: 100%;
            padding: 20px 10px;
            background-color: #003f9e;
        }
        .navbar img{
            width:300px;
            height:80px;
        }
        .navbar a{
            position: relative;
            color:white;
            text-decoration: none;
            margin-right: 18px;
        }
        .navbar a[id=forgot]{
            position: relative;
            left:65%;
            color: #78261f;
            text-decoration: none;
        }

        body {
            background-color: #3C3C41FF;
        }
        header{
            background-color: #003f9e;
            width: auto;
            height: 11vh;
            color: white;
        }
        header h2{
            position: absolute;
            left: 10%;
            top:4%;
        }
        .elementos{
            position: absolute;
            left: 25%;
        }
        .elementos a{
            position: relative;
            left:65%;
            top:0%;
            color:white;
            text-decoration: none;
            margin-right: 5px;
        }
        .administrador{
            background-color: #7e7878;
            width: auto;
            height: 6vh;
        }
        .administrador h3{
            position: absolute;
            color: #ece9e9;
            left: 50%;
        }
        html {
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
            text-size-adjust: 100%;
            line-height: 1.4;
        }
        .nav b{
            position: relative;
            left:25%;
            text-decoration: none;
            margin-right: 10px;
        }

        * {
            margin: 0;
            padding: 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            color: #404040;
            font-family: "Arial", Segoe UI, Tahoma, sans-serifl, Helvetica Neue, Helvetica;
        }

        /*=====================================
        estilos de la utilidad

        =====================================*/
        .seccion-perfil-usuario .perfil-usuario-body,
        .seccion-perfil-usuario {
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
            align-items: center;
        }



        .seccion-perfil-usuario .perfil-usuario-body {
            width: 70%;
            position: relative;
            max-width: 750px;
            margin-bottom: 0.5rem;
            margin-top: 0.5rem;
        }
        .seccion-perfil-usuario .perfil-usuario-nuevo{
            width: 95%;
            position: relative;
            background-color: #fff;
            max-width: 1200px;
            border-radius: 15px;
            padding: 1.5rem 2rem;

        }

        .seccion-perfil-usuario .perfil-usuario-body .titulo {
            display: block;
            width: 100%;
            font-size: 1.75em;
            margin-bottom: 0.5rem;
            margin-top: 0.5rem;
        }

        .seccion-perfil-usuario .perfil-usuario-body .texto {
            color: #848484;
            font-size: 0.95em;
        }

        .seccion-perfil-usuario .perfil-usuario-footer,
        .seccion-perfil-usuario .perfil-usuario-bio {
            display: flex;
            flex-wrap: wrap;
            padding: 0.75rem 1rem;
            box-shadow: 0 0 12px rgba(0, 0, 0, .2);
            background-color: #fff;
            border-radius: 15px;
            width: 100%;
        }

        .seccion-perfil-usuario .perfil-usuario-bio {
            margin-bottom: 1rem;
            text-align: center;
        }



        .container > .crop {
            position:absolute;
            left: -100%;
            right: -100%;
            top: -100%;
            bottom: -100%;
            margin: auto;
            min-height: 100%;
            min-width: 100%;
        }
        /* adactacion a dispositivos */
        @media (max-width: 750px) {
            .seccion-perfil-usuario .lista-datos {
                width: 100%;
            }

            .seccion-perfil-usuario .perfil-usuario-portada,
            .seccion-perfil-usuario .perfil-usuario-body {
                width: 95%;
            }

        }


    </style>
</head>
<body class="d-flex flex-column min-vh-100">
<%  double preciototal = 0;
    int totaldetickets=0;
    String correo_pucp="";
    int fechas_caducadas=0;

    String codigo_puke="";%>




    <section class="seccion-perfil-usuario">





    <% int contador_carrito=0;
        Integer hitsCount = (Integer)application.getAttribute("hitCounter");  %>






        <div class="perfil-usuario-body">
            <br>

            <div class="perfil-usuario-bio">
                <h1 class="titulo" type ="button">Carrito de Compras</h1>
            </div>

        </div>

        <div class="perfil-usuario-nuevo">


        <%

            if( hitsCount ==null || hitsCount == 0 )
            {
                /* First visit */
                hitsCount = 1;
            }
            else
            {
                hitsCount += 1;
            }
            application.setAttribute("hitCounter", hitsCount);
        %>




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

        <div>
            <i class="bi bi-exclamation-square-fill"></i> ERROR: existe un cruce de horarios en su compra, por favor, revise su orden. <i class="bi bi-exclamation-square-fill"></i>
        </div>
    </div>
    <%}%>




    <% for (BCarrito carrito : carritoDcompras) {
        int restaDeFechas = carrito.getDiferenciaHoraria();
        if (restaDeFechas <= 0) {
            fechas_caducadas++;
        }
    }%>


    <%if (Objects.equals(session.getAttribute("Carritofallido"), "CompraFallida")) {%>
    <div class="alert alert-danger d-flex justify-content-start" role="alert">
        <div>
            <i class="bi bi-exclamation-square-fill"></i>
            Proceso de compra fallido, existe una o más funciones
            las cuales ya no cuentan con el stock requerido. Por favor<br>
            Verifica la cantidad de tickets nuevamente<i class="bi bi-exclamation-square-fill"></i>
        </div>
    </div>
    <%session.removeAttribute("Carritofallido");%>
    <%}%>


            <% if (session.getAttribute("errorTarjeta") != null){%>
            <div>
                <div class="alert alert-danger" role="alert">
                    <%=session.getAttribute("errorTarjeta")%>
                </div>
            </div>
            <%session.removeAttribute("errorTarjeta");%>
            <%}%>

            <% if (session.getAttribute("errorNombre") != null){%>
            <div>
                <div class="alert alert-danger" role="alert">
                    <%=session.getAttribute("errorNombre")%>
                </div>
            </div>
            <%session.removeAttribute("errorNombre");%>
            <%}%>

            <% if (session.getAttribute("errorMes") != null){%>
            <div>
                <div class="alert alert-danger" role="alert">
                    <%=session.getAttribute("errorMes")%>
                </div>
            </div>
            <%session.removeAttribute("errorMes");%>
            <%}%>

            <% if (session.getAttribute("errorYear") != null){%>
            <div>
                <div class="alert alert-danger" role="alert">
                    <%=session.getAttribute("errorYear")%>
                </div>
            </div>
            <%session.removeAttribute("errorYear");%>
            <%}%>


            <% if (session.getAttribute("errorCvv") != null){%>
            <div>
                <div class="alert alert-danger" role="alert">
                    <%=session.getAttribute("errorCvv")%>
                </div>
            </div>
            <%session.removeAttribute("errorCvv");%>
            <%}%>




            <% if (fechas_caducadas >= 1){ %>
    <div class="alert alert-danger d-flex justify-content-start" role="alert">

        <div>
            <i class="bi bi-exclamation-square-fill"></i> ERROR: Existe uno o más funciones cuyas fechas han caducado (Una función se considera caducada a partir de cuando las horas y minutos de la función coinciden con las horas y minutos actuales). <i class="bi bi-exclamation-square-fill"></i>
        </div>
    </div>
    <%}%>

    <table id="tablax" class="table table-striped table-hover">
        <thead>
        <tr class="titulos">
            <th scope="col">Película(s)</th>
            <th scope="col">Información</th>
            <th scope="col">Entradas</th>
            <th scope="col">Precio por Entrada</th>
            <th scope="col">Subtotal</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%
            for (BCarrito carrito : carritoDcompras) {
                codigo_puke=usuario.getCodigoPucp();
                correo_pucp=carrito.getCorreopucp();
                preciototal = preciototal + carrito.getPrecio_ticket() * carrito.getCantidad_funcion();%>



        <tr>
            <td>
                <!--<img src="Usuario/carrito_compras/error_cruce_horarios/idpelicula_<%=carrito.getIdpelicula()%>.jpg" alt="perfil foto" style="width:110px;height:150px;">-->
                <img src="${pageContext.request.contextPath}/Image?action=peliculas&id=<%=carrito.getIdpelicula()%>" alt="perfil foto" style="width:110px;height:150px;">
                <div class="d-flex flex-column bd-highlight mb-3">
                    <% contador_carrito++;%>
                </div>
            </td>
            <td>
                <div style="font-size: 20px "><strong><%=carrito.getNombre_pelicula()%></strong></div>
                <br>
                <strong>Sede:</strong> <%=carrito.getNombre_sede()%>
                <br>
                <% String fechanSplit=carrito.getFecha();%>
                <% String[] fechaSplit=fechanSplit.split("-");%>
                <strong>Fecha:</strong> <%=fechaSplit[2]+"/"+fechaSplit[1]+"/"+fechaSplit[0]%>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="tooltip" title="Fecha en formato (dd/mm/yyyy)">
                    <i class="bi bi-info-circle-fill"></i>
                </span>
                <br>
                <% String horanSplit=carrito.getHora();%>
                <% String[] horaSplit=horanSplit.split(":");%>
                <strong>Hora:</strong> <%=horaSplit[0]+":"+horaSplit[1]+" horas"%>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="tooltip" title="Formato de 24 horas (hh:mm)">
                    <i class="bi bi-info-circle-fill"></i>
                    </span>
                <br>
                <% int horas=0;
                    int minutos=carrito.getDuracionpelicula();
                    while (minutos>=60){
                        minutos-=60;
                        horas++;
                    }%>

                <strong>Duración:</strong> <%=horas%> hora(s), <%=minutos%> minuto(s).
                <br>






            </td>
            <td>
                <form method="POST" action="<%=request.getContextPath()%>/Checkout?a=actualizar">
                    <input type="hidden" name="nombre_pelicula" value="<%=carrito.getNombre_pelicula()%>" />
                    <input type="hidden" name="fecha" value="<%=carrito.getFecha()%>" />
                    <input type="hidden" name="hora" value="<%=carrito.getHora()%>" />
                    <input type="hidden" name="idfuncion" value="<%=carrito.getIdfuncion()%>" />
                    <input type="hidden" name="contadorfuncion" value="<%=hitsCount%>" />
                    <input type="hidden" name="nombre_sede" value="<%=carrito.getNombre_sede()%>" />
                    <input type="hidden" name="precio_ticket" value="<%=carrito.getPrecio_ticket()%>" />

                    <input type="hidden" name="historialdelacompra" value="<%=carrito.getHistorialcompra()%>" />
                    <input type="hidden" name="codigoEstudiante" value="<%=usuario.getCodigoPucp()%>" />

                    <input type="hidden" class="form-control" name="idcompra" id="idcompra" value="<%=carrito.getIdcompra()%>" >
                    <p > Entradas Disponibles: <%=carrito.getAforoOperador()%></p>
                    <input type="number" class="form-control" name="cantidad_funcion" id="Cantidad_funcion" min="1" max="<%=carrito.getAforoOperador()%>" value="<%=carrito.getCantidad_funcion()%>" > <br>
                    <%totaldetickets=totaldetickets+carrito.getCantidad_funcion();%>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </form>
            </td>
            <td >
                <%="S/." +carrito.getPrecio_ticket()%>
            </td>
            <td >

                <%="S/." + carrito.getPrecio_ticket() * carrito.getCantidad_funcion()%>
            </td>
            <td><form method="POST" action="<%=request.getContextPath()%>/Checkout?a=borrar">
                <input type="hidden" name="idborrar" value="<%=carrito.getIdfuncion()%>">
                <button type="submit" class="btn btn-danger" >Borrar Reserva</button>
            </form>
            </td>

            <%
                } %>
            <% if (contador_carrito==0){ %>
            <td STYLE="font-size: 15px">Usted no ha agregado nada al carrito </td>

            <%}%>
        </tr>

        </tbody>
    </table>



    <% if (contador_carrito!=0 && fechaigual==0 && fechas_caducadas==0){ %>

    <div class="d-flex justify-content-end" style="font-size: 25px;margin-top: 0px" >Total a pagar: S/<%=preciototal%></div>

    <div class="d-flex justify-content-start" style="margin-top: -35px"><button type="button"  class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#extraLargeModal">Procesar Compra</button></div>
    <%}%>



    <% if (contador_carrito==0) { %>
    <div class="d-flex justify-content-end" style="font-size: 25px;margin-top: 0px" >Total a pagar: S/<%=preciototal%></div>

    <div class="d-flex justify-content-start" style="margin-top: -35px"><button type="button"  class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#extraLargeModal" disabled>Procesar Compra</button></div>
    <%}%>








    <div class="modal fade " id="extraLargeModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-xl">
            <div class="modal-content" STYLE="background-color: #3577d7">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><p STYLE="color: white;font-size: 30px"> <strong>Ventana de Pago</strong></p></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="POST" action="<%=request.getContextPath()%>/Checkout?a=comprar">
                    <div class="modal-body" STYLE="background-color: #3577d7">
                        <div class="row justify-content-center" STYLE="background-color: #3577d7">
                            <div class="col-lg-12" STYLE="background-color: #3577d7">
                                <div class="card" STYLE="background-color: #3577d7">
                                    <div class="row" STYLE="background-color: #3577d7">
                                        <div class="col-lg-3 radio-group" STYLE="background-color: #3577d7">
                                            <div class="row d-flex px-3 radio"> <img class="pay" src="https://i.imgur.com/WIAP9Ku.jpg">
                                                <p class="my-auto" STYLE="color: white;font-weight: bold">Tarjeta de Credito/Debito</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="row px-2">
                                                <div class="form-group col-md-6"> <label class="form-control-label"  STYLE="color: white;font-weight: bold">Nombre del Titular</label> <input type="text" name="nombreTitular" id="cname"  required="required" placeholder="Ingrese su nombre"> </div>
                                                <div class="form-group col-md-6"> <label for="cnum" class="form-control-label"  STYLE="color: white;font-weight: bold">Número de Tarjeta</label> <input type="text"  id="cnum" name="tarjetaTitular" minlength="16" maxlength="16" required="required" placeholder="1111222232234204" > </div>
                                            </div>
                                            <div class="row px-2" STYLE="background-color: #3577d7">
                                                <div class="form-group col-md-6"> <label class="form-control-label"  STYLE="color: white;font-weight: bold">Fecha de Expiración</label> <input type="text"  name="mesTitular" minlength="2" maxlength="2" required="required" placeholder="MM"> <label class="form-control-label" ></label> <input type="text"  minlength="4" maxlength="4" name="yearTitular" required="required" placeholder="YYYY"> </div>
                                                <div class="form-group col-md-6" > <label  class="form-control-label" for="cvv"  STYLE="color: white;font-weight: bold">cvv</label><input type="text" STYLE="background-color: #a8c2ef" id="cvv" name="cvv" minlength="3" maxlength="4" placeholder="123-1234" required="required"> </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 mt-2">
                                            <div class="row d-flex justify-content-between px-4" id="tax">
                                                <p class="mb-1 text-left"  STYLE="color: white;font-weight: bold">Total a pagar</p>
                                                <div class="numerototalpagar"><b  STYLE="color: white;font-weight: bold">S/<%=preciototal%></b></div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">

                                            <input type="hidden" class="form-control" name="cantidad_ticketsStr" id="cantidad_ticketsStr" value="<%=totaldetickets%>">
                                            <label for="pago_totalStr" class="form-label"></label>
                                            <input type="hidden" class="form-control" name="pago_totalStr" id="pago_totalStr" value="<%=preciototal%>">
                                            <label for="codigo_pucp" class="form-label"></label>
                                            <input type="hidden" class="form-control" name="codigo_pucp" id="codigo_pucp" value="<%=codigo_puke%>">
                                            <label for="correo_puke" class="form-label"></label>
                                            <input type="hidden" class="form-control" name="correo_puke" id="correo_puke" value="<%=correo_pucp%>">

                                            <input type="hidden" class="form-control" name="" id="reducirTickets" value="">

                                            <button type="submit" class="btn btn-success" >Pagar</button>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>




<!-- Modal -->

        </div>


<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));


    function modifyInput(ele) {

        if (ele.value.length === 2)
            ele.value = ele.value + '/'
        else
        if (ele.value.length === 3 && ele.value.charAt(2) === '/')
            ele.value = ele.value.replace('/', '');
    }
    function modifyInputcard(ele) {

        if (ele.value.length === 4)
            ele.value = ele.value + ' '
        if (ele.value.length === 9)
            ele.value = ele.value + ' '
        if (ele.value.length === 14)
            ele.value = ele.value + ' '
    }




</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>


<br><br>

    </section>
</body>
</html>
