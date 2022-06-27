<%--
  Created by IntelliJ IDEA.
  User: 124349
  Date: 26/06/2022
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<jsp:useBean id="lista_profesionales" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<jsp:useBean id="pelicula" scope="request" type="com.example.cinestudiar.beans.BPeliculas"/>
<html>
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

        <div class="container my-10">
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-6">

                                    <div class="p-5">
                                        <div class="text-center">
                                            <a class="" href="#"><b>Detalles peliculas</b></a>
                                        </div>
                                        <br>
                                        <h5><%=pelicula.getNombre()%></h5>
                                        <%if (pelicula.getInformación()!=null){%>
                                        <p><%=pelicula.getInformación()%></p>
                                        <%}else{%>
                                        <p>Todavía no contamos con una descripción disponible</p>
                                        <%}%>
                                        <%int i =1;%>
                                        <%int j=1;%>
                                        <%for(BPeliculas bPeliculas : lista_profesionales) {%>
                                        <% if (bPeliculas.getProfesional().getRol().equals("d")){ %>
                                        <% if(i==1){%>
                                        <H4>Lista de directores:</H4>
                                        <%}%>
                                        <tr ><%=bPeliculas.getProfesional().getNombre()%> </tr >
                                        <%i=2;%>
                                        <%}%>
                                        <% if (bPeliculas.getProfesional().getRol().equals("a")){%>
                                        <%if (j==1){%>
                                        <H4 > Lista de actores:</H4 >
                                        <%}%>
                                        <%j=2;%>
                                        <tr ><%=bPeliculas.getProfesional().getNombre()%></tr >
                                        <%}%>
                                        <%}%>

                                        <hr>

                                    </div>
                                </div>
                            </div>
                        </div>
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
