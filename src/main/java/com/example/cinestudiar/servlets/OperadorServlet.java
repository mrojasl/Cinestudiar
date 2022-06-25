package com.example.cinestudiar.servlets;
import com.example.cinestudiar.beans.BCompra;
import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.daos.AdminDao;
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
        String action = request.getParameter("action") == null ? "listarTodas" : request.getParameter("action");
        OperadorDao operadorDao = new OperadorDao();
        RequestDispatcher view;
        switch (action){



            case "listarTodas" -> {

                request.setAttribute("listarFunciones","");
                request.setAttribute("todasLasFunciones", operadorDao.TodasLasFunciones());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/Todas_func.jsp");
                requestDispatcher.forward(request,response);
            }
            /*
            case "filtrado" ->{

                if(request.getParameter("id")!= null){
                    request.setAttribute("funcionesDisponibles", operadorDao.FuncionesDisponibles());
                    request.setAttribute("listaFunMejorCalif", operadorDao.obtenerFuncionMejorCalificada());
                    view = request.getRequestDispatcher("employees/formularioEditar.jsp");
                    view.forward(request, response);
                }
                else{
                    response.sendRedirect("OperadorServlet");
                }
            }
            case "listarFuncionesDisponibles" -> {

                String valor = request.getParameter("funcionesDisponibles");
                System.out.println(valor);
                request.setAttribute("funcionesDisponibles", operadorDao.FuncionesDisponibles());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher("Operador/Ordenar_funciones/Func_Disp.jsp");
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMejorC" -> {
                request.setAttribute("listaFunMejorCalif", operadorDao.obtenerFuncionMejorCalificada());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher("Operador/Ordenar_funciones/Todas_func.jsp");
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMasV" -> {
                request.setAttribute("listaFunMasVis", operadorDao.obtenerFuncionMasVista());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Ordenar_funciones/Todas_func.jsp"));
                requestDispatcher.forward(request,response);
            }
            case "listarFuncionMenosV" -> {
                request.setAttribute("listaFunMenVis", operadorDao.obtenerFuncionMenosVista());

                RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Ordenar_funciones/Todas_func.jsp"));
                requestDispatcher.forward(request,response);
            }

             */
        }


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listarTodas" : request.getParameter("action");
        OperadorDao operadorDao = new OperadorDao();
        RequestDispatcher view;
        String filtro;
       // String action = request.getParameter("a") == null ? "listarTodas" : request.getParameter("a");
        switch (action){

            case "filtro_func":
                System.out.println("HOLAAA");
                filtro = request.getParameter("listarFunciones");
                try{
                    if (filtro == "Funciones Disponibles"){
                        request.setAttribute("funcionesDisponibles", operadorDao.FuncionesDisponibles());
                        RequestDispatcher requestDispatcher=request.getRequestDispatcher("Operador/Func_Disp.jsp");
                        requestDispatcher.forward(request,response);
                    }
                    if (filtro == "Mejor calificado"){
                        request.setAttribute("listaFunMejorCalif", operadorDao.obtenerFuncionMejorCalificada());
                        RequestDispatcher requestDispatcher=request.getRequestDispatcher("Operador/Todas_func.jsp");
                        requestDispatcher.forward(request,response);
                    }
                    if (filtro == "Más visto"){
                        request.setAttribute("listaFunMasVis", operadorDao.obtenerFuncionMasVista());
                        RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Todas_func.jsp"));
                        requestDispatcher.forward(request,response);
                    }
                    if (filtro == "Menos visto"){
                        request.setAttribute("listaFunMenVis", operadorDao.obtenerFuncionMenosVista());
                        RequestDispatcher requestDispatcher=request.getRequestDispatcher(("Operador/Todas_func.jsp"));
                        requestDispatcher.forward(request,response);
                    }
                }catch (NumberFormatException e){

                }

        }
    }
}
