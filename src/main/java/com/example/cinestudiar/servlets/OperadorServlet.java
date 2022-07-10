package com.example.cinestudiar.servlets;
import com.example.cinestudiar.DTO.DTOfunciones_peliculas;
import com.example.cinestudiar.beans.*;
import com.example.cinestudiar.daos.AdminDao;
import com.example.cinestudiar.daos.OperadorDao;
import com.example.cinestudiar.daos.PeliculasDao;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.ws.rs.core.Request;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Array;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "OperadorServlet", urlPatterns = {"/OperadorServlet"})
public class OperadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "funciones" : request.getParameter("action");
        //OperadorDao operadorDao = null;
        PeliculasDao peliculasDao = new PeliculasDao();
        OperadorDao operadorDao = new OperadorDao();
        String filtro = request.getParameter("listarFunciones");
        //if (filtro == "Funciones Disponibles") {
        //
        //}else {
        //  ArrayList<BFuncion> lista = operadorDao.TodasLasFunciones();
        //}
        //ArrayList<BFuncion> lista = operadorDao.FuncionesDisponibles();

        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");
        String rol=usuarioLogueado.getRol();
        RequestDispatcher requestDispatcher;

        if (Objects.equals(usuarioLogueado.getRol(), "operador")){
            switch (action) {

                case "funciones" -> {
                    request.setAttribute("listarFunciones", "");
                    request.setAttribute("Funciones", operadorDao.filtradoFunciones(""));
                    request.setAttribute("listapelicula1",operadorDao.obtenerlistaPeliculas());
                    request.setAttribute("listaSalas", operadorDao.obtenerSala());
                    request.setAttribute("listaPersonal", operadorDao.obtenerPersonal());
                    requestDispatcher = request.getRequestDispatcher("Operador/Todas_func.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                }
                case "crearFu" ->{
                    request.setAttribute("listaPersonal",operadorDao.obtenerPersonal());
                    requestDispatcher = request.getRequestDispatcher("Operador/personal.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                }
                case "crearPe" ->{
                    ArrayList<BProfesional> listaProfesionales= AdminDao.obtenerProfesionales();
                    request.setAttribute("listaProfesionales",listaProfesionales);
                    request.setAttribute("listaPeliculas", peliculasDao.listasPeliculas());
                    requestDispatcher = request.getRequestDispatcher("Operador/profesionalOperador.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                }
                case "peliculas"->{
                    ArrayList<BPeliculas> listaPeliculas = peliculasDao.listasPeliculas();

                    request.setAttribute("directores",peliculasDao.listaDirector());
                    request.setAttribute("actores",peliculasDao.listaActor());
                    request.setAttribute("Peliculas", listaPeliculas);
                    requestDispatcher = request.getRequestDispatcher("Operador/Todas_Peli.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                }

                case "borrarpeli"->{
                    if (request.getParameter("id") != null) {
                        String idpeliString = request.getParameter("id");
                        int idpeli = 0;
                        try {
                            idpeli = Integer.parseInt(idpeliString);

                            request.setAttribute("Peliculas", peliculasDao.listasPeliculas());
                        } catch (NumberFormatException ex) {
                            response.sendRedirect("OperadorServlet?action=peliculas");
                        }

                        BPeliculas peli = peliculasDao.obtenerPelicula(idpeli);

                    if ( peli != null) {
                        peliculasDao.borrarFunciondeunaPelicula(idpeli);
                        peliculasDao.borrarPelicula(idpeli);
                    }
                }
                response.sendRedirect("OperadorServlet?action=peliculas");
                break;
        }
           /* case "agregarFun"->{ //ESTO VA PARA LA CREACIÓN DE FUNCIÓN
                request.setAttribute("listapelicula1",operadorDao.obtenerlistaPeliculas());
                request.setAttribute("listaSalas", operadorDao.obtenerSala());
                request.setAttribute("listaPersonal", operadorDao.obtenerPersonal());
                requestDispatcher=request.getRequestDispatcher("Operador/Todas_func.jsp");
                requestDispatcher.forward(request,response);
                break;
            }*/

            /*case " " -> {
                //ArrayList<BFuncion> lista = null;
                if (request.getParameter("listarFunciones")!=null){
                    request.setAttribute("Funciones", lista);

                }else{
                    request.setAttribute("Funciones", operadorDao.filtradoFunciones(filtro, lista));
                }
                view= request.getRequestDispatcher("Operador/Todas_func.jsp");
                view.forward(request,response);
            }
            */

            /*
            case "filtrado" ->{

                if(request.getParameter("id")!= null){
                    request.setAttribute("funcionesDisponibles", operadorDao.FuncionesDisponibles());
                    request.setAttribute("listaFunMejorCalif", operadorDao.obtenerFuncionMejorCalificada());
                    view = request.getRequestDispatcher("employees/formularioEditar.jsp");
                    view.forward(request, response);
                }
                else{
                    response.sendRedirect("OperadorServlet");
                }
            }
            case "listarFuncionesDisponibles" -> {

                String valor = request.getParameter("funcionesDisponibles");
                System.out.println(valor);
                request.setAttribute("funcionesDisponibles", operadorDao.FuncionesDisponibles());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher("Operador/Ordenar_funciones/Func_Disp.jsp");
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMejorC" -> {
                request.setAttribute("listaFunMejorCalif", operadorDao.obtenerFuncionMejorCalificada());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher("Operador/Ordenar_funciones/Todas_func.jsp");
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMasV" -> {
                request.setAttribute("listaFunMasVis", operadorDao.obtenerFuncionMasVista());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Ordenar_funciones/Todas_func.jsp"));
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMenosV" -> {
                request.setAttribute("listaFunMenVis", operadorDao.obtenerFuncionMenosVista());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Ordenar_funciones/Todas_func.jsp"));
                requestDispatcher.forward(request,response);
            }

             */
            }
        }
        else if (Objects.equals(rol, "cliente")){
            response.sendRedirect(request.getContextPath() + "/inicio?action=registrado");
        }
        else if (Objects.equals(rol, "admin")){
            response.sendRedirect(request.getContextPath() + "/ServAdmin");
        }
        else{
            response.sendRedirect(request.getContextPath() + "/inicio");
        }












    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String action = request.getParameter("action") ;
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "redireccionar" : request.getParameter("action");
        //OperadorDao operadorDao = null;
        OperadorDao operadorDao = new OperadorDao();
        String filtro;
        PeliculasDao peliculasDao = new PeliculasDao();
        RequestDispatcher view;

        BFuncion funciones;
        //ArrayList<BFuncion> lista = operadorDao.TodasLasFunciones();
        String filtro2;

        switch (action) {

            case "filtro_func" -> {
                System.out.println("HOLAAA");
                filtro = request.getParameter("listarFunciones");
                request.setAttribute("listapelicula1",operadorDao.obtenerlistaPeliculas());
                request.setAttribute("listaSalas", operadorDao.obtenerSala());
                request.setAttribute("listaPersonal", operadorDao.obtenerPersonal());
                request.setAttribute("Funciones", operadorDao.filtradoFunciones(filtro));
                request.setAttribute("listarFunciones", filtro);
                view = request.getRequestDispatcher("Operador/Todas_func.jsp");
                view.forward(request, response);
                break;
            }

            case "filtro_peli" -> {
                System.out.println("HOLAAA Peli");
                filtro2 = request.getParameter("listarPeliculas");
                request.setAttribute("Peliculas", operadorDao.filtradoPelicula(filtro2));
                request.setAttribute("listarPeliculas", filtro2);
                view = request.getRequestDispatcher("Operador/Todas_Peli.jsp");
                view.forward(request, response);
                break;
            }


            case "editarDesc" ->{
                int id = Integer.parseInt(request.getParameter("id"));
                String desc = request.getParameter("descripcion");
                OperadorDao.EditarDescripcion(id,desc);
                response.sendRedirect(request.getContextPath() + "/OperadorServlet?action=peliculas");

            }
            case "editarPort" ->{
                int id = Integer.parseInt(request.getParameter("id"));
                Part foto = request.getPart("fotonueva");
                InputStream fotoinput = null;
                fotoinput = foto.getInputStream();
                peliculasDao.ActualizarPortadaPeli(id,fotoinput);
                response.sendRedirect(request.getContextPath() + "/OperadorServlet?action=peliculas");

            }
            case "crearpeli" ->{
                String titulo = request.getParameter("titulo");
                int duracion = Integer.parseInt(request.getParameter("duracion"));
                String genero = request.getParameter("genero");
                String descripcion = request.getParameter("descripcion");
                Part foto = request.getPart("fotopeli");
                InputStream fotoinput = null;
                fotoinput = foto.getInputStream();

                peliculasDao.crearPelicula(titulo,duracion,genero,fotoinput,descripcion);
                response.sendRedirect(request.getContextPath() + "/OperadorServlet?action=peliculas");

            }
            case "buscarpelicula" ->{
                String txtbuscar = request.getParameter("txtbuscar");

                request.setAttribute("directores",peliculasDao.listaDirector());
                request.setAttribute("actores",peliculasDao.listaActor());
                request.setAttribute("txtbuscado",txtbuscar);
                request.setAttribute("Peliculas", peliculasDao.buscarPeliculaporNombre(txtbuscar));
                view = request.getRequestDispatcher("Operador/Todas_Peli.jsp");
                view.forward(request, response);

            }
            case "crearFunciones"->{
                funciones =new BFuncion();
                String fecha = request.getParameter("fecha");
                String hora = request.getParameter("hora");
                LocalTime horaTime = LocalTime.parse(hora);
                int idSala = Integer.parseInt(request.getParameter("idSala"));
                funciones.setFecha(fecha);
                funciones.setHora(hora);
                funciones.setIdSala(idSala);

                int centi = 0;
                ArrayList<DTOfunciones_peliculas> listaFuConDu = operadorDao.listaFuncionesDuracion();
                for (DTOfunciones_peliculas fu : listaFuConDu){
                    if (fu.getIdSala()==idSala){
                        if(fu.getFecha().equals(fecha)){
                            if(horaTime.isAfter(LocalTime.parse(fu.getHora()).minusMinutes(1)) && horaTime.isBefore(LocalTime.parse(fu.getHora()).plusMinutes(fu.getDuracion()))){
                                request.getSession().setAttribute("errorCrear","Intento fallido, cruce con la función de ID: "+fu.getIdFuncion());
                                centi = 1;
                                break;
                            }
                        }
                    }
                }

                if (centi==0){
                    funciones.setPrecioTicket(Integer.parseInt(request.getParameter("precio_ticket")));
                    funciones.setEdadMinima(Integer.parseInt(request.getParameter("edad_minima")));
                    funciones.setIdPersonal(Integer.parseInt(request.getParameter("idPersonal")));
                    funciones.setIdPelicula(Integer.parseInt(request.getParameter("idPelicula")));
                    funciones.setAforoOperador(Integer.parseInt(request.getParameter("aforoOperador")));
                    operadorDao.crearFuncion(funciones);
                }

                response.sendRedirect("OperadorServlet");
            }
            case "crearpersonal" ->{
                String jefe = request.getParameter("jefe");
                String p1 = request.getParameter("p1");
                String p2 = request.getParameter("p2");
                operadorDao.crearPersonal(jefe,p1,p2);
                response.sendRedirect("OperadorServlet?action=crearFu");
            }
            case "buscarpersonal" ->{
                String txtbuscar = request.getParameter("txtbuscar");
                request.setAttribute("txtbuscado",txtbuscar);
                request.setAttribute("listaPersonal",operadorDao.obtenerPersonalPorNombre(txtbuscar));
                view = request.getRequestDispatcher("Operador/personal.jsp");
                view.forward(request, response);

            }
            case "buscarprofesional" ->{
                String txtbuscar = request.getParameter("txtbuscar");
                request.setAttribute("txtbuscado",txtbuscar);
                request.setAttribute("listaPeliculas", peliculasDao.listasPeliculas());
                ArrayList<BProfesional> listaProfesionales= operadorDao.obtenerProfesionalesPorNombre(txtbuscar);
                request.setAttribute("listaProfesionales",listaProfesionales);
                view = request.getRequestDispatcher("Operador/profesionalOperador.jsp");
                view.forward(request, response);

            }
            case "asignarpelicula" ->{
                int idProf = Integer.parseInt(request.getParameter("id"));
                int idPel = Integer.parseInt(request.getParameter("idPel"));
                operadorDao.asignarProfesionalaPelicula(idPel,idProf);
                response.sendRedirect("OperadorServlet?action=crearPe");
            }
            case "retirarpelicula" ->{
                int idProf = Integer.parseInt(request.getParameter("id"));
                int idPel2 = Integer.parseInt(request.getParameter("idPel2"));
                operadorDao.borrarProfesionaldePelicula(idPel2,idProf);
                response.sendRedirect("OperadorServlet?action=crearPe");
            }
            case "editarFuncion" ->{
                int idFuncion = Integer.parseInt(request.getParameter("id"));
                String fecha = request.getParameter("fecha");
                String hora = request.getParameter("hora");
                int precio = Integer.parseInt(request.getParameter("precio"));
                peliculasDao.actualizarFuncion(fecha,hora,precio,idFuncion);
                response.sendRedirect("OperadorServlet?action=funciones");

            }

        }
    }
    public BFuncion leerParametrosCrearFuncion (HttpServletRequest request) throws IOException, ServletException {
        String pelicula = request.getParameter("pelicula");
        String hora = request.getParameter("hora_func");
        String precio = request.getParameter("precio");
        String edad_min = request.getParameter("edad_min");
        String id_personal = request.getParameter("id_perso");
        String id_sala = request.getParameter("id_sala");
        String id_peli = request.getParameter("id_pelicula");
        //Codigo para guardar una imagen en sql


        return new BFuncion(pelicula, hora, precio, edad_min, id_personal, id_sala, id_peli);

    }
    public BPeliculas leerParametroPelicula (HttpServletRequest request) throws IOException, ServletException{
        String nombre = request.getParameter("nombre_peli");
        System.out.println(nombre + "LLEGO NOMBRE");
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        String genero = request.getParameter("genero");
        Part foto_peli = request.getPart("image_peli");
        InputStream fotoinput = null;
        if (foto_peli.getSize() > 0) {
            fotoinput = foto_peli.getInputStream();
        }
        return new BPeliculas(nombre, duracion, genero, fotoinput);
    }
}