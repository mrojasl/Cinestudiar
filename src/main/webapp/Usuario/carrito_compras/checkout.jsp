

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
        .titulox{
            color:white;
            font-weight: bold;
            font-size: 35px;
            margin-top:17px;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
<%  double preciototal = 0;
    int totaldetickets=0;
    String correo_pucp="";
    int fechas_caducadas=0;

    String codigo_puke="";%>
<div class="container">
    <% int contador_carrito=0;
        Integer hitsCount = (Integer)application.getAttribute("hitCounter");  %>
    <div class="d-flex flex-row bd-highlight mb-1">

        <p class="titulox"><br>Carrito de Compras</p>

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

    </div>


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



    <% if (fechas_caducadas >= 1){ %>
    <div class="alert alert-danger d-flex justify-content-start" role="alert">

        <div>
            <i class="bi bi-exclamation-square-fill"></i> ERROR: Existe uno o más funciones cuyas fechas han caducado (Una función se considera caducada a partir de cuando las horas y minutos de la función coinciden con las horas y minutos actuales). <i class="bi bi-exclamation-square-fill"></i>
        </div>
    </div>
    <%}%>

    <table class="table">
        <thead>
        <tr class="titulos">
            <th style="color:White ">Película(s)</th>
            <th style="color:White ">Información</th>
            <th style="color:White ">Entradas</th>
            <th style="color:White ">Precio por Entrada</th>
            <th style="color:White ">Subtotal</th>
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
            <td style="color:White ">
                <div style="color:White;font-size: 20px "><strong><%=carrito.getNombre_pelicula()%></strong></div>
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
                    <p STYLE="color: White"> Entradas Disponibles: <%=carrito.getAforoOperador()%></p>
                    <input type="number" class="form-control" name="cantidad_funcion" id="Cantidad_funcion" min="1" max="<%=carrito.getAforoOperador()%>" value="<%=carrito.getCantidad_funcion()%>" > <br>
                    <%totaldetickets=totaldetickets+carrito.getCantidad_funcion();%>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </form>
            </td>
            <td style="color:White ">
                <%="S/." +carrito.getPrecio_ticket()%>
            </td>
            <td style="color:White ">

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
            <td STYLE="color: White; font-size: 15px">Usted no ha agregado nada al carrito </td>

            <%}%>
        </tr>

        </tbody>
    </table>



    <% if (contador_carrito!=0 && fechaigual==0 && fechas_caducadas==0){ %>

    <div class="d-flex justify-content-end" style="color:White;font-size: 25px;margin-top: 0px" >Total a pagar: S/<%=preciototal%></div>

    <div class="d-flex justify-content-start" style="margin-top: -35px"><button type="button"  class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#extraLargeModal">Procesar Compra</button></div>
    <%}%>



    <% if (contador_carrito==0) { %>
    <div class="d-flex justify-content-end" style="color:White;font-size: 25px;margin-top: 0px" >Total a pagar: S/<%=preciototal%></div>

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
                                                <div class="form-group col-md-6"> <label class="form-control-label"  STYLE="color: white;font-weight: bold">Nombre del Titular</label> <input type="text" id="cname" name="cname" required="required" placeholder="Ingrese su nombre"> </div>
                                                <div class="form-group col-md-6"> <label for="cnum" class="form-control-label"  STYLE="color: white;font-weight: bold">Número de Tarjeta</label> <input type="text" onkeyup="modifyInputcard(this)" id="cnum" name="cnum" required="required" placeholder="1111 2222 3223 4204" > </div>
                                            </div>
                                            <div class="row px-2" STYLE="background-color: #3577d7">
                                                <div class="form-group col-md-6"> <label class="form-control-label"  STYLE="color: white;font-weight: bold">Fecha de Expiración</label> <input type="text" onkeyup="modifyInput(this)" id="exp" name="exp" required="required" placeholder="MM/YYYY"> </div>
                                                <div class="form-group col-md-6" > <label  class="form-control-label" for="cvv"  STYLE="color: white;font-weight: bold">cvv</label><input type="number" STYLE="background-color: #a8c2ef" id="cvv" name="cvv" min="1" max="9999" placeholder="0000" required="required"> </div>
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
</div>



<!-- Modal -->



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
<footer class="mt-auto" style="background-color: #D6D7DA;position: absolute;bottom: 0;width: 100%">
    <div class="container"  style="background-color: #D6D7DA">
        <%--            <div class="d-flex justify-content-start"><p class="text-muted">© 2022 Proyecto CinEstudiar</p></div>--%>
        <div class="d-flex bd-highlight">
            <div class="p-2 flex-grow-1 bd-highlight"><img style="width: 320px;height: 95px"  src="${pageContext.request.contextPath}/Imagenes/footer_logo.png"></div>
            <div class="p-2 bd-highlight"><p style="margin-top: 30px;margin-left: -40px" class="text-muted">© 2022 Proyecto CinEstudiar</p></div>
        </div>

    </div>
</footer>

</body>
</html>
