package com.example.cinestudiar.servlets;



import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.daos.CarritoDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CarritoServlet", urlPatterns = {"/Checkout"})
public class CarritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CarritoDao carritoDao= new CarritoDao();
        request.setAttribute("carritoDcompras",carritoDao.listarUsuario());

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Usuario/carrito_compras/checkout.jsp");
        requestDispatcher.forward(request,response);
        if ("borrar".equals(action)) {
            String id = request.getParameter("id");
            carritoDao.borrarReserva(id);
            response.sendRedirect(request.getContextPath() + "/Checkout");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarritoDao carritoDao= new CarritoDao();
        String action = request.getParameter("a") == null ? "lista" : request.getParameter("a");

        if ("actualizar".equals(action)) {
            BCarrito bCarrito = leerParametrosRequest(request);
            carritoDao.actualiza(bCarrito);
            response.sendRedirect(request.getContextPath() + "/Checkout");
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
        String codigoEstudiante=request.getParameter("codigoEstudiante");
        int idcompra= Integer.parseInt(request.getParameter("idcompra"));

        BCarrito bCarrito= new BCarrito();

        bCarrito.setNombre_pelicula(nombre_pelicula);
        bCarrito.setFecha(fecha);
        bCarrito.setHora(hora);
        bCarrito.setNombre_sede(nombre_sede);
        bCarrito.setCantidad_funcion(cantidad_funcion);
        bCarrito.setPrecio_ticket(precio_ticket);
        bCarrito.setImagen(imagen);
        bCarrito.setCodigoEstudiante(codigoEstudiante);
        bCarrito.setIdcompra(idcompra);


        return bCarrito;
    }
}
