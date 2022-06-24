package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BSedeYSala;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.AdminDao;
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

@WebServlet(name = "inicioServlet", urlPatterns = {"/inicioServlet",""})
public class inicioServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        switch (action){
            case""->{
                RequestDispatcher requestDispatcher =request.getRequestDispatcher("Usuario/index.jsp");
                requestDispatcher.forward(request,response);
            }

        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        UsuariosDao usuariosDao = new UsuariosDao();

        switch (action){
            case ""->{
                System.out.println("mostrando");
                RequestDispatcher view = request.getRequestDispatcher("Usuario/index.jsp");
                view.forward(request, response);
            }
            case "loguear"->{
                System.out.println("logueando");
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
                            RequestDispatcher view = request.getRequestDispatcher("Usuario/in_con_sesion.jsp");
                            view.forward(request, response);
                        }
                        case "operador"->{
                            RequestDispatcher view = request.getRequestDispatcher("Operador/perfilOperador.jsp");
                            view.forward(request, response);
                        }
                        default ->{
                            RequestDispatcher view = request.getRequestDispatcher("Usuario/index.jsp");
                            view.forward(request, response);
                        }
                    }
                }else{
                    RequestDispatcher view = request.getRequestDispatcher("Usuario/index.jsp");
                    view.forward(request, response);
                }


            }
        }

    }

    public BUser leerParametrosRequest(HttpServletRequest request) throws IOException, ServletException {
        String nombre = request.getParameter("nombre");
        String contraseña = request.getParameter("password");

        System.out.println(nombre +contraseña);

        return new BUser(nombre ,contraseña);
    }

}