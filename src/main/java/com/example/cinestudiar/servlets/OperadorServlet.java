package com.example.cinestudiar.servlets;
import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.daos.OperadorDao;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet(name = "OperadorServlet", urlPatterns = {"/OperadorServlet"})
public class OperadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OperadorDao operadorDao = new OperadorDao();
        request.setAttribute("obtenerFuncion", operadorDao.obtenerFunciones());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/Ordenar_funciones.jsp");
        requestDispatcher.forward(request,response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
