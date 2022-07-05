<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 05/07/2022
  Time: 03:26
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="indicador" scope="session" type="java.lang.String" class="java.lang.String"/>


<html>
    <head >
        <jsp:include page="headerSesionNoIniciada.jsp"/>
        <meta charset="UTF-8">
        <title>Cinestudiar</title>
        <!--link-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!--link-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel = "icon" href =
                "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
              type = "image/x-icon">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <link href="header_style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    </head>
    <body background="Imagenes/fondo.jpg">
    <section class="vh-100" >
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                <img src="Imagenes/gente2.png"
                                     alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; width:520px; height:590px;" />
                            </div>
                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">

                                    <form method="post" action="<%=request.getContextPath()%>/loguin">

                                        <div class="d-flex align-items-center mb-3 pb-1">
                                            <i class="fa fa-film fa-2x me-3" style="color: #ff6219;"></i>
                                            <span class="h1 fw-bold mb-0">Cinestudiar</span>
                                        </div>

                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Ingresa a tu cuenta</h5>

                                        <div class="form-outline mb-4">
                                            <input type="number" id="codigo" name="codigo" class="form-control form-control-lg" />
                                            <label class="form-label" for="codigo">Codigo PUCP</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="password" name="password" class="form-control form-control-lg" />
                                            <label class="form-label" for="password">Contraseña</label>
                                        </div>

                                        <div class="pt-1 mb-4">
                                            <button class="btn btn-dark btn-lg btn-block" type="submit" role="button">Iniciar</button>
                                        </div>


                                        <p class="mb-5 pb-lg-2" style="color: #393f81;">¿No tienes cuenta? <a href="${pageContext.request.contextPath}/inicio?action=registrar"
                                                                                                                  style="color: #393f81;">Registrate aqui</a></p>

                                    </form>
                                    <%if (session.getAttribute("indicador").equals("error")){%>
                                    <div class="text-danger nb-2">
                                        Error en usuario o contraseña!!!
                                    </div>
                                    <%session.removeAttribute("indicador");%>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    </body>
</html>
