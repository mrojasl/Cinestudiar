<%--
  Created by IntelliJ IDEA.
  User: Jon
  Date: 5/06/2022
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <link rel="icon" href=
                "https://assets.website-files.com/60b56cdf18d38e15ce088579/60c111551dc75d6dc896a30e_pucp-favicon.png"
              type="image/x-icon">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>admin_salas</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style_admin.css">
    </head>
    <body class='snippet-body'>
        <jsp:include page="cabecera_admin.jsp"/>

        <ul class="nav nav-tabs topside">
            <li class="nav-item topsidetxt">
                <a class="nav-link active" aria-current="page" href="admin_salas.html">Salas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin_operadores.html">Operadores</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin_clientes.html">Clientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin_actores.html">Actores/Directores</a>
            </li>
        </ul>
        <div id="general">
            <div>
                <!-- Button trigger modal -->
                <button type="button" class="btn  btn-primary buttonmargin" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                    Crear Sala
                </button>

                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Crear Sala</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Nombre</span>
                                        <input type="text" class="form-control" placeholder="Nombre de Sala"
                                               aria-label="Sala 1"
                                               aria-describedby="button-addon1">
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Aforo</span>
                                        <input placeholder="1-100" type="number" name="tentacles" min="1" max="100">
                                    </div>
                                    <div class="input-group mb-3 ">
                                        <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                        <select class="form-select" id="inputGroupSelect01">
                                            <option selected>San Miguel</option>
                                            <option value="1">Surco</option>
                                            <option value="2">Miraflores</option>
                                            <option value="3">Pueblo Libre</option>
                                        </select>
                                    </div>
                                    <div class="input-group mb-3 ">

                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <button type="button" class="btn btn-primary">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="margintopsala">
                    <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
                                        aria-controls="panelsStayOpen-collapseOne">
                                    San Miguel
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse"
                                 aria-labelledby="panelsStayOpen-headingOne">
                                <div class="accordion-body">

                                    <div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 1</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 1"
                                                       aria-label="Sala 1"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>San Miguel</option>
                                                    <option value="1">Surco</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 2</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 2"
                                                       aria-label="Sala 2"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>San Miguel</option>
                                                    <option value="1">Surco</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 3</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 3"
                                                       aria-label="Sala 3"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>San Miguel</option>
                                                    <option value="1">Surco</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                        <div class="row">
                                            <h4 class="shortwidth">Sala 4</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 4"
                                                       aria-label="Sala 4"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>San Miguel</option>
                                                    <option value="1">Surco</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                        <div class="row">
                                            <h4 class="shortwidth">Sala 5</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 5"
                                                       aria-label="Sala 5"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>San Miguel</option>
                                                    <option value="1">Surco</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
                                        aria-controls="panelsStayOpen-collapseTwo">
                                    Miraflores
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse"
                                 aria-labelledby="panelsStayOpen-headingTwo">
                                <div class="accordion-body">

                                    <div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 1</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 1"
                                                       aria-label="Sala 1"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Miraflores</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Surco</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 2</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 2"
                                                       aria-label="Sala 2"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Miraflores</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Surco</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 3</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 3"
                                                       aria-label="Sala 3"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Miraflores</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Surco</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                        <div class="row">
                                            <h4 class="shortwidth">Sala 4</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 4"
                                                       aria-label="Sala 4"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Miraflores</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Surco</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false"
                                        aria-controls="panelsStayOpen-collapseThree">
                                    Surco
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse"
                                 aria-labelledby="panelsStayOpen-headingThree">
                                <div class="accordion-body">
                                    <div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 1</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 1"
                                                       aria-label="Sala 1"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Surco</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 2</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 2"
                                                       aria-label="Sala 2"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Surco</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 3</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 3"
                                                       aria-label="Sala 3"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Surco</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                        <div class="row">
                                            <h4 class="shortwidth">Sala 4</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 4"
                                                       aria-label="Sala 4"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Surco</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Miraflores</option>
                                                    <option value="3">Pueblo Libre</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false"
                                        aria-controls="panelsStayOpen-collapseFour">
                                    Pueblo Libre
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse"
                                 aria-labelledby="panelsStayOpen-headingFour">
                                <div class="accordion-body">


                                    <div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 1</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 1"
                                                       aria-label="Sala 1"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Pueblo Libre</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Surco</option>
                                                    <option value="3">Miraflores</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 2</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 2"
                                                       aria-label="Sala 2"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Pueblo Libre</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Surco</option>
                                                    <option value="3">Miraflores</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="row">
                                            <h4 class="shortwidth">Sala 3</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 3"
                                                       aria-label="Sala 3"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Pueblo Libre</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Surco</option>
                                                    <option value="3">Miraflores</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                        <div class="row">
                                            <h4 class="shortwidth">Sala 4</h4>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Nombre</span>
                                                <input type="text" class="form-control" placeholder="Sala 4"
                                                       aria-label="Sala 4"
                                                       aria-describedby="button-addon1">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <span class="input-group-text">Aforo</span>
                                                <input placeholder="20" type="number" name="tentacles" min="1"
                                                       max="100">
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <label class="input-group-text" for="inputGroupSelect01">Sede</label>
                                                <select class="form-select" id="inputGroupSelect01">
                                                    <option selected>Pueblo Libre</option>
                                                    <option value="1">San Miguel</option>
                                                    <option value="2">Surco</option>
                                                    <option value="3">Miraflores</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3 col">

                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-success">Guardar</button>
                                            </div>
                                            <div class="input-group mb-3 col">
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </div>
                                            <hr>
                                        </div>


                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
