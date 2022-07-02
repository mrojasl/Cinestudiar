package com.example.cinestudiar.servlets;
import com.example.cinestudiar.beans.BCompra;
import com.example.cinestudiar.beans.BFuncion;
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
@WebServlet(name = "OperadorServlet", urlPatterns = {"/OperadorServlet"})
public class OperadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "funciones" : request.getParameter("action");
        OperadorDao operadorDao = null;
        PeliculasDao peliculasDao = new PeliculasDao();
        try {
            operadorDao = new OperadorDao();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
        String action = request.getParameter("action") == null ? "redireccionar" : request.getParameter("action");
        OperadorDao operadorDao = null;
        try {
            operadorDao = new OperadorDao();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String filtro;
        RequestDispatcher view;

        //ArrayList<BFuncion> lista = operadorDao.TodasLasFunciones();


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
}








