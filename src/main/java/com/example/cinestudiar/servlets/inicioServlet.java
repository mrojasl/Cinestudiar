package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BPeliculas;
import com.example.cinestudiar.beans.BSedeYSala;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.AdminDao;
import com.example.cinestudiar.daos.ImageDao;
import com.example.cinestudiar.daos.PeliculasDao;
import com.example.cinestudiar.daos.UsuariosDao;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
@MultipartConfig
@WebServlet(name = "inicioServlet", urlPatterns = {"/inicio",""})
public class inicioServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        UsuariosDao usuariosDao = new UsuariosDao();
        PeliculasDao peliculasDao = new PeliculasDao();
        RequestDispatcher view;
        System.out.println(peliculasDao.cointaner(peliculasDao.listasPeliculas().size()));
        System.out.println(peliculasDao.valor(peliculasDao.listasPeliculas().size()));

        switch (action){
            case ""->{
                System.out.println("registrado");
                ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculas();
                request.setAttribute("listapeliculas",listapeliculas);
                request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                view = request.getRequestDispatcher("Usuario/index.jsp");
                view.forward(request, response);
            }
            case "registrar"->{
                view = request.getRequestDispatcher("Usuario/registro.jsp");
                view.forward(request, response);
            }

            case "registrado"->{
                System.out.println("Añadiendo");
                BUser usuario =leerParametrosRequest(request);
                usuariosDao.agregar(usuario);
                ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculas();
                request.setAttribute("listapeliculas",listapeliculas);
                request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                view = request.getRequestDispatcher("Usuario/in_con_sesion.jsp");
                view.forward(request, response);
            }
            case "cerrar"->{
                System.out.println("cerrando");
                ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculas();
                request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                request.setAttribute("listapeliculas",listapeliculas);
                view = request.getRequestDispatcher("Usuario/index.jsp");
                view.forward(request, response);
            }
            case "detalles"->{
                request.setAttribute("pelicula",peliculasDao.obtener_pelicula(Integer.parseInt(request.getParameter("id")),peliculasDao.listasPeliculas()));
                request.setAttribute("lista_profesionales",peliculasDao.listapeliculaprofesional(Integer.parseInt(request.getParameter("id"))));
                view = request.getRequestDispatcher("Usuario/detalles.jsp");
                view.forward(request, response);
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") ;
        UsuariosDao usuariosDao = new UsuariosDao();
        RequestDispatcher view;
        PeliculasDao peliculasDao = new PeliculasDao();

        switch (action){
            case "loguear"->{

                BUser user = leerParametrosRequest(request);

                Boolean valor=usuariosDao.loguear(user);
                if (valor){



                    BUser usuario2 =usuariosDao.rol(user);
                    String caso="";
                    if (usuario2.getRol()!=null){
                        caso = usuario2.getRol();
                    }else{
                        System.out.println("No hay usario");
                    }

                    switch (caso){
                        case "admin" ->{
                            response.sendRedirect(request.getContextPath() + "/ServAdmin");

                        }
                        case "cliente"->{
                            ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculas();
                            request.setAttribute("listapeliculas",listapeliculas);
                            request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                            request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                            view = request.getRequestDispatcher("Usuario/in_con_sesion.jsp");
                            view.forward(request, response);
                        }
                        case "operador"->{
                             view = request.getRequestDispatcher("Operador/perfilOperador.jsp");
                            view.forward(request, response);
                        }
                        default ->{
                            view = request.getRequestDispatcher("Usuario/index.jsp");
                            view.forward(request, response);
                        }
                    }
                }else{
                   view = request.getRequestDispatcher("Usuario/index.jsp");
                    view.forward(request, response);
                }


            }

            case "añadir"->{
                System.out.println("Añadiendo");
                BUser usuario =leerParametrosRequest2(request);
                usuariosDao.agregar(usuario);
                view = request.getRequestDispatcher("Usuario/registro.jsp");
                view.forward(request, response);
            }
        }

    }

    public BUser leerParametrosRequest(HttpServletRequest request) throws IOException, ServletException {
        String codigo = request.getParameter("codigo");
        String contraseña = request.getParameter("password");


        return new BUser(codigo ,contraseña);
    }

    public BUser leerParametrosRequest2(HttpServletRequest request) throws IOException, ServletException {
        String codigo_pucp = request.getParameter("codigo_pucp");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String rol = request.getParameter("rol");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("password");
        String fecha_nacimiento = request.getParameter("fecha_nacimiento");
        String direccion = request.getParameter("direccion");
        //Codigo para guardar una imagen en sql
        Part foto = request.getPart("picture");
        System.out.println(telefono);
        System.out.println(nombre);
        System.out.println(foto);
        InputStream fotoinput = null;
        if (foto.getSize() > 0) {
            fotoinput = foto.getInputStream();
        }
        String tarjeta = request.getParameter("tarjeta");

        System.out.println(codigo_pucp + nombre + apellido + telefono + dni + contraseña + correo + fecha_nacimiento + direccion + fotoinput + tarjeta);

        return new BUser(codigo_pucp, nombre, apellido, rol, dni, telefono, correo, contraseña, fecha_nacimiento, direccion, fotoinput, tarjeta);
    }

}