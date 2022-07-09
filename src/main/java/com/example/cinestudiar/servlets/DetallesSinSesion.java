package com.example.cinestudiar.servlets;

import com.example.cinestudiar.daos.FuncionesDao;
import com.example.cinestudiar.daos.PeliculasDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DetallesSinSesion", value = "/DetallesPelicula")
public class DetallesSinSesion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String action = request.getParameter("action");
        FuncionesDao funcionesDao = new FuncionesDao();
        PeliculasDao peliculasDao = new PeliculasDao();
        RequestDispatcher view;
        if ("detalles".equals(action)) {

            request.setAttribute("listafunciones", funcionesDao.listaFuncionesPorPelicula(Integer.parseInt(request.getParameter("id"))));
            request.setAttribute("pelicula", peliculasDao.obtener_pelicula(Integer.parseInt(request.getParameter("id")), peliculasDao.listasPeliculas()));
            request.setAttribute("lista_profesionales", peliculasDao.listapeliculaprofesional(Integer.parseInt(request.getParameter("id"))));
            view = request.getRequestDispatcher("Usuario/detalles.jsp");
            view.forward(request, response);


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String peli=request.getParameter("peli");

        if ("añadir".equals(action)) {
            request.getSession().setAttribute("indicadorNologuin", " No puedes reservar una función. Para hacerlo, inicia sesión ó registrate.");
            response.sendRedirect(request.getContextPath() + "/DetallesPelicula?action=detalles&id="+peli);
        }

    }
}
