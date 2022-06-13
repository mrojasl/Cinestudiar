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


            case "crear":
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Usuario/registro.jsp");
                requestDispatcher.forward(request, response);

            case "profesional":

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        BUser cliente = new BUser();



    }
}
