<%--
  Created by IntelliJ IDEA.
  User: Jon
  Date: 5/06/2022
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href=
                "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
              type="image/x-icon">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Inicio-Cinestudiar</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="carritocomprasvacio.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="inicio_style.css">

    </head>
    <body>
        <header class="header">
            <h2>Cinestudiar</h2>
            <div class="nav">
                <a href="#">Inicio⠀<i class="bi bi-house-fill"></i> </a>
                <a href="#"  onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Inicio de sesión⠀<i class="bi bi-person-fill"></i></a>

                <div id="id01" class="modalh1">

                    <form style="background-color: #003f9e" class="modal-contenth1 animate" action="/action_page.php" method="post">
                        <div class="imgcontainer">
                            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                        </div>
                        <div class="container align-content-center w-75 mt-5 rounded">
                            <p class="text-center" style="color: black; font-size: 40px" ><b>Iniciar sesión</b></p>
                            <label><b>Username</b></label>
                            <input type="text" placeholder="Ingrese usuario" name="uname" required>

                            <label><b>Password</b></label>
                            <input type="password" placeholder="Ingrese contraseña" name="psw" required>

                            <a href="in_con_sesion.html"><button type="button" class="btn btn-success">Ingresar</button></a><br>
                            <label>
                                <input id="rememberme" type="checkbox" checked="checked" name="remember"> Recuérdame
                            </label>
                        </div>

                        <footer class="container d-flex justify-content-between" style="background-color:#f1f1f1" >
                            <div class="mx-0">
                                <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancelar</button>
                                <a id="forgot" href="#"  ><b>¿Olvidaste la contraseña?</b></a>
                            </div>

                        </footer>

                    </form>

                </div>


                <a href="../registro/registro.html">Registrarse⠀<i class="bi bi-book"></i></a>

            </div>
        </header>
    </body>
</html>
