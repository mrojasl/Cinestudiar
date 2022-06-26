<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<jsp:useBean id="listapeliculas" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean id="cointaner" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="valor" scope="request" type="java.lang.Integer"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset='utf-8'>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png" type="image/x-icon">
        <title>Inicio-Cinestudiar</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
       <style>
            body {
                background-image: url("Imagenes/fondo_registro.jpg");
                background-color: #ffffff;
                background-size: cover;
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center center;
                background-attachment: fixed;
            }
            .desc1back{
                color: white;
                background-color: #45698a;
                height: auto;
            }
            .container {
                padding-right: 0 !important;
                padding-left: 0 !important;
            }
            .buttonswipe{
                text-align: right;
            }
            .rigthup{
                float:left;
            }
            .leftfinal{
                text-align: center;
                color: white;
            }
            .spaceleft{
                margin-left: 25px;
                color: #989898;
            }
            .leftrighttext{
                margin-left: 270px;
            }
            .leftlefttext{
                width: 200px;
                height: 20px;float: left;
            }
            .textchoosereserv{
                color: white;
                margin-left: 20px;
            }
            .centradoleftstar{
                margin-left: 105px;
            }
            .centradoleft{
                margin-left: 75px;
            }
            .buttonsize{
                width: 250px;
                height: 40px;
                margin-bottom: 10px;

            }
            .boxfuncion{
                color: white;
                text-align: center;
                background-color: #111523;
                width: 250px;
            }

            .funcionestxt{
                height: 80px;
                color: white;
                padding:10px;
                margin-left: 20px;
            }
            .sugerencia {
                background-color: #111523;
                height: 80px;
                color: white;
                text-align: center;
                padding: 20px;
            }
            .rightside{
                float: right;
            }
            .leftside{
                background-color: #012154;
            }
            div#general{
                margin: auto;
                width: 1600px;
                height: 1000px;
            }

            .navbar{
                position: fixed;
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
                left:55%;
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

            p.emptytxt{
                margin-top: 45px;
                font-size:20px;
                color:white;
                font-weight: bold;

            }
            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
                color: #2d2e33;
                position: center;
            }
            input[id=rememberme]{
                font-family: Arial, Helvetica, sans-serif;
                color: #2b2e31;
                text-decoration-color: black;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                margin-right: 0px;
                background-color: #f44336;
            }

            /* Center the image and position the close button */
            .imgcontainer {
                text-align: center;
                margin: 6px 0 3px 0;
                width: 30%;
                height: 10%;
                position: center;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
                long: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
                color: blue;
            }

            /* The Modal (background) */
            .modalh1 {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 60px;
            }

            /* Modal Content/Box */
            .modal-contenth1 {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 30%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: #000;
                font-size: 35px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

            /* Add Zoom Animation */
            .animate {
                -webkit-animation: animatezoom 0.6s;
                animation: animatezoom 0.6s
            }

            @-webkit-keyframes animatezoom {
                from {-webkit-transform: scale(0)}
                to {-webkit-transform: scale(1)}
            }

            @keyframes animatezoom {
                from {transform: scale(0)}
                to {transform: scale(1)}
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }
            button {
                background-color: #04AA6D;
                color: white;
                padding: 14px 20px;
                margin: 4px 0;
                border: none;
                cursor: pointer;

            }
            left2{
                margin-right: 75px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="cabecera_index.jsp"/>
        <div class="d-flex justify-content-between">
            <div class="leftside d-flex flex-column">
                <div class="sugerencia p-2" ><h3>Sugerencias</h3></div>
                <br>
                <div class="px-5">
                    <div class="boxfuncion " >
                        <h5>El Hombre Araña 2</h5>
                        <img  src="Imagenes/poster_movie13.webp" alt="poster_movie" width="250px" height="380px">
                    </div>
                    <button type="button" class="btn btn-secondary buttonsize" data-bs-toggle="modal" data-bs-target="#exampleModal">Más información</button>

                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Detalles de película</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="desc1back">
                                        <h4>El Hombre Araña 2</h4>
                                        <p>Spider-Man 2 | Parker (Tobey Maguire) está en la universidad, sigue enamorado de Mary Jane Watson (Kirsten Dunst) y tiene muchos problemas: su trabajo de héroe no le deja tiempo para estudiar, ni para ganar dinero para pagarse los estudios, ni para ayudar a su tía. Además, a veces pierde sus poderes.</p>
                                    </div>
                                    <div class="desc2back">
                                        <p>Director:<br>Sam Raimi</p>
                                        <p>Género:<br>Acción, superhéroes, ciencia, ficción, drama</p>
                                        <p>Duración:<br>180 minutos</p>
                                        <p>Actores:<br>Tobey Maguire, Kirsten Dunst, James Franco, Alfred Molina, Rosemary Harris, Donna Murphy</p>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="px-5" >
                    <img src="Imagenes/estrella.png" height="35px" width="35px">
                    <img src="Imagenes/estrella.png" height="35px" width="35px">
                    <img src="Imagenes/estrella.png" height="35px" width="35px">
                    <img src="Imagenes/estrella.png" height="35px" width="35px">
                    <img src="Imagenes/estrella.png" height="35px" width="35px">
                </div>
                <br>
                <div class="px-5">
                    <h5 class="textchoosereserv">Sede:</h5>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>San Miguel</option>
                        <option value="1">Pueblo Libre</option>
                        <option value="2">Miraflores</option>
                        <option value="3">Surco</option>
                    </select>
                    <br>
                    <h5 class="textchoosereserv">Horario:</h5>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>Mar. 20/05/2022 14:00-16:00</option>
                        <option value="1">Miér. 21/05/2022 15:00-16:30</option>
                        <option value="2">Juev. 22/05/2022 18:00-21:00</option>
                        <option value="3">Vier. 23/05/2022 18:00-19:45</option>
                    </select>
                    <br>
                </div>
                <div class="px-5" >
                    <h5 class="textchoosereserv">Cantidad de tickets:</h5>
                </div>
                <div class="px-5">
                    <input type="number" name="tentacles" min="1" max="35">
                </div>
                <h6 class="spaceleft">Tickets disponibles: 35</h6>
                <h6 class="spaceleft">Precio por ticket: S/25.00</h6>
                <br>
                <div class="leftfinal px-5">
                    <h4>TOTAL: S/50.00</h4>
                    <button type="button" class="btn btn-success">Reservar</button>
                </div>
            </div>
            <div style="margin-right: 150px">
                <div >
                    <div class="buttonswipe" >
                        <br>
                        <button type="button" class="btn btn-secondary" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
                            Anterior
                        </button>
                        <button type="button" class="btn btn-secondary" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
                            Siguiente
                        </button>
                    </div>
                </div>
                <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="container">
                                <%for (int j = 0 ; j<6;j=j+3){%>

                                <div class="row align-items-start">
                                    <%for (int i=j ; i<3+j;i++){%>
                                    <div class="col">
                                        <br>
                                        <div class="boxfuncion">
                                            <h5><%=listapeliculas.get(i).getNombre()%></h5>
                                            <img src="${pageContext.request.contextPath}/Image?id=<%=listapeliculas.get(i).getIdpeliculas()%>" alt="poster_movie" width="250px" height="380px">
                                        </div>
                                        <button type="button" class="btn btn-secondary buttonsize">Ver detalles</button>
                                    </div>
                                    <%}%>
                                </div>
                                <%}%>
                            </div>

                        </div>

                        <%  int h=7;
                            for (int n = 1; n<cointaner; n++) {%>
                        <div class="carousel-item">
                            <div class="container">
                                <%for (int m= 1 ; m<valor+1;m++){%>
                                <div class="row align-items-start">
                                    <%for (int k=h;k<listapeliculas.size()+1;k++){%>
                                    <div class="col">
                                        <br>
                                        <div class="boxfuncion">
                                            <h5><%=listapeliculas.get(k-1).getNombre()%></h5>
                                            <img src="${pageContext.request.contextPath}/Image?id=<%=listapeliculas.get(k-1).getIdpeliculas()%>" alt="poster_movie" width="250px" height="380px">
                                        </div>
                                        <button type="button" class="btn btn-secondary buttonsize">Ver detalles</button>
                                    </div>
                                    <% if (k%3==0) {
                                            h=k+1;
                                            break;
                                        }%>
                                    <%}%>
                                </div>
                                <% if (m%2==0) {
                                    break;
                                }%>
                                <%}%>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
                crossorigin="anonymous"></script>
        <script>
            // Get the modal
            var modalh1 = document.getElementById('id01');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modalh1) {
                    modalh1.style.display = "none";
                }
            }
        </script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </body>
</html>

