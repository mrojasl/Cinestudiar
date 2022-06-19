<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 5/06/2022
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <!--link-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--link-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel = "icon" href =
            "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
          type = "image/x-icon">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <!--link--stars-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .checked {
            color: orange;
        }
    </style>

    <link href="administrar_funciones.css" rel="stylesheet">
</head>
<body class='snippet-body'>

    <jsp:include page="cabecera_operador.jsp"/>

    <section class="administrador">
        <h3 class="mt-1 p-0 mb-0 ">Operador</h3>
    </section>
    <section>
        <ul class="nav nav-tabs topside d-flex justify-content-around">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="Administar_funciones_Crear.html">Crear</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Administrar_funciones_Modificar.html">Modificar</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Administrar_Funciones_Funcion.html">Funcion</a>
            </li>
        </ul>

    </section>
    <section>
        <div class="d-flex bd-highlight mb-3 mx-5 ">
            <div class="p-2 bd-highlight topnav">
                <a class="mx-2" href="Ordenar%20funciones.html">Ordenar Funciones</a>
                <a class="mx-2" href="Ordenar%20Directores.html">Ordenar Directores</a>
                <a  class="mx-2" href="Ordenar%20Actores.html">Ordenar Actores</a>
            </div>

            <div class="ms-auto p-2 bd-highlight botones">
                <button data-bs-toggle="modal" data-bs-target="#exporta_reporte">Exportar reporte</button>
                <div class="modal fade" id="exporta_reporte" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Reporte de Sala</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-2 mx-2 mb-2 d-flex-row ">
                                    <div class="d-flex flex-column bd-highlight mb-3">
                                        <div class="p-2 bd-highlight">
                                            <label class="fw-bold">Sede:</label>
                                            <br>
                                            <select style="width: 30%" class="mx-1 custom-select my-1 mr-sm-2" id="sede" name="Sede">
                                                <option value="San Miguel">San Miguel</option>
                                                <option value="Miraflores">Miraflores</option>
                                                <option value="Surco">Surco</option>
                                                <option value="Pueblo Libre">Pueblo Libre</option>
                                            </select>
                                        </div>
                                        <div class="p-2 bd-highlight">
                                            <label class="fw-bold">Sala</label><br>
                                            <select style="width: 30%" class="custom-select my-1 mr-sm-2" id="sala">
                                                <option selected></option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                        </div>
                                        <div class="p-2 bd-highlight">
                                            <label class="fw-bold" for="fecha">Fecha:</label><br>
                                            <input class="mx-1 my-2" type="date" id="fecha" name="fecha">
                                        </div>
                                    </div>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-secondary" data-bs-target="#reporte_exportado" >Exportar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section>

    <div class="mx-5 mb-1 supbarblue row">
        <div  class="input-group mb-1 col">
            <label class="fw-bold mx-1 my-2 " >Fecha de inicio:</label>
            <input class="mx-1 my-2" type="date" id="fechainicio">
        </div>

        <div class="input-group mb-1 col">
            <label class="fw-bold mx-1 my-2" >Fecha de fin:</label>
            <input class="mx-1 my-2" type="date" id="fechafin">
        </div>
        <div class="input-group mb-1 col">
            <label class="fw-bold mx-1 my-2" >Ordenar por:</label>
            <select class=" mx-1 my-2 form-select form-select-sm" >
                <option selected>Selecione su opción</option>
                <option value="1">Mejor calificado</option>
                <option value="2">Peor Calificado</option>
                <option value="1">Más visto</option>
                <option value="2">Menos visto</option>
            </select>
        </div>
    </div>
    <div class="container">
        <div class="row ">
            <section class=" d-flex justify-content-around modificar-barra pb-2 pt-2 mt-0 border border-dark">
                <h5 class="mt-2"><spam>Director 1</spam></h5>
                <div class="mt-2">
                    <spam>Calificación promedio</spam>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                </div>
                <!-- Large modal -->
            </section>
        </div>
        <div class="row ">
            <section class=" d-flex justify-content-around modificar-barra pb-2 pt-2 mt-0 border border-dark">
                <h5 class="mt-2"><spam>Director 2</spam></h5>
                <div class="mt-2">
                    <spam>Calificación promedio</spam>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                </div>
                <!-- Large modal -->
            </section>
        </div>
        <div class="row ">
            <section class=" d-flex justify-content-around modificar-barra pb-2 pt-2 mt-0 border border-dark">
                <h5 class="mt-2"><spam>Director 3</spam></h5>
                <div class="mt-2">
                    <spam>Calificación promedio</spam>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                </div>
                <!-- Large modal -->
            </section>
        </div>

    </div>



</body>
</html>