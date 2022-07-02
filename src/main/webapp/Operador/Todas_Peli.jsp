<%@ page import="com.example.cinestudiar.beans.BFuncion" %>
<%@ page import="com.example.cinestudiar.beans.BPeliculas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="Peliculas" scope="request" type="java.util.ArrayList<com.example.cinestudiar.beans.BPeliculas>"/>
<<<<<<< HEAD
<jsp:useBean id="listarPeliculas" scope="request" type="java.lang.String"/>
=======
<jsp:useBean id="listarFunciones" scope="request" type="java.lang.String"/>
>>>>>>> 8fbef29c7c315671603b0d013eca02cc9533f47c
<html>
<head>
  <meta charset="UTF-8">
  <title>Ordenar Funciones</title>

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

  <link rel="stylesheet" href="Operador/operador_style.css">
  <jsp:include page="cabecera_operador.jsp"/>
</head>
<body class='snippet-body' bgcolor="#191970">



<section class="administrador">
  <h3 class="mt-1 p-0 mb-0 ">Operador</h3>
</section>
<section>
  <ul class="navbar navbar-dark bg-dark">
    <li class="nav-item">
      <a  href="<%=request.getContextPath()%>/OperadorServlet?action=peliculas" class="navbar-brand">Películas</a>
    </li>
    <li class="nav-item">
      <a  href="<%=request.getContextPath()%>/OperadorServlet?action=funciones" class="navbar-brand">Funciones</a>
    </li>
    <li class="nav-item">
      <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe" class="navbar-brand" aria-current="page">Actores</a>
    </li>
    <li class="nav-item">
      <a href="<%=request.getContextPath()%>/OperadorServlet?action=crearFu" class="navbar-brand" aria-current="page">Directores</a>
    </li>
  </ul>

</section>
<<<<<<< HEAD
<section>
  <div class="d-flex justify-content-start">
    <div class="navbar navbar-expand-lg navbar-dark bg-primary">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/OperadorServlet?action=crearPe">Crear Película</a>
    </div>
  </div>
</section>
<form method="POST" class = "d-flex justify-content-around" action="<%=request.getContextPath()%>/OperadorServlet?action=filtro_peli">
  <div class="d-flex justify-content-around">


    <div class="form-outline form-white">
      <label class="fw-bold mx-1 my-2 text-white" >Ordenar por:</label>
      <select id ="selection_option" name="listarPeliculas" class=" form-control form-control-lg" onchange="update()" >
        <option selected value="defecto"<%=listarPeliculas.equals("defecto")?"selected":""%>>Selecione su opción</option>
        <option value="Mejor calificado" <%=listarPeliculas.equals("Mejor calificado")?"selected":""%>>Mejor calificado</option>
         </select>
    </div>
    <div class="outline">
      <button type = "submit" class = "form-control form-control-lg text-white" style="background-color: #003f9e; text-decoration-color: #dedee1">Filtrar</button>
    </div>
  </div>
</form>
=======


>>>>>>> 8fbef29c7c315671603b0d013eca02cc9533f47c
<div class="container">













  <!-- Button trigger modal -->
  <button type="button" class="btn btn-success buttonmargin" data-bs-toggle="modal"
          data-bs-target="#staticBackdrop">
    Crear Película
  </button>

  <!-- Modal -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
       tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">Crear Película</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=crearpeli" enctype="multipart/form-data">
            <div>
              <div class="input-group mb-3">
                <span class="input-group-text">Titulo</span>
                <input name="titulo" type="text" class="form-control" placeholder="Título" required="required"
                       aria-label="Sala 1"
                       aria-describedby="button-addon1">
              </div>
              <div class="input-group mb-3">
              <span class="input-group-text">Duracion</span>
              <input name="duracion" type="number" class="form-control" placeholder="Duración" required="required"
                     aria-label="Sala 1" min="0" max="400"
                     aria-describedby="button-addon1">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text">Genero</span>
                <input name="genero" type="text" class="form-control" placeholder="Género" required="required"
                       aria-label="Sala 1"
                       aria-describedby="button-addon1">
              </div>
              <label>Descripción</label>
              <div class="input-group mb-3">

                <textarea name="descripcion" style="height:500px;font-size:14pt;" maxlength="1000" class="form-control"></textarea>

              </div>
              <div class="input-group mb-3 ">
                <div class="input-group mb-3">
                  <label class="input-group-text" for="inputGroupFile01">Foto de Perfil</label>
                  <input name="fotopeli" type="file" class="form-control" id="inputGroupFile01">
                </div>
              </div>



            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
              </button>
              <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>









  <div class="row ">

    <table class="table" id = "tableUp">

        <tr>
<<<<<<< HEAD
          <th class="text-dark">IdPelícula</th>
          <th class="text-dark">Película</th>
          <th class="text-dark">Duración</th>
          <th class="text-dark">Género</th>
          <th class="text-dark">Calificacion Promedio</th>
=======
          <th class="text-white">Id</th>
          <th class="text-white">Título</th>
          <th class="text-white">Duracion (minutos)</th>
          <th class="text-white">Genero</th>
          <th class="text-white">Descripción</th>
          <th class="text-white">Calificacion Promedio</th>
>>>>>>> 8fbef29c7c315671603b0d013eca02cc9533f47c

        </tr>



      <%

<<<<<<< HEAD
        for (BPeliculas peliculas : Peliculas) { %>

      <tr>
        <td class="text-dark"><%=peliculas.getIdpeliculas()%></td>
        <td class="text-dark"><%=peliculas.getNombre()%> </td>
        <td class="text-dark"><%=peliculas.getDuracion()%> minutos</td>
        <td class="text-dark"><%=peliculas.getGenero()%></td>
        <% int num= (int) peliculas.getCalificacion();%>
=======
        for (BPeliculas pelicula : Peliculas) { %>

      <tr>
        <td class="text-white"><%=pelicula.getIdpeliculas()%></td>
        <td class="text-white"><%=pelicula.getNombre()%> </td>
        <td class="text-white"><%=pelicula.getDuracion()%></td>
        <td class="text-white"><%=pelicula.getGenero()%></td>
        <td class="text-white"><button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#descripcion<%=pelicula.getIdpeliculas()%>">Ver</button></td>


        <!-- Modal -->
        <div class="modal fade" id="descripcion<%=pelicula.getIdpeliculas()%>" tabindex="-1" aria-labelledby="descripcion<%=pelicula.getIdpeliculas()%>" aria-hidden="true">
          <form method="post" action="<%=request.getContextPath()%>/OperadorServlet?action=editarDesc">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Descripción</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <input name="id" hidden type="text" value="<%=pelicula.getIdpeliculas()%>">
                <div class="input-group">
                  <textarea name="descripcion" style="height:500px;font-size:14pt;" maxlength="1000" class="form-control"><%=pelicula.getInformación()%></textarea>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
              </div>
            </div>
          </div>
          </form>
        </div>











        <% int num= (int) pelicula.getCalificacion();%>
        <%if (num == 0){ %>
        <td class="text-white">No tiene</td>
        <%}%>
>>>>>>> 8fbef29c7c315671603b0d013eca02cc9533f47c
        <%if (num == 1){ %>
        <td>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
        </td>
        <%}%>
        <%if(num==2){%>
        <td>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
        </td>
        <%}%>
        <%if(num==3){%>
        <td>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
        </td>
        <%}%>
        <%if(num==4){%>
        <td>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star checked"></i>
          <i class="fa fa-star"></i>
        </td>
        <%}%>
        <%if(num==5){%>
        <td>
        <i class="fa fa-star checked"></i>
        <i class="fa fa-star checked"></i>
        <i class="fa fa-star checked"></i>
        <i class="fa fa-star checked"></i>
        <i class="fa fa-star checked"></i>
        </td>
        <%}%>
      </tr>

      <%
        } %>


      <!-- Large modal -->

    </table>
  </div>
</div>



</body>
</html>





