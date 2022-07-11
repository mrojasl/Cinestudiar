<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.stream.IntStream" %>
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="listapeliculas" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean id="listaradom" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean id="cointaner" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="valor" scope="request" type="java.lang.Integer"/>
<html lang="en">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
    <meta charset='utf-8'>
    <link rel="icon" href="https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png" type="image/x-icon">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Inicio-Cinestudiar</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
    <link rel="stylesheet" href="carritocomprasvacio.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <style>

        .desc1back{
            color: white;
            background-color: #45698a;
            height: auto;
        }
        .container {
            padding-right: 0 !important;
            padding-left: 0 !important;
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
            margin-left: 30px;
            margin-top: 30px;
            border-radius: 25px;
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

        .carousel-control-prev-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
        }




        .carousel .carousel-indicators li {  background-color: white;border-radius: 100%;height: 10px;width: 10px }
        .carousel .carousel-indicators li.active { background-color: blue;border-radius: 100%;height: 10px;width: 10px }




    </style>
</head>

    <body>
        <jsp:include page="headerSesionIniciada.jsp">
            <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
        </jsp:include>

        <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel" style="height: 600px">
            <ol class="carousel-indicators" style="z-index: 999">
                <%for(int j=0 ; j< listaradom.size();j++){%>
                <li class="<%=(j==0)?"active":""%>" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%=j%>"  aria-current="true"></li>
                <%}%>
                </ol>

            <div class="carousel-inner">
                <%for(int l=0 ; l< listaradom.size();l++){%>

                <div class="<%=(l==0)?"carousel-item active":"carousel-item"%>">

                    <img src="${pageContext.request.contextPath}/Imagenes/fondo_de_cine.jpg" alt="..." class="d-block w-100" style="height: 600px;filter: blur(8px) brightness(70%);-webkit-filter: blur(8px) brightness(70%)">

                    <div class="carousel-caption d-flex justify-content-between " STYLE="padding-bottom: 40px;padding-top: 0px">
                        <div>
                            <img src="${pageContext.request.contextPath}/Image?action=peliculas&id=<%=listaradom.get(l).getIdpeliculas()%>" class="d-block" style="height: 500px;width: 300px; padding-bottom: 0px" alt="...">
                        </div>


                        <div>
                            <h6 style="font-size: 30px"><%=listaradom.get(l).getNombre()%></h6>
                            <br>
                            <br>
                            <div class="card" style="width: 45rem;background-color: transparent">
                                <div class="card-body">
                                    <%if (listaradom.get(l).getInformación()!=null){%>
                                    <p class="card-text"><%=listaradom.get(l).getInformación()%></p>
                                    <%}else{%>
                                    <p class="card-text">Todavía no contamos con una descripción disponible</p>
                                    <%}%>


                                </div>
                            </div>
                        </div>



                    </div>

                </div>
                <%}%>
            </div>

        </div>


        <button  type="button" class="btn btn-primary btn-rounded" data-mdb-ripple-color="dark" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
            <i class="bi bi-arrow-left-square-fill"></i> Anterior
        </button>
        <button type="button" class="btn btn-primary btn-rounded" data-mdb-ripple-color="dark" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
            Siguiente <i class="bi bi-arrow-right-square-fill"></i>
        </button>


        <div class="d-flex justify-content-around">
            <div >
                <div >
                    <div>
                        <br>

                    </div>
                </div>
                <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
                    <div class="carousel-inner">

                        <%  int h=1;
                            int b=1;
                            for (int n = 1; n<cointaner+1; n++) {%>
                        <div class="<%=(n==1)?"carousel-item active":"carousel-item"%>">
                            <div class="container">
                                <%for (int m= b; m<valor+1;m++){%>
                                <div class="row align-items-start">
                                    <%for (int k=h;k<listapeliculas.size()+1;k++){%>
                                    <div class="col">
                                        <br>
                                        <div class="boxfuncion">
                                            <h5><%=listapeliculas.get(k-1).getNombre()%></h5>
                                            <img src="${pageContext.request.contextPath}/Image?action=peliculas&id=<%=listapeliculas.get(k-1).getIdpeliculas()%>" alt="poster_movie" width="250px" height="380px">
                                            <a type="button" class="btn btn-outline-info btn-rounded" data-mdb-ripple-color="dark" href="<%=request.getContextPath()%>/detalles?action=detalles&id=<%=listapeliculas.get(k-1).getIdpeliculas()%>">Ver detalles</a>
                                        </div>
                                    </div>
                                    <% if (k%3==0) {
                                        h=k+1;
                                        break;
                                    }%>
                                    <%}%>
                                </div>
                                <% if (m%2==0) {
                                    b=m+1;
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

        <!-- XD-->
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
