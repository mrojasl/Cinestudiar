

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cinestudiar.beans.BProfesional" %>
<%@ page import="com.example.cinestudiar.daos.FuncionesDao" %>


<jsp:useBean id="usuario" scope="session" type="com.example.cinestudiar.beans.BUser" class="com.example.cinestudiar.beans.BUser"/>
<jsp:useBean id="historial" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="nombre" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="listaProfesionales" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BProfesional>"/>

<%--XD--%>
<html>
    <head>
        <title>Calificacion</title>
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
    <% FuncionesDao funcionesDao= new FuncionesDao();%>
       <% if (funcionesDao.ObtenerCalificacion(historial)==null){ %>
    <body>
    <style type="text/css">
        .ratingg {
            --dir: right;
            --fill: gold;
            --fillbg: rgba(100, 100, 100, 0.15);
            --heart: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 21.328l-1.453-1.313q-2.484-2.25-3.609-3.328t-2.508-2.672-1.898-2.883-0.516-2.648q0-2.297 1.57-3.891t3.914-1.594q2.719 0 4.5 2.109 1.781-2.109 4.5-2.109 2.344 0 3.914 1.594t1.57 3.891q0 1.828-1.219 3.797t-2.648 3.422-4.664 4.359z"/></svg>');
            --star: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 17.25l-6.188 3.75 1.641-7.031-5.438-4.734 7.172-0.609 2.813-6.609 2.813 6.609 7.172 0.609-5.438 4.734 1.641 7.031z"/></svg>');
            --stars: 5;
            --starsize: 4rem;
            --symbol: var(--star);
            --value: 1;
            --w: calc(var(--stars) * var(--starsize));
            --x: calc(100% * (var(--value) / var(--stars)));
            block-size: var(--starsize);
            inline-size: var(--w);
            position: relative;
            touch-action: manipulation;
            -webkit-appearance: none;
        }
        .rating {
            --dir: right;
            --fill: gold;
            --fillbg: rgba(100, 100, 100, 0.15);
            --heart: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 21.328l-1.453-1.313q-2.484-2.25-3.609-3.328t-2.508-2.672-1.898-2.883-0.516-2.648q0-2.297 1.57-3.891t3.914-1.594q2.719 0 4.5 2.109 1.781-2.109 4.5-2.109 2.344 0 3.914 1.594t1.57 3.891q0 1.828-1.219 3.797t-2.648 3.422-4.664 4.359z"/></svg>');
            --star: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 17.25l-6.188 3.75 1.641-7.031-5.438-4.734 7.172-0.609 2.813-6.609 2.813 6.609 7.172 0.609-5.438 4.734 1.641 7.031z"/></svg>');
            --stars: 5;
            --starsize: 2.5rem;
            --symbol: var(--star);
            --value: 1;
            --w: calc(var(--stars) * var(--starsize));
            --x: calc(100% * (var(--value) / var(--stars)));
            block-size: var(--starsize);
            inline-size: var(--w);
            position: relative;
            touch-action: manipulation;
            -webkit-appearance: none;
        }
        [dir="rtl"] .rating {
            --dir: left;
        }
        .rating::-moz-range-track {
            background: linear-gradient(to var(--dir), var(--fill) 0 var(--x), var(--fillbg) 0 var(--x));
            block-size: 100%;
            mask: repeat left center/var(--starsize) var(--symbol);
        }
        .rating::-webkit-slider-runnable-track {
            background: linear-gradient(to var(--dir), var(--fill) 0 var(--x), var(--fillbg) 0 var(--x));
            block-size: 100%;
            mask: repeat left center/var(--starsize) var(--symbol);
            -webkit-mask: repeat left center/var(--starsize) var(--symbol);
        }
        .rating::-moz-range-thumb {
            height: var(--starsize);
            opacity: 0;
            width: var(--starsize);
        }
        .rating::-webkit-slider-thumb {
            height: var(--starsize);
            opacity: 0;
            width: var(--starsize);
            -webkit-appearance: none;
        }
        .rating, .rating-label {
            display: block;
            font-family: ui-sans-serif, system-ui, sans-serif;
        }
        .rating-label {
            margin-block-end: 1rem;
        }

        /* NO JS */
        .rating--nojs::-moz-range-track {
            background: var(--fillbg);
        }
        .rating--nojs::-moz-range-progress {
            background: var(--fill);
            block-size: 100%;
            mask: repeat left center/var(--starsize) var(--star);
        }
        .rating--nojs::-webkit-slider-runnable-track {
            background: var(--fillbg);
        }
        .rating--nojs::-webkit-slider-thumb {
            background-color: var(--fill);
            box-shadow: calc(0rem - var(--w)) 0 0 var(--w) var(--fill);
            opacity: 1;
            width: 1px;
        }
        [dir="rtl"] .rating--nojs::-webkit-slider-thumb {
            box-shadow: var(--w) 0 0 var(--w) var(--fill);
        }
        /* NO JS g */
        [dir="rtl"] .ratingg {
            --dir: left;
        }
        .ratingg::-moz-range-track {
            background: linear-gradient(to var(--dir), var(--fill) 0 var(--x), var(--fillbg) 0 var(--x));
            block-size: 100%;
            mask: repeat left center/var(--starsize) var(--symbol);
        }
        .ratingg::-webkit-slider-runnable-track {
            background: linear-gradient(to var(--dir), var(--fill) 0 var(--x), var(--fillbg) 0 var(--x));
            block-size: 100%;
            mask: repeat left center/var(--starsize) var(--symbol);
            -webkit-mask: repeat left center/var(--starsize) var(--symbol);
        }
        .ratingg::-moz-range-thumb {
            height: var(--starsize);
            opacity: 0;
            width: var(--starsize);
        }
        .ratingg::-webkit-slider-thumb {
            height: var(--starsize);
            opacity: 0;
            width: var(--starsize);
            -webkit-appearance: none;
        }
        .ratingg, .ratingg-label {
            display: block;
            font-family: ui-sans-serif, system-ui, sans-serif;
        }
        .ratingg-label {
            margin-block-end: 1rem;
        }

        .ratingg--nojs::-moz-range-track {
            background: var(--fillbg);
        }
        .ratingg--nojs::-moz-range-progress {
            background: var(--fill);
            block-size: 100%;
            mask: repeat left center/var(--starsize) var(--star);
        }
        .ratingg--nojs::-webkit-slider-runnable-track {
            background: var(--fillbg);
        }
        .ratingg--nojs::-webkit-slider-thumb {
            background-color: var(--fill);
            box-shadow: calc(0rem - var(--w)) 0 0 var(--w) var(--fill);
            opacity: 1;
            width: 1px;
        }
        [dir="rtl"] .ratingg--nojs::-webkit-slider-thumb {
            box-shadow: var(--w) 0 0 var(--w) var(--fill);
        }
    </style>
    <jsp:include page="headerSesionIniciada.jsp">
        <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
    </jsp:include>
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5" align="center">Función: <%=nombre%></h3>

                            <form class="form-login" method="POST" action="<%=request.getContextPath()%>/calificacion?a=calificar">
                                <input type="hidden" name="historial" value="<%=historial%>">


                                <div class="mb-3 mt-3 ms-4 me-4" align="center">
                                    <hr>
                                    <h4 class="rating-label"><strong>¿Te gustó la pelicula? <code></code></strong>
                                        <h6 ><strong><code>(Califica de 1 a 5 estrellas)</code></strong></h6>
                                        <input
                                                class="ratingg ratingg--nojs"
                                                max="5"
                                                step="1"
                                                type="range"
                                                value="3"
                                                name="funcion">
                                    </h4>

                                </div>

                                <%if (listaProfesionales.size()!=0 ){%>
                                <hr>
                                <%for (BProfesional pf : listaProfesionales){%>
                                <%if (pf.getRol().equals("d")){%>
                                <div class="mb-3 mt-3 ms-4 me-4" align="center">
                                    <h6 >Calificacion Director:</h6>
                                    <label ><%=pf.getNombre() + " "+ pf.getApellido()%></label>
                                </div>

                                <div class="mb-3 mt-3 ms-4 me-4" align="center">

                                    <input class="rating rating--nojs"
                                           max="5"
                                           step="1"
                                           type="range"
                                           value="3"
                                           name="director<%=pf.getIdProfesional()%>" required>
                                    <input type="hidden" name="idprofesionaldirector<%=pf.getIdProfesional()%>" value="<%=pf.getIdProfesional()%>">
                                </div>
                                <%}%>

                                <%}%>
                                <hr>
                                <div class="mb-3 mt-3 ms-4 me-4" align="center">
                                    <h6 >Calificacion Actor(es): </h6>
                                </div>
                                <%for (BProfesional pf : listaProfesionales){%>
                                <%if (pf.getRol().equals("a")){%>
                                <div class="mb-3 mt-3 ms-4 me-4" align="center">
                                    <label ><%=pf.getNombre() + " "+ pf.getApellido()%></label>
                                </div>
                                <div class="mb-3 mt-3 ms-4 me-4" align="center">
                                    <input class="rating rating--nojs"
                                           max="5"
                                           step="1"
                                           type="range"
                                           value="3" name="actor<%=pf.getIdProfesional()%>" placeholder="actor" required>
                                    <input type="hidden" name="idprofesionalactor<%=pf.getIdProfesional()%>" value="<%=pf.getIdProfesional()%>">
                                </div>
                                <%}%>
                                <%}%>
                                <hr>

                                <%}%>
                                <div class="mb-3 mt-3 ms-4 me-4" align="center">
                                    <a type="button" class="btn btn-secondary btn-lg" href="<%=request.getContextPath()%>/PerfildeUsuario?a=tickets" style="height: 47px;width: 100px">Volver </a>
                                    <button type="submit" class="btn btn-primary btn-lg" style="left: 10px" value="Calificar">Calificar</button>
                                </div>

                            </form>
                        </div>
                    </div>
                    <br>
                    <br>
                </div>
                <br>
                <br>
            </div>
            <br>
            <br>
        </div>
    </section>
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




       <% }else{%>

    <body>

    <jsp:include page="headerSesionIniciada.jsp">
        <jsp:param name="perfil" value="<%=usuario.getNombres()%>"/>
    </jsp:include>
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5" align="center">¡ Gracias por calificar la función! :)</h3>

                        </div>
                    </div>
                    <br>
                    <br>
                </div>
                <br>
                <br>
            </div>
            <br>
            <br>
        </div>
    </section>
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


    <%}%>





</html>
