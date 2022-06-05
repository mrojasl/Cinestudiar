package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.AdminDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*try(PrintWriter printWriter = response.getWriter()) {
            printWriter.println("Hola Mundo");
        }*/
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("Admin/salas.jsp");
        requestDispatcher.forward(request,response);

        /*ArrayList<BUser> listaOperadores = AdminDao.obtenerOperadores();
        request.setAttribute("listaOperadores",listaOperadores);
        RequestDispatcher view = request.getRequestDispatcher("listaOperadores.jsp");
        view.forward(request,response);*/



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
