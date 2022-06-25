package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.ImageDao;
import com.example.cinestudiar.daos.UsuariosDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(name = "UsuarioRegistroServlet", urlPatterns = {"/Usuario"})
public class UsuarioRegistroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "sin_registrar" : request.getParameter("action");
        UsuariosDao usuariosDao = new UsuariosDao();
        ImageDao imagenesDao = new ImageDao();
        int id=1;
        switch (action){
            case "sin_registrar"->{
                System.out.println("registrado");
                //byte[] imagen = imagenesDao.obtenerimagenes(id);
                //request.setAttribute("imagen",imagen);
                RequestDispatcher view = request.getRequestDispatcher("Usuario/index.jsp");
                view.forward(request, response);
            }
            case "registrado"->{
                System.out.println("Añadiendo");
                BUser usuario =leerParametrosRequest(request);
                usuariosDao.agregar(usuario);
                RequestDispatcher view = request.getRequestDispatcher("Usuario/in_con_sesion.jsp");
                view.forward(request, response);
            }
        }


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "muestra_registro" : request.getParameter("action");

        UsuariosDao usuariosDao = new UsuariosDao();

        switch (action){
            case "muestra_registro"->{
                System.out.println("mostrando");
                RequestDispatcher view = request.getRequestDispatcher("registro.jsp");
                view.forward(request, response);
            }
            case "añadir"->{
                System.out.println("Añadiendo");
                BUser usuario =leerParametrosRequest(request);
                usuariosDao.agregar(usuario);
                RequestDispatcher view = request.getRequestDispatcher("Usuario/registro.jsp");
                view.forward(request, response);
            }
        }




    }
    public BUser leerParametrosRequest(HttpServletRequest request) throws IOException, ServletException {
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
