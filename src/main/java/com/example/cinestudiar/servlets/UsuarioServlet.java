package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.*;
import com.example.cinestudiar.daos.AdminDao;
import com.example.cinestudiar.daos.UsuariosDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("usario") == null? "pelicula" : request.getParameter("usario");

        switch(action){
            case "pelicula":
                ArrayList<BFuncion> listarPeliculas = UsuariosDao.obtenerFunciones();
                request.setAttribute("listarPeliculas",listarPeliculas);

                RequestDispatcher rd1 =request.getRequestDispatcher("Usuario/inicio_sin_sesion.jsp");
                rd1.forward(request,response);

            case "agregar":



            case "profesional":

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("u") == null ? "Listar" : request.getParameter("u");
        BUser cliente = new BUser();
        switch (action) {
            case "crear" -> {

                    String codigoPucp= cliente.getCodigoPucp();
                    String nombres=cliente.getNombres();
                    String apellidos= cliente.getApellidos();
                    String rol= cliente.getRol();
                    String dni= cliente.getDni();
                    String telefono= cliente.getTelefono();
                    String correo= cliente.getCorreo();
                    String contrasena= cliente.getContrasena();
                    String fechaNacimiento= cliente.getFechaNacimiento();
                    String direccion= cliente.getDireccion();
                    Blob foto= cliente.getFoto();
                    String datosTarjeta= cliente.getDatosTarjeta();

                    UsuariosDao.añadir(codigoPucp,nombres,apellidos,rol,dni,telefono,correo,contrasena,fechaNacimiento,direccion,foto,datosTarjeta);

                    response.sendRedirect(request.getContextPath() + "/UsuarioServlet");



            }
            case "buscar" -> {

            }
        }
    }

    public static BUser crearUsario(HttpServletRequest requestUsuario){
        BUser cliente= new BUser();
        String nombre = requestUsuario.getParameter("nombre");
        String apellido = requestUsuario.getParameter("apellido");
        String codigoPucp = requestUsuario.getParameter("codigoPucp");
        String rol = requestUsuario.getParameter("rol");
        String dni = requestUsuario.getParameter("dni");
        String telefono = requestUsuario.getParameter("telefono");
        String correo = requestUsuario.getParameter("correo");
        String contrasena = requestUsuario.getParameter("contrasena");
        String fechaNacimiento = requestUsuario.getParameter("fechaNacimiento");
        String direccion = requestUsuario.getParameter("direccion");
        /*Blod foto = requestUsuario.getParameter("foto");*/
        String datosTarjeta = requestUsuario.getParameter("datosTarjeta");

        cliente.setNombres("nombre");
        cliente.setApellidos("apellido");
        cliente.setCodigoPucp("codigoPucp");
        cliente.setRol("rol");
        cliente.setDni("dni");
        cliente.setTelefono("telefono");
        cliente.setCorreo("correo");
        cliente.setContrasena("contraseña");
        cliente.setFechaNacimiento("fechaNacimiento");
        cliente.setDireccion("direccion");
        /*cliente.setFoto("foto");*/
        cliente.setDatosTarjeta("datosTarjeta");
        return cliente;
    }
}
