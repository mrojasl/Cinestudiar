package com.example.cinestudiar.servlets;
import com.example.cinestudiar.beans.BCompra;
import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.beans.BPeliculas;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.AdminDao;
import com.example.cinestudiar.daos.OperadorDao;
import com.example.cinestudiar.daos.PeliculasDao;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;

@MultipartConfig
@WebServlet(name = "OperadorServlet", urlPatterns = {"/OperadorServlet"})
public class OperadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "funciones" : request.getParameter("action");
        OperadorDao operadorDao = null;
        PeliculasDao peliculasDao = new PeliculasDao();
        operadorDao = new OperadorDao();
        String filtro = request.getParameter("listarFunciones");
        //if (filtro == "Funciones Disponibles") {
        //
        //}else {
        //  ArrayList<BFuncion> lista = operadorDao.TodasLasFunciones();
        //}
        //ArrayList<BFuncion> lista = operadorDao.FuncionesDisponibles();
        RequestDispatcher requestDispatcher;
        switch (action) {

            case "funciones" -> {
                request.setAttribute("listarFunciones", "");
                request.setAttribute("Funciones", operadorDao.filtradoFunciones(""));
                requestDispatcher = request.getRequestDispatcher("Operador/Todas_func.jsp");
                requestDispatcher.forward(request, response);
                break;
            }
            case "crearFu" ->{
                requestDispatcher = request.getRequestDispatcher("Operador/crearFuncion.jsp");
                requestDispatcher.forward(request, response);
                break;
            }
            case "crearPe" ->{
                requestDispatcher = request.getRequestDispatcher("Operador/crearPelicula.jsp");
                requestDispatcher.forward(request, response);
                break;
            }
            case "peliculas"->{
                request.setAttribute("listarFunciones", "");
                request.setAttribute("Peliculas", peliculasDao.listasPeliculas());
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

                        peliculasDao.borrarPelicula(idpeli);
                    }
                }
                response.sendRedirect("OperadorServlet?action=peliculas");
                break;
        }

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String action = request.getParameter("action") ;
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "redireccionar" : request.getParameter("action");
        OperadorDao operadorDao = null;
        operadorDao = new OperadorDao();
        String filtro;
        PeliculasDao peliculasDao = new PeliculasDao();
        RequestDispatcher view;

        //ArrayList<BFuncion> lista = operadorDao.TodasLasFunciones();
        String filtro2;

        switch (action) {

            case "filtro_func" -> {
                System.out.println("HOLAAA");
                filtro = request.getParameter("listarFunciones");
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

            case "crearFuncion" -> {
                System.out.println("Añadiendo");
                BFuncion funcion = leerParametrosCrearFuncion(request);
                operadorDao.crearFuncion(funcion);
                view = request.getRequestDispatcher("Usuario/registro.jsp");
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

                request.setAttribute("txtbuscado",txtbuscar);
                request.setAttribute("listarFunciones", "");
                request.setAttribute("Peliculas", peliculasDao.buscarPeliculaporNombre(txtbuscar));
                view = request.getRequestDispatcher("Operador/Todas_Peli.jsp");
                view.forward(request, response);

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