
<%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0020, 20 de junio del 2022
  Time: 07:13p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Required meta 2 tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<link rel="icon" href=
        "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
      type="image/x-icon">

<nav class="navbar navbar-light" style="background:#114a9d;">
  <h1 class="titulo" style="color: white; ">⠀<img src="${pageContext.request.contextPath}/Imagenes/cinestudiarlogo.png" alt="cinEstudiar" style="height: 85px;width: 320px;margin-top: -5px" ></h1>
  <div class="nav2">
    <a href="${pageContext.request.contextPath}/inicio" class="my-1 mx-1" style="color: white;font-weight: bold;font-size: 17px;font-family: Akzidenz-Grotesk">Inicio⠀<i class="bi bi-house-fill"></i> </a>
    <a href="#" onclick="document.getElementById('id01').style.display='block'" class="my-1 mx-1" style="color: white;font-weight: bold;font-size: 17px;font-family: Akzidenz-Grotesk">Inicio de Sesión⠀<i class="bi bi-person-circle"></i></a>


    <!-- MODAL -->
    <div id="id01" class="modalh1">
      <form style="background-color: #003f9e" class="modal-contenth1 animate" action="<%=request.getContextPath()%>/inicio?action=loguear" method="post">
        <div class="imgcontainer">
          <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
        </div>
        <div class="container align-content-center w-75 mt-5 rounded">
          <p class="text-center" style="color: black; font-size: 40px" ><b>Iniciar sesión</b></p>
          <label><b>Username</b></label>
          <input type="text" placeholder="Ingrese usuario" name="nombre" required>

          <label><b>Password</b></label>
          <input type="password" placeholder="Ingrese contraseña" name="password" required>

          <button type="submit" class="btn btn-success">Ingresar</button>
          <br>
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
    <!-- MODAL -->



    <a href="${pageContext.request.contextPath}/inicio?action=registrar" class="my-1 mx-1" style="color: white;font-weight: bold;font-size: 17px;font-family: Akzidenz-Grotesk">Registrarse⠀<i class="bi bi-book"></i></a>
  </div>
</nav>

<body class="bodycolor">

</body>

<style>
  .nav2{
    margin-left: 0px;
  }
  .bodycolor {
    background: rgb(159,197,245);
    background: linear-gradient(0deg, rgba(159,197,245,1) 0%, rgba(55,123,215,1) 80%);
    background-repeat: no-repeat ;
    background-size: cover;
    background-position: center center;
    background-attachment: fixed;
  }
  @font-face { font-family: "Akzidenz-Grotesk"; src: url('/Imagenes/akzidenz.otf'); }

</style>

<!-- Optional JavaScript1 -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
