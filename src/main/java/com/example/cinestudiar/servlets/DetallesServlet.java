package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.CarritoDao;
import com.example.cinestudiar.daos.FuncionesDao;
import com.example.cinestudiar.daos.PeliculasDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DetallesServlet", value = "/detalles")
public class DetallesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");

        String action = request.getParameter("action");
        FuncionesDao funcionesDao = new FuncionesDao();
        PeliculasDao peliculasDao = new PeliculasDao();

        CarritoDao carritoDao= new CarritoDao();

        RequestDispatcher view;
        switch (action) {
            case "detalles"->{


                request.setAttribute("carritodeCliente",carritoDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp")));

                request.setAttribute("listafunciones",funcionesDao.listaFuncionesPorPelicula(Integer.parseInt(request.getParameter("id"))));
                request.setAttribute("pelicula",peliculasDao.obtener_pelicula(Integer.parseInt(request.getParameter("id")),peliculasDao.listasPeliculas()));
                request.setAttribute("lista_profesionales",peliculasDao.listapeliculaprofesional(Integer.parseInt(request.getParameter("id"))));
                view = request.getRequestDispatcher("Usuario/detalles.jsp");
                view.forward(request, response);
            }


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        FuncionesDao funcionesDao = new FuncionesDao();
        PeliculasDao peliculasDao = new PeliculasDao();
        CarritoDao carritoDao= new CarritoDao();

        ArrayList<BCarrito> carritoClientes= carritoDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp"));






        switch (action) {

            case "agregar" -> {
                String idFuncion = request.getParameter("idFuncion");
                String id = request.getParameter("id");

                int idPeli= Integer.parseInt(request.getParameter("idFuncion"));


                boolean coincidencia=false;


                for (BCarrito carrito : carritoClientes) {

                    if (carrito.getIdfuncion() == idPeli) {
                        coincidencia = true;
                        break;
                    }

                }


                if (idFuncion != null && !coincidencia) {
                    funcionesDao.agregarCarrito((String) request.getSession().getAttribute("codigo_pucp"), Integer.parseInt(idFuncion));
                    //System.out.println("Se agrego al carrito");
                    request.getSession().setAttribute("indicadorReserva", "success");
                    response.sendRedirect(request.getContextPath()+"/detalles?action=detalles&id="+id);
                } else {
                    request.getSession().setAttribute("indicadorReservaFallida", "failure");
                    response.sendRedirect(request.getContextPath()+"/detalles?action=detalles&id="+id);
                }
            }

        }

    }
}
