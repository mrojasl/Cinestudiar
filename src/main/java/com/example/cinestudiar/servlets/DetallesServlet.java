package com.example.cinestudiar.servlets;

import com.example.cinestudiar.daos.FuncionesDao;
import com.example.cinestudiar.daos.PeliculasDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DetallesServlet", value = "/detalles")
public class DetallesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        FuncionesDao funcionesDao = new FuncionesDao();
        PeliculasDao peliculasDao = new PeliculasDao();
        RequestDispatcher view;
        switch (action) {
            case "detalles"->{
                request.setAttribute("listafunciones",funcionesDao.listaFuncionesPorPelicula(Integer.parseInt(request.getParameter("id"))));
                request.setAttribute("pelicula",peliculasDao.obtener_pelicula(Integer.parseInt(request.getParameter("id")),peliculasDao.listasPeliculas()));
                request.setAttribute("lista_profesionales",peliculasDao.listapeliculaprofesional(Integer.parseInt(request.getParameter("id"))));
                view = request.getRequestDispatcher("Usuario/detalles.jsp");
                view.forward(request, response);
            }

            case "agregar" -> {
                String idFuncion = request.getParameter("idFuncion");
                String id = request.getParameter("id");
                System.out.println(idFuncion);
                System.out.println(request.getSession().getAttribute("codigo_pucp"));
                if (idFuncion != null) {
                    funcionesDao.agregarCarrito((String) request.getSession().getAttribute("codigo_pucp"), Integer.parseInt(idFuncion));
                    System.out.println("Se agrego al carrito");
                    response.sendRedirect(request.getContextPath()+"/detalles?action=detalles&id="+id);
                } else {
                    request.getSession().setAttribute("indicador3", "error");
                    response.sendRedirect(request.getContextPath() + "/inicio?action=detalles");
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
