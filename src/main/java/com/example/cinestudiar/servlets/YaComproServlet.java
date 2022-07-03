package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.daos.CarritoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "YaComproServlet", value = "/ola")
public class YaComproServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CarritoDao carritoDao= new CarritoDao();
        request.setAttribute("carritodecompras",carritoDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp")));
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Usuario/carrito_compras/ola.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarritoDao carritoDao= new CarritoDao();
        String action = request.getParameter("a") == null ? "lista" : request.getParameter("a");
        if ("yacompro".equals(action)) {
            BCarrito bCarrito = leerParametrosRequest(request);
            carritoDao.yacompro(bCarrito);
            response.sendRedirect(request.getContextPath() + "/ola");
        }
    }
    public BCarrito leerParametrosRequest(HttpServletRequest request) {
        String nombre_pelicula=request.getParameter("nombre_pelicula");
        String fecha=request.getParameter("fecha");
        String hora=request.getParameter("hora");
        String nombre_sede=request.getParameter("nombre_sede");
        int cantidad_funcion= Integer.parseInt(request.getParameter("cantidad_funcion"));
        int precio_ticket= Integer.parseInt(request.getParameter("precio_ticket"));
        String imagen=request.getParameter("imagen");
        int funcion= Integer.parseInt(request.getParameter("idfuncion"));
        String codigoEstudiante=request.getParameter("codigoEstudiante");
        int idcompra= Integer.parseInt(request.getParameter("idcompra"));
        int historialcompra=Integer.parseInt(request.getParameter("historialcompra"));

        BCarrito bCarrito= new BCarrito();

        bCarrito.setNombre_pelicula(nombre_pelicula);
        bCarrito.setFecha(fecha);
        bCarrito.setHora(hora);
        bCarrito.setNombre_sede(nombre_sede);
        bCarrito.setCantidad_funcion(cantidad_funcion);
        bCarrito.setPrecio_ticket(precio_ticket);
        bCarrito.setImagen(imagen);
        bCarrito.setIdfuncion(funcion);
        bCarrito.setCodigoEstudiante(codigoEstudiante);
        bCarrito.setIdcompra(idcompra);
        bCarrito.setHistorialcompra(historialcompra);


        return bCarrito;
    }
}
