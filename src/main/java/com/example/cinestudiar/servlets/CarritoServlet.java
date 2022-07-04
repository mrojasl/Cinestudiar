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


        request.setAttribute("carritoDcompras",carritoDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp")));

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Usuario/carrito_compras/checkout.jsp");
        requestDispatcher.forward(request,response);


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

        if ("borrar".equals(action)) {
            String id = request.getParameter("idborrar");
            carritoDao.borrarReserva(id);
            response.sendRedirect(request.getContextPath() + "/Checkout");
        }


        if ("comprar".equals(action)) {

            String cantidad_ticketsStr = request.getParameter("cantidad_ticketsStr");
            String pago_totalStr = request.getParameter("pago_totalStr");
            String codigo_pucp = request.getParameter("codigo_pucp");
            String correo_pucp=request.getParameter("correo_puke");


            try {
                int cantidad_tickets = Integer.parseInt(cantidad_ticketsStr);
                double pago_total=Double.parseDouble(pago_totalStr);

                carritoDao.compra(cantidad_tickets,pago_total,codigo_pucp,correo_pucp);
                response.sendRedirect(request.getContextPath() + "/ola");

            } catch (NumberFormatException e) {
                System.out.println("error al parsear");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Usuario/carrito_compras/checkout.jsp");
                requestDispatcher.forward(request, response);
            }
        }


    }


    public BCarrito leerParametrosRequest(HttpServletRequest request) {
        String nombre_pelicula=request.getParameter("nombre_pelicula");
        String fecha=request.getParameter("fecha");
        String hora=request.getParameter("hora");
        String nombre_sede=request.getParameter("nombre_sede");
        int cantidad_funcion= Integer.parseInt(request.getParameter("cantidad_funcion"));
        int precio_ticket= Integer.parseInt(request.getParameter("precio_ticket"));
        int idfuncion= Integer.parseInt(request.getParameter("idfuncion"));

        String codigoEstudiante=request.getParameter("codigoEstudiante");
        int idcompra= Integer.parseInt(request.getParameter("idcompra"));

        BCarrito bCarrito= new BCarrito();

        bCarrito.setNombre_pelicula(nombre_pelicula);
        bCarrito.setFecha(fecha);
        bCarrito.setHora(hora);
        bCarrito.setNombre_sede(nombre_sede);
        bCarrito.setCantidad_funcion(cantidad_funcion);
        bCarrito.setPrecio_ticket(precio_ticket);

        bCarrito.setIdfuncion(idfuncion);
        bCarrito.setCodigoEstudiante(codigoEstudiante);
        bCarrito.setIdcompra(idcompra);


        return bCarrito;
    }
    public BCarrito leerParametrosRequest1(HttpServletRequest request) {
        String nombre_pelicula=request.getParameter("nombre_pelicula");
        String fecha=request.getParameter("fecha");
        String hora=request.getParameter("hora");
        String nombre_sede=request.getParameter("nombre_sede");
        int cantidad_funcion= Integer.parseInt(request.getParameter("cantidad_funcion"));
        int precio_ticket= Integer.parseInt(request.getParameter("precio_ticket"));
        String imagen=request.getParameter("imagen");
        String codigoEstudiante=request.getParameter("codigoEstudiante");
        int idcompranuevo= Integer.parseInt(request.getParameter("contadorfuncion"));
        int idfuncion=Integer.parseInt(request.getParameter("idfuncion"));

        BCarrito bCarrito= new BCarrito();

        bCarrito.setNombre_pelicula(nombre_pelicula);
        bCarrito.setFecha(fecha);
        bCarrito.setHora(hora);
        bCarrito.setNombre_sede(nombre_sede);
        bCarrito.setCantidad_funcion(cantidad_funcion);
        bCarrito.setPrecio_ticket(precio_ticket);
        bCarrito.setImagen(imagen);
        bCarrito.setCodigoEstudiante(codigoEstudiante);
        bCarrito.setIdcompra(idcompranuevo);


        return bCarrito;
    }
}
