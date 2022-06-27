<%--
  Created by IntelliJ IDEA.
  User: Jon
  Date: 5/06/2022
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="navbar sticky-top navbar-expand-lg navbar-dark">
                <img src="Imagenes/cinestudiarlogo.png" href="<%=request.getContextPath()%>/inicio" >
                <a href="<%=request.getContextPath()%>/inicio"> Inicio⠀<i class="bi bi-house-fill"></i> </a>
                <a href="#"  onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Inicio de sesión⠀<i class="bi bi-person-fill"></i></a>

                <div id="id01" class="modalh1">
                    <form style="background-color: #003f9e" class="modal-contenth1 animate" action="<%=request.getContextPath()%>/inicio?action=loguear" method="post">
                        <div class="imgcontainer">
                            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                        </div>
                        <div class="container align-content-center w-75 mt-5 rounded">
                            <p class="text-center" style="color: black; font-size: 40px" ><b>Iniciar sesión</b></p>
                            <label><b>Código PUCP</b></label>
                            <input type="text" placeholder="Ingrese su código" name="codigo" required>

                            <label><b>Contraseña</b></label>
                            <input type="password" placeholder="Ingrese contraseña" name="password" required>

                            <button type="submit" class="btn btn-success">Ingresar</button>
                            <br>
                            <label>
                                <input id="rememberme" type="checkbox" checked="checked" name="remember"> Recuérdame
                            </label>
                        </div>

                        <footer class="container d-flex justify-content-between" style="background-color:#f1f1f1" >
                            <div class="mx-0">
                                <button type="button"  onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancelar</button>
                                <a id="forgot" href="#"  ><b>¿Olvidaste la contraseña?</b></a>
                            </div>
                        </footer>
                    </form>
                </div>
                <a href="<%=request.getContextPath()%>/inicio?action=registrar"> Registrarse⠀<i class="bi bi-book"></i></a>
    </div>

