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
        String action = request.getParameter("a") == null ? "listarTodas" : request.getParameter("a");
        OperadorDao operadorDao = new OperadorDao();

        switch (action){
            case "listarTodas" -> {
                request.setAttribute("todasLasFunciones", operadorDao.TodasLasFunciones());

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/Ordenar_funciones.jsp");
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionesDisponibles" -> {
                request.setAttribute("funcionesDisponibles", operadorDao.FuncionesDisponibles());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Ordenar_funciones.jsp"));
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMejorC" -> {
                request.setAttribute("listaFunMejorCalif", operadorDao.obtenerFuncionMejorCalificada());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Ordenar_funciones.jsp"));
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMasV" -> {
                request.setAttribute("listaFunMasVis", operadorDao.obtenerFuncionMasVista());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Ordenar_funciones.jsp"));
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMenosV" -> {
                request.setAttribute("listaFunMenVis", operadorDao.obtenerFuncionMenosVista());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Ordenar_funciones.jsp"));
                requestDispatcher.forward(request,response);
            }
        }


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
