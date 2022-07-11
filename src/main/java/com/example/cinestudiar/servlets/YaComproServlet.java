package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.CarritoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "YaComproServlet", value = "/ola")
public class YaComproServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();





        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CarritoDao carritoDao= new CarritoDao();

        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");
        String rol=usuarioLogueado.getRol();
        if (Objects.equals(rol, "cliente")){
            request.setAttribute("carritodecompras",carritoDao.listarUsuario(((String) request.getSession().getAttribute("codigo_pucp"))));
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Usuario/carrito_compras/ola.jsp");
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
        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");
        String action = request.getParameter("a") == null ? "lista" : request.getParameter("a");
        if ("yacompro".equals(action)) {


            HttpSession session = request.getSession();

            int min = 10;
            int max = 60;
            int random_int = (int)Math.floor(Math.random()*(max-min+1)+min);
            random_int=random_int*100;
            //System.out.println("YaComproServlet Dice:te tocó un sleep de +"+random_int);
            try {
                Thread.sleep(random_int);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            //System.out.println("------xd---------------------------------------------------------------------------------------------------------");
            //System.out.println("funciona?"+random_int);

            ArrayList<BCarrito> ComprasdelCarrito = carritoDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp"));
            boolean sePuedeComprar=true;
            for (BCarrito bCarrito : ComprasdelCarrito) {
                //System.out.println(bCarrito.getAforoOperador());
                //System.out.println(bCarrito.getCantidad_funcion());
                if (bCarrito.getCantidad_funcion()>bCarrito.getAforoOperador()){
                    sePuedeComprar=false;
                    //System.out.println("error XD");
                    break;
                }
                else if (bCarrito.getCantidad_funcion()<=0){
                    sePuedeComprar=false;
                    break;
                }
            }
            //System.out.println(sePuedeComprar);

            //System.out.println("cantidad de tiquetes es: "+request.getSession().getAttribute("cantidad_tickets"));


                 int cantidad_tickets= (int) request.getSession().getAttribute("cantidad_tickets");
                 double pago_total= (double) request.getSession().getAttribute("pago_total");


            //System.out.println(sePuedeComprar);
            //System.out.println("---------------------------------------------------------------------------------------------------------------");
            if(sePuedeComprar){

                for (BCarrito bCarrito : ComprasdelCarrito) {
                    int idCompra=bCarrito.getIdcompra();
                    int historialCompra=bCarrito.getHistorialcompra();
                    int reduccionAforoxCompra=bCarrito.getCantidad_funcion();
                    int funcion=bCarrito.getIdfuncion();
                    String codigoPUCP=bCarrito.getCodigoEstudiante();
                    carritoDao.yacompro(idCompra,historialCompra,codigoPUCP);
                    carritoDao.reducciondeAforoxCompra(reduccionAforoxCompra,funcion);
                }

                String correo=usuarioLogueado.getCorreo();
                String codigo_PUCP=usuarioLogueado.getCodigoPucp();
                String nombre=usuarioLogueado.getNombres();
                ArrayList<String> datos= new ArrayList<String>();
                datos=carritoDao.compra(cantidad_tickets,pago_total,codigo_PUCP,correo,nombre,ComprasdelCarrito);

                String idcompra= carritoDao.SolicitaidCompras(datos.get(0),datos.get(1),usuarioLogueado.getCodigoPucp());

                //System.out.println("En servlet es:"+idcompra);

//                System.out.println("-----------");
//                System.out.println(datos.get(0));
//                System.out.println(datos.get(1));
//                System.out.println(usuarioLogueado.getCodigoPucp());
//                System.out.println("Desde el servlet,, el id es "+idcompra);
//
//                System.out.println("-----------");

                for (BCarrito bCarrito : ComprasdelCarrito) {
                    int historialCompra=bCarrito.getHistorialcompra();
                    carritoDao.seteaIdCompra(historialCompra,idcompra);
                }


//                System.out.println("---------------------------------------------------------------------------------------------------------------");
//
//                System.out.println("la fecha es: "+datos.get(0)+".Y la hora es: "+datos.get(1));
//
//                System.out.println("Para este caso, la cantidad de tickets es de: "+request.getSession().getAttribute("cantidad_tickets")+" . Y," +
//                        "El pago total corresponde a: "+request.getSession().getAttribute("pago_total"));
//
//                System.out.println("---------------------------------------------------------------------------------------------------------------");

                session.removeAttribute("cantidad_tickets");
                session.removeAttribute("pago_total");


                request.getSession().setAttribute("indicadorCompraexitosa", "BuenaCompra");
                request.getSession().setAttribute("Borrarboton", "borraboton");
                response.sendRedirect(request.getContextPath() + "/ola");
            }
            else{
                request.getSession().setAttribute("Borrarboton", "borraboton");
                request.getSession().setAttribute("indicadorComprafallida", "CompraFallida");
                response.sendRedirect(request.getContextPath() + "/ola");
            }

        }
    }

}
