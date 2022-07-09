package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BPeliculas;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.FuncionesDao;
import com.example.cinestudiar.daos.PeliculasDao;
import com.example.cinestudiar.daos.UsuariosDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "inicioServlet", urlPatterns = {"/inicio"})
public class inicioServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        UsuariosDao usuariosDao = new UsuariosDao();
        PeliculasDao peliculasDao = new PeliculasDao();
        FuncionesDao funcionesDao = new FuncionesDao();

        RequestDispatcher view;


        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");

        String rol=usuarioLogueado.getRol();
        //System.out.println(peliculasDao.cointaner(peliculasDao.listasPeliculas().size()));
        //System.out.println(peliculasDao.valor(peliculasDao.listasPeliculas().size()));
        if (Objects.equals(rol, "cliente")){
            switch (action){
//            case ""->{
//                //System.out.println("registrado");
//                ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculas();
//                request.setAttribute("listapeliculas",listapeliculas);
//                request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
//                request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
//                view = request.getRequestDispatcher("Usuario/index.jsp");
//                view.forward(request, response);
//            }
                case "registrado"->{
                    //System.out.println("Añadiendo");
                    //System.out.println(request.getSession().getAttribute("codigo_pucp"));

                    ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculasCliente();
                    request.setAttribute("listapeliculas",listapeliculas);
                    request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                    request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                    view = request.getRequestDispatcher("Usuario/in_con_sesion.jsp");
                    view.forward(request, response);
                }
                case "cerrar"->{
                    //System.out.println("cerrando");
                    request.getSession().invalidate();
                    response.sendRedirect(request.getContextPath());
                    ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculasCliente();
                    request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                    request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                    request.setAttribute("listapeliculas",listapeliculas);

                }


            }

        }
        else if (Objects.equals(rol, "admin")){
            switch (action){
                case "cerrar"->{
                    //System.out.println("cerrando");
                    request.getSession().invalidate();
                    response.sendRedirect(request.getContextPath());
                    ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculasCliente();
                    request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                    request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                    request.setAttribute("listapeliculas",listapeliculas);
                }
                default -> response.sendRedirect(request.getContextPath() + "/ServAdmin");
            }

        }
        else if (Objects.equals(rol, "operador")){
            switch (action){
                case "cerrar"->{
                    //System.out.println("cerrando");
                    request.getSession().invalidate();
                    response.sendRedirect(request.getContextPath());
                    ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculasCliente();
                    request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                    request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                    request.setAttribute("listapeliculas",listapeliculas);
                }
                default -> response.sendRedirect(request.getContextPath() + "/OperadorServlet");
            }

            //response.sendRedirect(request.getContextPath() + "/OperadorServlet");
        }
        else{
            response.sendRedirect(request.getContextPath() + "");
        }


    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        UsuariosDao usuariosDao = new UsuariosDao();
//        RequestDispatcher view;
//        BUser usuario =leerParametrosRequest2(request);
//
//        HttpSession session = request.getSession();
//
//
//        if (usuariosDao.buscarPorId(usuario.getCodigoPucp())==null && usuariosDao.buscarPorCorreo(usuario.getCorreo())==null){
//            usuariosDao.agregar(usuario);
//
//            session.setAttribute("indicador2","error");
//            response.sendRedirect(request.getContextPath()+"/inicio?action=registrar");
//        }else{
//            session.setAttribute("indicador","error");
//            response.sendRedirect(request.getContextPath()+"/inicio?action=registrar");
//        }


    }


//    public BUser leerParametrosRequest2(HttpServletRequest request) throws IOException, ServletException {
//        String codigo_pucp = request.getParameter("codigo_pucp");
//        String nombre = request.getParameter("nombre");
//        String apellido = request.getParameter("apellido");
//        String rol = request.getParameter("rol");
//        String dni = request.getParameter("dni");
//        String telefono = request.getParameter("telefono");
//        String correo = request.getParameter("correo");
//        String contraseña = request.getParameter("password");
//        String fecha_nacimiento = request.getParameter("fecha_nacimiento");
//        String direccion = request.getParameter("direccion");
//        //Codigo para guardar una imagen en sql
//        Part foto = request.getPart("picture");
//        //System.out.println(telefono);
//        //System.out.println(nombre);
//        //System.out.println(foto);
//        InputStream fotoinput = null;
//        if (foto.getSize() > 0) {
//            fotoinput = foto.getInputStream();
//        }
//        String tarjeta = request.getParameter("tarjeta");
//
//        //System.out.println(codigo_pucp + nombre + apellido + telefono + dni + contraseña + correo + fecha_nacimiento + direccion + fotoinput + tarjeta);
//
//        return new BUser(codigo_pucp, nombre, apellido, rol, dni, telefono, correo, contraseña, fecha_nacimiento, direccion, fotoinput, tarjeta);
//    }

}