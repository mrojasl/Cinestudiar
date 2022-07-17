package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BCompra;
import com.example.cinestudiar.beans.BProfesional;
import com.example.cinestudiar.beans.BSedeYSala;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Objects;


@MultipartConfig
@WebServlet(name = "ServAdmin", value = "/ServAdmin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminDao adminDao = new AdminDao();
        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");

        String action = request.getParameter("admin") == null? "sala" : request.getParameter("admin");
        //System.out.println(usuarioLogueado.getRol());
        if (Objects.equals(usuarioLogueado.getRol(), "admin")){
            switch(action){
                case "sala":
                    ArrayList<BSedeYSala> listaSedes = AdminDao.obtenerSedes();
                    request.setAttribute("listaSedes",listaSedes);
                    RequestDispatcher rd1 =request.getRequestDispatcher("Admin/salas.jsp");
                    rd1.forward(request,response);
                    break;

                case "operador":
                    ArrayList<BUser> listaOperadores=AdminDao.obtenerOperadores();
                    request.setAttribute("listaOperadores",listaOperadores);

                    RequestDispatcher rd2 =request.getRequestDispatcher("Admin/operadores.jsp");
                    rd2.forward(request,response);
                    break;

                case "cliente":
                    ArrayList<BUser> listaClientes= AdminDao.obtenerClientes();
                    request.setAttribute("listaClientes",listaClientes);
                    ArrayList<BCompra> historialesCompras = AdminDao.ObtenerHistorialCompra();
                    request.setAttribute("historialdecompracliente",historialesCompras);

                    RequestDispatcher rd3 =request.getRequestDispatcher("Admin/clientes.jsp");
                    rd3.forward(request,response);
                    break;

                case "profesional":
                    ArrayList<BProfesional> listaProfesionales= AdminDao.obtenerProfesionales();
                    request.setAttribute("listaProfesionales",listaProfesionales);

                    RequestDispatcher rd4 =request.getRequestDispatcher("Admin/actoresydirectores.jsp");
                    rd4.forward(request,response);
                    break;

                case "borraroperador":
                    String opcodigo = request.getParameter("opcodigo");
                    AdminDao.EliminarOperador(opcodigo);
                    response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=operador");
                    break;

                case "borrarprofesional":
                    int proid = Integer.parseInt(request.getParameter("proid"));
                    AdminDao.BorrarProfesional(proid);
                    response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=profesional");
                    break;

            }
        }
        else if (Objects.equals(usuarioLogueado.getRol(), "cliente")){
            response.sendRedirect(request.getContextPath() + "/inicio?action=registrado");
        }
        else if (Objects.equals(usuarioLogueado.getRol(), "operador")){
            response.sendRedirect(request.getContextPath() + "/OperadorServlet");
        }
        else{
            response.sendRedirect(request.getContextPath() + "/inicio");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");

        String action = request.getParameter("admin") == null? "sala" : request.getParameter("admin");


        if (Objects.equals(usuarioLogueado.getRol(), "admin")){
            switch (action) {
                case "crearsala" -> {
                    int aforo = Integer.parseInt(request.getParameter("aforo"));
                    String sede = request.getParameter("sede");
                    AdminDao.crearSala(aforo, sede);
                    response.sendRedirect(request.getContextPath() + "/ServAdmin");
                    break;
                }


                case "editaroborrarsala" -> {
                    int aforo2 = Integer.parseInt(request.getParameter("aforo2"));
                    String sede2 = request.getParameter("sede2");
                    int id = Integer.parseInt(request.getParameter("id"));


                    if (request.getParameter("editar")!=null){
                        AdminDao.editarSala(id,aforo2,aforo2,sede2);
                    } else if (request.getParameter("borrar")!=null){
                        AdminDao.borrarSala(id);
                    }
                    response.sendRedirect(request.getContextPath() + "/ServAdmin");
                    break;

                }

                case "crearprofesional" -> {
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String profesion = request.getParameter("profesion");
                    if (profesion.equalsIgnoreCase("Actor")) {
                        profesion = "a";
                    } else profesion = "d";

                    if (request.getPart("fotoperfil")!=null){
                        Part foto = request.getPart("fotoperfil");
                        InputStream fotoinput = null;
                        fotoinput = foto.getInputStream();
                        AdminDao.crearProfesional(nombre, apellido, profesion,fotoinput);
                    } else{
                        AdminDao.crearProfesional(nombre, apellido, profesion,null);
                    }

                    response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=profesional");
                    break;

                }

                case "buscaroperador" ->{
                    String txtbuscar = request.getParameter("txtbuscar");
                    request.setAttribute("listaOperadores",AdminDao.BuscarOperadorPorNombre(txtbuscar));
                    request.setAttribute("txtbuscado",txtbuscar);
                    RequestDispatcher rd2 =request.getRequestDispatcher("Admin/operadores.jsp");
                    rd2.forward(request,response);
                    break;

                }
                case "crearoperador" ->{
                    String operadorcodigo = request.getParameter("operadorcodigo");
                    AdminDao.AsignarOperador(operadorcodigo);
                    response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=operador");
                    break;
                }
                case "filtrosede" ->{
                    String parametro = request.getParameter("filtrosede");
                    if (parametro.equalsIgnoreCase("Sin Filtro")){
                        response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=cliente");
                    } else{
                        request.setAttribute("listaClientes",AdminDao.FiltrarClientePorSede(parametro));
                        RequestDispatcher rd3 =request.getRequestDispatcher("Admin/clientes.jsp");
                        ArrayList<BCompra> historialesCompras = AdminDao.ObtenerHistorialCompra();
                        request.setAttribute("historialdecompracliente",historialesCompras);
                        rd3.forward(request,response);

                    }
                    break;
                }
                case "filtroprofesional" ->{
                    String parametro = request.getParameter("filtroprof");
                    if (parametro.equals("Todo")) {
                        response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=profesional");
                    } else{
                        if (parametro.equals("Director")) {
                            parametro="d";
                        } else if (parametro.equals("Actor/Actriz")){
                            parametro="a";
                        }
                        ArrayList<BProfesional> listaProfesionales= AdminDao.ObtenerProfesionalesFiltro(parametro);
                        request.setAttribute("listaProfesionales",listaProfesionales);
                        RequestDispatcher rd4 =request.getRequestDispatcher("Admin/actoresydirectores.jsp");
                        rd4.forward(request,response);
                    }
                    break;

                }
                case "actualizarfoto"->{
                    String id = request.getParameter("id");
                    Part foto = request.getPart("fotonueva");
                    InputStream fotoinput = null;
                    fotoinput = foto.getInputStream();
                    AdminDao.actualizarFotoProf(id,fotoinput);
                    response.sendRedirect(request.getContextPath()+"/ServAdmin?admin=profesional");
                    break;
                }


            }
        }
        else{
            response.sendRedirect(request.getContextPath() + "/inicio");
        }


    }
}
