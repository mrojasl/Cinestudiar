package com.example.cinestudiar.servlets;



import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.CarritoDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "CarritoServlet", urlPatterns = {"/Checkout"})
public class CarritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CarritoDao carritoDao= new CarritoDao();

        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");
        String rol=usuarioLogueado.getRol();
        if (Objects.equals(rol, "cliente")){
            request.setAttribute("carritoDcompras",carritoDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp")));

            /*--xd-*/



            /*---*/

            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Usuario/carrito_compras/checkout.jsp");
            requestDispatcher.forward(request,response);
        }
        else if (Objects.equals(rol, "admin")){
            response.sendRedirect(request.getContextPath() + "/ServAdmin");
        }
        else if (Objects.equals(rol, "operador")){
            response.sendRedirect(request.getContextPath() + "/OperadorServlet");
        }
        else{
            response.sendRedirect(request.getContextPath() + "");
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


            ArrayList<BCarrito> ComprasdelCarrito = carritoDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp"));

            boolean sePuedeComprar=true;
            for (BCarrito bCarrito : ComprasdelCarrito) {
                if (bCarrito.getCantidad_funcion()>bCarrito.getAforoOperador()){
                    sePuedeComprar=false;
                    break;
                }
                else if (bCarrito.getCantidad_funcion()<=0){
                    sePuedeComprar=false;
                    break;
                }
            }






            String tarjetaTitular=request.getParameter("tarjetaTitular");
            Pattern patternTarjeta = Pattern.compile("^[0-9]{16}$", Pattern.CASE_INSENSITIVE);
            Matcher matcherTarjeta = patternTarjeta.matcher(tarjetaTitular);
            boolean inputTarjeta = matcherTarjeta.find();

            String nombreTitular=request.getParameter("nombreTitular");
            Pattern patternnombre = Pattern.compile("^\\pL+[\\pL\\pZ\\pP]{1,45}$", Pattern.CASE_INSENSITIVE);
            Matcher matchernombre = patternnombre.matcher(nombreTitular);
            boolean inputnombre = matchernombre.find();

            String mesTitular=request.getParameter("mesTitular");
            Pattern patternmes = Pattern.compile("^[0-9]{2}$", Pattern.CASE_INSENSITIVE);
            Matcher matchermes = patternmes.matcher(mesTitular);
            boolean inputmes = matchermes.find();

            String yearTitular=request.getParameter("yearTitular");
            Pattern patternyear = Pattern.compile("^[0-9]{4}$", Pattern.CASE_INSENSITIVE);
            Matcher matcheryear = patternyear.matcher(yearTitular);
            boolean inputyear = matcheryear.find();

            String cvvTitular=request.getParameter("cvv");
            Pattern patterncvv = Pattern.compile("^[0-9]{3,4}$", Pattern.CASE_INSENSITIVE);
            Matcher matchercvv = patterncvv.matcher(cvvTitular);
            boolean inputcvv = matchercvv.find();

            if (!inputTarjeta){request.getSession().setAttribute("errorTarjeta", "Error al Comprar: tarjeta no válida");}
            if (!inputnombre){request.getSession().setAttribute("errorNombre", "Error al Comprar: Nombre no válido");}
            if (!inputmes){request.getSession().setAttribute("errorMes", "Error al Comprar: mes de expiración no válido");}
            if (!inputyear){request.getSession().setAttribute("errorYear", "Error al Comprar: año de expiración no válido");}
            if (!inputcvv){request.getSession().setAttribute("errorCvv", "Error al Comprar: Código de Seguridad de la tarjeta no válido");}




                if (sePuedeComprar && inputnombre && inputmes && inputyear && inputcvv){
                    int cantidad_tickets = Integer.parseInt(cantidad_ticketsStr);
                    double pago_total=Double.parseDouble(pago_totalStr);
                    request.getSession().setAttribute("cantidad_tickets", cantidad_tickets);
                    request.getSession().setAttribute("pago_total", pago_total);


                    response.sendRedirect(request.getContextPath() + "/ola");
                }
                else if (!sePuedeComprar){
                    request.getSession().setAttribute("Carritofallido", "CompraFallida");
                    response.sendRedirect(request.getContextPath() + "/Checkout");
                }
                else{
                    response.sendRedirect(request.getContextPath() + "/Checkout");
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

        int historialdelacompra=Integer.parseInt(request.getParameter("historialdelacompra"));

        BCarrito bCarrito= new BCarrito();

        bCarrito.setNombre_pelicula(nombre_pelicula);
        bCarrito.setFecha(fecha);
        bCarrito.setHora(hora);
        bCarrito.setNombre_sede(nombre_sede);
        bCarrito.setCantidad_funcion(cantidad_funcion);
        bCarrito.setPrecio_ticket(precio_ticket);
        bCarrito.setHistorialcompra(historialdelacompra);

        bCarrito.setIdfuncion(idfuncion);
        bCarrito.setCodigoEstudiante(codigoEstudiante);
        bCarrito.setIdcompra(idcompra);


        return bCarrito;
    }
//    public BCarrito leerParametrosRequest1(HttpServletRequest request) {
//        String nombre_pelicula=request.getParameter("nombre_pelicula");
//        String fecha=request.getParameter("fecha");
//        String hora=request.getParameter("hora");
//        String nombre_sede=request.getParameter("nombre_sede");
//        int cantidad_funcion= Integer.parseInt(request.getParameter("cantidad_funcion"));
//        int precio_ticket= Integer.parseInt(request.getParameter("precio_ticket"));
//        String imagen=request.getParameter("imagen");
//        String codigoEstudiante=request.getParameter("codigoEstudiante");
//        int idcompranuevo= Integer.parseInt(request.getParameter("contadorfuncion"));
//        int idfuncion=Integer.parseInt(request.getParameter("idfuncion"));
//
//        BCarrito bCarrito= new BCarrito();
//
//        bCarrito.setNombre_pelicula(nombre_pelicula);
//        bCarrito.setFecha(fecha);
//        bCarrito.setHora(hora);
//        bCarrito.setNombre_sede(nombre_sede);
//        bCarrito.setCantidad_funcion(cantidad_funcion);
//        bCarrito.setPrecio_ticket(precio_ticket);
//        bCarrito.setImagen(imagen);
//        bCarrito.setCodigoEstudiante(codigoEstudiante);
//        bCarrito.setIdcompra(idcompranuevo);
//
//
//        return bCarrito;
//    }
}
